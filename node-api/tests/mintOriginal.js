const dataset = require('./dataset/result.json');
const GeneratePdf = require('../utils/generatePDF');
const fetch = require('node-fetch');

const crypto = require('crypto');
const fs = require('fs');

var testResult = {};

async function mintNew() {

    for (let i = 0; i < 100; i++) {
        var res = await fetch(
            'http://localhost:8080/prescription/new?test=true', 
            { 
                method: 'POST', 
                body: JSON.stringify({
                    name: i.toString(),
                    prescription: dataset[i] 
                }),
                headers: { 'Content-Type': 'application/json' }
            }
        );

        testResult[i] = { actual_original: true };
    }
    
}

async function mintFake () {

    for (let i = 100; i < 150; i++) {
        let docDetails = new GeneratePdf.DocDetails(
            dataset[i]['doctor'].name,
            dataset[i]['doctor'].qualification,
            dataset[i]['doctor'].specialization
        );
    
        let patientDetails = new GeneratePdf.PatientDetails(
            dataset[i]['patient'].name,
            dataset[i]['patient'].contact_no
        )
    
        let resGeneratePdf = await GeneratePdf.generatePDF(
            dataset[i]['meds'],
            docDetails,
            patientDetails,
            i.toString() + '.pdf'
        );

        testResult[i] = { actual_original: false };

    }

}

async function checkNew() {

    for (let i = 0; i < 100; i++) {

        const fileBuffer = fs.readFileSync("../prescriptions/" + i.toString() + '.pdf');
        let hashSum = crypto.createHash('sha256');
        hashSum.update(fileBuffer);
        const hex = hashSum.digest('hex');

        var res = await fetch(
            'http://localhost:8080/prescription/lookup/', 
            { 
                method: 'POST', 
                body: JSON.stringify({
                    fileHash: hex
                }),
                headers: { 'Content-Type': 'application/json' }
            }
        );
        
        testResult[i] = {
            ...testResult[i], 
            ...{
                fileIndex: i,
                fileHash: hex,
                original: res.status == 200
            }
        };
        
    }
}

async function checkEdit() {

    for (let i = 100; i < 150; i++) {

        const fileBuffer = fs.readFileSync("./prescriptions/" + i.toString() + '.pdf');
        let hashSum = crypto.createHash('sha256');
        hashSum.update(fileBuffer);
        const hex = hashSum.digest('hex');

        var res = await fetch(
            'http://localhost:8080/prescription/lookup/', 
            { 
                method: 'POST', 
                body: JSON.stringify({
                    fileHash: hex
                }),
                headers: { 'Content-Type': 'application/json' }
            }
        );

        testResult[i] = {
            ...testResult[i], 
            ...{
                fileIndex: i,
                fileHash: hex,
                original: res.status == 200
            }
        };
    }
}


async function test() {
    // mint original
    await mintNew();

    // mint fakes
    await mintFake();

    // check original files against the blockchain
    await checkNew()

    // check fake files against the blockchain
    await checkEdit();

    // save result
    fs.writeFileSync('testResult.json', JSON.stringify(testResult));
}

test();