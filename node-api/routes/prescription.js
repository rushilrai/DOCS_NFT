// imports
const express = require('express');
const Doctor = require('../database/doctors.js');
const Prescription = require('../database/prescriptions.js');
const User = require('../database/users.js');
const { Bucket } = require('../utils/bucket.js');
const GeneratePdf = require('../utils/generatePDF.js');
const { mintNFT, fetchTxn } = require('../utils/mint.js');
const { uploadFile } = require('../utils/uploadFile.js');

// router init
const router = express.Router();

// creating and saving the patients appointment
router.post('/new', async (req, res, next) => {

    let doctor = (await Doctor.checkIfExists(req.body.prescription.doc_id, Doctor.DoctorModel))['res'];
    let user = (await User.checkIfExists(req.body.prescription.user_id, User.UserModel))['res'];

    let docDetails = new GeneratePdf.DocDetails(
        doctor.name,
        doctor.qualification,
        doctor.specialization
    );
    let patientDetails = new GeneratePdf.PatientDetails(
        user.name,
        user.contact_no
    )
    try {

    } catch (error) {

    }

    let resGeneratePdf = await GeneratePdf.generatePDF(
        req.body.prescription.meds,
        docDetails,
        patientDetails
    );

    if (!resGeneratePdf.success) {
        res.status(500).send(resGeneratePdf);
    }

    let genId = await Bucket.generateRandomID();
    let resUpload = await uploadFile(genId, "./prescriptions/output.pdf");

    if (!resUpload.success) {
        res.status(500).send(resUpload);
    }

    const crypto = require('crypto');
    const fs = require('fs');

    const fileBuffer = fs.readFileSync("./prescriptions/output.pdf");
    const hashSum = crypto.createHash('sha256');
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

// fetching all appointments
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
router.get("/lookup", (req, res, next) => {
    Prescription.verifyPrescription(req.body)
        .then(async (result) => {
            console.log('lookup|txn --> ', (await fetchTxn(result['res'][0]['txnHash'])));
            res.status(
                result.success ? 200 : 400
            ).send(result);
        })
        .catch((err) => {
            res.status(500).send(err);
        });
});

// export router
module.exports = router;