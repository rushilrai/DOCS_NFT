// imports
const express = require('express');
const Doctor = require('../database/doctors.js');
const Prescription = require('../database/prescriptions.js');
const User = require('../database/users.js');
const { Bucket } = require('../utils/bucket.js');
const GeneratePdf = require('../utils/generatePDF.js');
const { mintNFT, fetchTxn } = require('../utils/mint.js');
const { uploadFile } = require('../utils/uploadFile.js');
const crypto = require('crypto');
const fs = require('fs');

// router init
const router = express.Router();

// creating and saving the patients prescription
router.post('/new', async (req, res, next) => {
    console.log(req.body);
    let doctor, user;
    let preName = 'output.pdf';
    if (req.query['test']) {
        doctor = req.body['prescription']['doctor'];
        user = req.body['prescription']['patient'];
    } else {
        doctor = (await Doctor.checkIfExists(req.body.prescription.doc_id, Doctor.DoctorModel))['res'];
        user = (await User.checkIfExists(req.body.prescription.user_id, User.UserModel))['res'];
    }

    let docDetails = new GeneratePdf.DocDetails(
        doctor.name,
        doctor.qualification,
        doctor.specialization
    );
    let patientDetails = new GeneratePdf.PatientDetails(
        user.name,
        user.contact_no
    )

    let resGeneratePdf = await GeneratePdf.generatePDF(
        req.body.prescription.meds,
        docDetails,
        patientDetails,
        preName
    );

    if (!resGeneratePdf.success) {
        res.status(500).send(resGeneratePdf);
    }

    let genId = await Bucket.generateRandomID();
    let resUpload = await uploadFile(genId, "./prescriptions/" + preName);

    if (!resUpload.success) {
        res.status(500).send(resUpload);
    }

    const fileBuffer = fs.readFileSync("./prescriptions/" + preName);
    let hashSum = crypto.createHash('sha256');
    hashSum.update(fileBuffer);

    const hex = hashSum.digest('hex');

    let resMint = await mintNFT(JSON.stringify({
        "hash": hex,
        "url": resUpload.url
    }))

    if (!resMint.success) {
        res.status(500).send(resMint);
    }

    req.body.prescription['txnHash'] = resMint['txnHash'];
    req.body.prescription['fileHash'] = resMint['hash']
    var prescription = new Prescription(req.body.prescription);
    prescription.prescribe(req.body.userlogin)
        .then((result) => {
            console.log(result);
            res.status(
                result.success ? 200 : 400
            ).send(result);
        })
        .catch((err) => {
            res.status(500).send(err);
        });

});

// fetching all prescriptions
router.get('/all/:role/:id', (req, res, next) => {

    Prescription.allPrescriptions(req.params.role, req.params.id)
        .then((result) => {
            res.status(
                result.success ? 200 : 400
            ).send(result);
        })
        .catch((err) => {
            res.status(500).send(err);
        });

});

// look up prescription
router.post("/lookup", (req, res, next) => {
    console.log(req.body);
    Prescription.verifyPrescription(req.body)
        .then(async (result) => {
            console.log(result['res']);
            if (result['res'].length == 0) {
                console.log('no res');
                res.status(500).send(err);
            }

            console.log('yes res');
            let txn = await fetchTxn(result['res'][0]['txnHash']);
            console.log(txn);
            res.status(
                result.success ? 200 : 400
            ).send(txn);
        })
        .catch((err) => {
            res.status(500).send(err);
        });
});

// export router
module.exports = router;