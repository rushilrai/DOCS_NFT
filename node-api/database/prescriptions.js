// imports
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const Doctor = require('./doctors.js');

// Prescription template
class Prescription {

    // Prescription model
    static PrescriptionModel = mongoose.model('prescriptions', new mongoose.Schema({
        _id: {
            type: mongoose.Types.ObjectId,
            required: true
        },
        user_id: {
            type: String,
            required: false
        },
        doc_id: {
            type: String,
            required: false
        },
        meds: [{
            name: String,
            quantity: String,
            comments: String
        }],
        fileHash: {
            type: String,
            required: true
        },
        txnHash: {
            type: String,
            required: true
        }
    }));

    // new prescription object
    constructor (data) {
        data['_id'] = mongoose.Types.ObjectId();
        this.prescription = new Prescription.PrescriptionModel(data);
    }

    // prescribe to patient and save in db
    async prescribe (userLogin) {

        // verify doctor's login
        // return Doctor.verifyUser(userLogin, Doctor.DoctorModel).then((result) => {

        //     if (result.success) {
                return this.prescription        // if doctor is logged in
                .save()                         // save the prescription
                .then((res) => {
                    return {
                        success: true,
                        result: res 
                    }
                })
                .catch((err) => {
                    return {
                        success: false,
                        err: err
                    }
                });
        //     } else {                            // if doctor isn't logged in
        //         return {                        // don't save the prescription
        //             success: false,                     
        //             msg: "Doctor not logged in."
        //         } 
        //     }

        // });
    
    }

    // fetch all prescriptions for a given id & role
    static async allPrescriptions (role, id) {
        
        // build query for finding prescriptions
        switch (role) {
            case 'patient': var db_query = { user_id: id }; break;      // search by user_id for patients
            case 'doctor': var db_query = { doc_id: id }; break;        // search by doc_id for doctors
            default: return {                                           // invalid role requested
                success: false,
                msg: "Invalid 'role' requested"
            }
        }

        // find all prescriptions
        return Prescription.PrescriptionModel.find(db_query).then((res) => {

            return {                                                    // find & return all prescriptions
                success: true,
                result: res
            };

        }).catch((err) => {
            return {                                                    // error in finding prescriptions
                success: false,
                error: err
            };             
        });

    }

    // verify prescription
    static async verifyPrescription (prescriptionFromOrder) {

        // take _id from prescriptionFromOrder
        var prescriptionFromOrder_id = prescriptionFromOrder['fileHash'];
        console.log(prescriptionFromOrder_id);

        // get prescription from db using prescriptionFromOrder_id
        return Prescription.PrescriptionModel
        .find({ fileHash: prescriptionFromOrder_id })
        .then((res) => {

            // check if prescription exists in DB
            if (!res) {
                return {
                    success: false,
                    msg: "Prescription not found."
                }
            }

            return {
                success: true,
                res: res
            }
        
        })
        .catch((err) => {

            // error occurs while fetching
            return {
                success: false,
                error: err
            }

        });

    }
}

// exports
module.exports = Prescription;