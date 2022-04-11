var pdf = require("pdf-creator-node");
var fs = require("fs");

// Read HTML Template
var html = fs.readFileSync("template.html", "utf8");

var options = {
    format: "A4",
    orientation: "portrait",
    border: "10mm",
};
var meds = [
    {
        "name": "trazodone",
        "for": "Insomnia",
        "quantity": 2,
        "comments": "sample generated comment"
    },
    {
        "name": "zolpidem",
        "for": "Insomnia",
        "quantity": 3,
        "comments": "sample generated comment"
    },
    {
        "name": "temazepam",
        "for": "Insomnia",
        "quantity": 1,
        "comments": "sample generated comment"
    }
]

var docDetails = {
    "doctorName": "Dr. Colin Dejesus",
    "doctorQual": "MBBS, MSC",
    "doctorSpec": "Psychology",
}

var patientDetails = {
    "patientName": "Lillian Toomer",
    "patientContact": "+91 9650693092"
}

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
        console.log(res);
    })
    .catch((error) => {
        console.error(error);
    }); 