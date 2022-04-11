var pdf = require("pdf-creator-node");
var fs = require("fs");

export class Med {
    constructor(name, ailment, quantity, comments) {
        this.name = name;
        this.ailment = ailment;
        this.quantity = quantity;
        this.comments = comments;
    }
}

export class DocDetails {
    constructor(doctorName, doctorQual, doctorSpec) {
        this.doctorName = doctorName;
        this.doctorQual = doctorQual;
        this.doctorSpec = doctorSpec;
    }
}

export class PatientDetails {
    constructor(patientName, patientContact) {
        this.patientName = patientName;
        this.patientContact = patientContact;
    }
}

export async function generatePDF(meds, docDetails, patientDetails) {
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
        path: "./prescriptions/output.pdf",
        type: "",
    };

    pdf
        .create(document, options)
        .then((res) => {
            return res;
        })
        .catch((error) => {
            console.log(error);
            return 0;
        });
}

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