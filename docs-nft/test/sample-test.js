const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Prescription", function () {
  it("Should mint and transfer the new Prescription", async function () {
    const DocsPrescription = await ethers.getContractFactory("DocsPrescription");
    const docsPrescription = await DocsPrescription.deploy();
    await docsPrescription.deployed();

    const patient = '0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266';

    let metadata = 'prescription.png';
    let balance = await docsPrescription.balanceOf(patient);
    expect(balance).to.equal(0);

    const newPrescription = await docsPrescription.payToMint(patient, metadata, { value: ethers.utils.parseEther('0.05') });

    await newPrescription.wait();
    balance = await docsPrescription.balanceOf(patient);
    expect(balance).to.equal(1);
  });
});
