var pdf = require("pdf-creator-node");
var fs = require("fs");

class Med {
    constructor(name, quantity, comments) {
        this.name = name;
        this.quantity = quantity;
        this.comments = comments;
    }
}

class DocDetails {
    constructor(doctorName, doctorQual, doctorSpec) {
        this.doctorName = doctorName;
        this.doctorQual = doctorQual;
        this.doctorSpec = doctorSpec;
    }
}

class PatientDetails {
    constructor(patientName, patientContact) {
        this.patientName = patientName;
        this.patientContact = patientContact;
    }
}

async function generatePDF(meds, docDetails, patientDetails, filename = 'output.pdf') {
    var html = fs.readFileSync("prescription_template.html", "utf8");

    var options = {
        format: "A4",
        orientation: "portrait",
        border: "10mm",
    };

    var document = {
        html: html,
        data: {
            meds: meds,
            docDetails,
            patientDetails
        },
        path: `./prescriptions/${filename}`,
        type: "",
    };

    return pdf
        .create(document, options)
        .then((res) => {
            return {
                success: true,
                res
            };
        })
        .catch((error) => {
            console.log(error);
            return {
                success: false,
                error
            };
        });
}

module.exports = { Med, DocDetails, PatientDetails, generatePDF };

// var meds = [
//     {
//         "name": "trazodone",
//         "for": "Insomnia",
//         "quantity": 2,
//         "comments": "sample generated comment"
//     },
//     {
//         "name": "zolpidem",
//         "for": "Insomnia",
//         "quantity": 3,
//         "comments": "sample generated comment"
//     },
//     {
//         "name": "temazepam",
//         "for": "Insomnia",
//         "quantity": 1,
//         "comments": "sample generated comment"
//     }
// ]

// var docDetails = {
//     "doctorName": "Dr. Colin Dejesus",
//     "doctorQual": "MBBS, MSC",
//     "doctorSpec": "Psychology",
// }

// var patientDetails = {
//     "patientName": "Lillian Toomer",
//     "patientContact": "+91 9650693092"
// }