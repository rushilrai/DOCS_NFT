const Storage = require("@azure/storage-blob");

// bucket interface
class Bucket {

    // initialize bucket credentials
    constructor(accountName = null, key = null) {
        this.creds = new Storage.StorageSharedKeyCredential(
            process.env.STORAGE_NAM || accountName,
            process.env.STORAGE_KEY || key
        );
    }

    static generateRandomID() {
        var id_elem = [];
        var dateObj = new Date();

        function convertToString(id_elem) {
            return id_elem.toLocaleString('en-US', {
                minimumIntegerDigits: 2,
                useGrouping: false
            });
        }

        id_elem[0] = String.fromCharCode(65 + Math.floor(Math.random() * 26));
        id_elem[1] = String.fromCharCode(65 + Math.floor(Math.random() * 26));
        id_elem[2] = String.fromCharCode(65 + Math.floor(Math.random() * 26));
        id_elem[3] = convertToString(dateObj.getDate());
        id_elem[4] = convertToString(dateObj.getMonth());
        id_elem[5] = convertToString(dateObj.getFullYear()).slice(2, 4);

        return id_elem.join('');
    }

    // generate SAS token
    getSASToken(containerName) {
        return Storage.generateBlobSASQueryParameters({
            containerName,
            permissions: Storage.ContainerSASPermissions.parse("racwdl"),
            expiresOn: new Date(new Date().valueOf() + 86400)
        }, this.creds).toString();
    }

}

module.exports = { Bucket }