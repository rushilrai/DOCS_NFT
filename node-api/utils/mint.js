const Web3 = require('web3')

const url = 'http://127.0.0.1:8545/';

const web3 = new Web3(url);

const testAccount = '0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266';
const testContract = '0x5FbDB2315678afecb367f032d93F642f64180aa3';
const testAccountPriv = '0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80';

const abi = require('../artifacts/contracts/Prescriptions.sol/DocsPrescription.json');

async function mintNFT(tokenURI) {
    const contract = new web3.eth.Contract(abi.abi, testContract);

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

    return signPromise
        .then(async (signedTx) => {
            let _dataJson = {};
            await web3.eth.sendSignedTransaction(
                signedTx.rawTransaction,
                async function (err, hash) {
                    if (!err) {
                        await web3.eth.getTransaction(hash, (err, txResult) => {
                            let found = [],
                                rxp = /{([^}]+)}/g,
                                str = web3.utils.hexToAscii(txResult.input),
                                curMatch;

                            while (curMatch = rxp.exec(str)) {
                                found.push(curMatch[1]);
                            }
                            let dataJson = JSON.parse(`{${found[0]}}`)
                            _dataJson = dataJson;
                            _dataJson['txnHash'] = hash;
                        });

                    } else {
                        console.log(
                            "Something went wrong when submitting our transaction:",
                            err
                        );
                        return {
                            success: false
                        }
                    }
                }
            );
            return {
                url: _dataJson.url,
                hash: _dataJson.hash,
                txnHash: _dataJson.txnHash,
                success: true
            };
        })
        .catch((err) => {
            console.log(" Promise failed:", err);
            return {
                success: false,
                err: err
            }
        });
}

async function fetchTxn(hash) {
    let _dataJson = {};
    await web3.eth.getTransaction(hash, (err, txResult) => {
        let found = [],
            rxp = /{([^}]+)}/g,
            str = web3.utils.hexToAscii(txResult.input),
            curMatch;

        while (curMatch = rxp.exec(str)) {
            found.push(curMatch[1]);
        }
        let dataJson = JSON.parse(`{${found[0]}}`)
        _dataJson = dataJson;
        _dataJson['txnHash'] = hash;
        _dataJson['txn'] = txResult;
    });

    return _dataJson;

}

module.exports = { mintNFT, fetchTxn };