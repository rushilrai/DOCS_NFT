const { BlobServiceClient, StorageSharedKeyCredential } = require("@azure/storage-blob");

// uploading a file to azure
async function uploadFile(blobName, filePath) {
    try {
        const account = process.env.STORAGE_NAM;
        const accountKey = process.env.STORAGE_KEY;

        const sharedKeyCredential = new StorageSharedKeyCredential(account, accountKey);
        const blobServiceClient = new BlobServiceClient( 
            `https://${account}.blob.core.windows.net`,
            sharedKeyCredential
        );
        const containerClient = blobServiceClient.getContainerClient("prescriptions");
        const blockBlobClient = containerClient.getBlockBlobClient(blobName + '.pdf');
        let response = await blockBlobClient.uploadFile(filePath);
        return {
            success: true,
            res: response
        }
    } catch (err) {
        console.log(err);
        return {
            success: false,
            err: err
        }
    }
}

module.exports = { uploadFile }