const Web3 = require('web3')

const url = 'http://127.0.0.1:8545/';

const web3 = new Web3(url);

const testAccount = '0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266';
const testContract = '0x5FbDB2315678afecb367f032d93F642f64180aa3';
const testAccountPriv = '0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80';

const abi = require('../src/artifacts/contracts/Prescriptions.sol/DocsPrescription.json');

// web3.eth.getBalance(testAccount, (err, wei) => {
//     balance = web3.utils.fromWei(wei, 'ether');
//     console.log(balance);
// });

const contract = new web3.eth.Contract(abi.abi, testContract);

async function mintNFT(tokenURI) {
    console.log('');
    console.log('Input:')
    console.log('Recipient Address:', testAccount);
    console.log('Contract Address:', testContract);
    console.log('Transaction Value', '0.05 ETH');

    const tx = {
        from: testAccount,
        to: testContract,
        value: web3.utils.toWei('0.05', 'ether'),
        gas: 1000000,
        data: contract.methods
            .payToMint(testAccount, tokenURI)
            .encodeABI(),
    };

    const signPromise = web3.eth.accounts.signTransaction(
        tx,
        testAccountPriv
    );
    signPromise
        .then((signedTx) => {
            web3.eth.sendSignedTransaction(
                signedTx.rawTransaction,
                async function (err, hash) {
                    if (!err) {
                        console.log('');
                        console.log('');
                        console.log('Output:')
                        console.log(
                            "Transaction Hash: ",
                            hash
                        );
                        let receipt = await web3.eth.getTransaction(hash, (err, txResult) => {
                            console.log(txResult);
                            let found = [],
                                rxp = /{([^}]+)}/g,
                                str = web3.utils.hexToAscii(txResult.input),
                                curMatch;

                            while (curMatch = rxp.exec(str)) {
                                found.push(curMatch[1]);
                            }
                            let dataJson = JSON.parse(`{${found[0]}}`)
                            console.log('Prescription URL:', dataJson.url);
                            console.log('');
                            console.log('');
                        });
                    } else {
                        console.log(
                            "Something went wrong when submitting our transaction:",
                            err
                        );
                    }
                }
            );
        })
        .catch((err) => {
            console.log(" Promise failed:", err);
        });
}

// mintNFT(JSON.stringify({
//     "hash": "Rjjhjhj",
//     "url": "https://testdocssrm.blob.core.windows.net/prescriptions/prescription.pdf",
// }));































// contract.methods.payToMint(testAccount, 'Paracetamol 500').send(
//     {
//         from: testAccount,
//         to: testContract,
//         value: web3.utils.toWei('0.05', 'ether'),
//     }, (err, result) => {
//         console.log(result);
//     }
// );