var CryptoJS = require('crypto-js');

var key = 'D4t4T4bs_2015',
    cfg = 'qwerty256';

/* Base64 coding */
exports.encodeBase64 = function(normalString) {
    try {
        return CryptoJS.enc.Base64.stringify(CryptoJS.enc.Utf8.parse(normalString));
    }
    catch (err) {
        throw "ERROR - utils/utilidades.js _ encodeBase64 method";
    }
};

exports.decodeBase64 = function(base64String) {
    try {
        return CryptoJS.enc.Base64.parse(base64String).toString(CryptoJS.enc.Utf8);
    }
    catch (err) {
        throw "ERROR - utils/utilidades.js _ decodeBase64 method";
    }

};

/* AES coding */
exports.encodeAES = function(normalString, key) {
	try {
        return CryptoJS.AES.encrypt(
            normalString, 
            typeof key !== undefined ? key : this.key,
            this.cfg
        );
    }
    catch (err) {
        throw "ERROR - utils/utilidades.js _ encodeAES method";
    }
};

exports.decodeAES = function(cipherString, key) {
	try {
        return CryptoJS.AES.decrypt(
            cipherString, 
            typeof key !== undefined ? key : this.key,
            this.cfg
        );
    }
    catch (err) {
        throw "ERROR - utils/utilidades.js _ decodeAES method";
    }
};

/* 3DES coding */
exports.encode3DES = function(normalString, key) {
	try {
        return CryptoJS.TripleDES.encrypt(
            normalString, 
            typeof key !== undefined ? key : this.key,
            this.cfg
        );
    }
    catch (err) {
        throw "ERROR - utils/utilidades.js _ encode3DES method";
    }
};

exports.decode3DES = function(cipherString, key) {
	try {
        return CryptoJS.TripleDES.decrypt(
            cipherString, 
            typeof key !== undefined ? key : this.key,
            this.cfg
        );
    }
    catch (err) {
        throw "ERROR - utils/utilidades.js _ decode3DES method";
    }
};

/* MD5 hashing */
exports.MD5 = function(text, _key) {
    try {
        return typeof _key === 'undefined' ? CryptoJS.HmacMD5(text, key).toString() : CryptoJS.MD5(text).toString();
    }
	catch (err) {
        throw "ERROR - utils/utilidades.js _ MD5 method";
    }
};

/* SHA1 hashing */
exports.SHA1 = function(text, key) {
    try {
        return typeof key !== undefined ? CryptoJS.HmacSHA1(text, key) : CryptoJS.SHA1(text);
    }
    catch (err) {
        throw "ERROR - utils/utilidades.js _ SHA1 method";
    }
};

/* SHA224 hashing */
exports.SHA224 = function(text, key) {
    try {
        return typeof key !== undefined ? CryptoJS.HmacSHA224(text, key) : CryptoJS.SHA224(text);
    }
    catch (err) {
        throw "ERROR - utils/utilidades.js _ SHA224 method";
    }
};

/* SHA256 hashing */
exports.SHA256 = function(text, keyU) {
    try {
        return typeof keyU !== undefined ? CryptoJS.HmacSHA256(text, key) : CryptoJS.SHA256(text);
    }
    catch (err) {
        throw "ERROR - utils/utilidades.js _ SHA256 methood";
    }
};

/* SHA3 hashing */
exports.SHA3 = function(text, key) {
    try {
        return typeof key !== undefined ? CryptoJS.HmacSHA3(text, key) : CryptoJS.SHA3(text);
    }
    catch (err) {
        throw "ERROR - utils/utilidades.js _ SHA3 method";
    }
};

/* SHA384 hashing */
exports.SHA384 = function(text, key) {
    try {
        return typeof key !== undefined ? CryptoJS.HmacSHA384(text, key) : CryptoJS.SHA384(text);
    }
    catch (err) {
        throw "ERROR - utils/utilidades.js _ SHA384 method";
    }
};

/* SHA512 hashing */
exports.SHA512 = function(text, keyU) {
    try {
        return typeof keyU !== undefined ? CryptoJS.HmacSHA512(text, key) : CryptoJS.SHA512(text);
    }
    catch (err) {
        throw "ERROR - utils/utilidades.js _ SHA512 method: " + err;
    }
};