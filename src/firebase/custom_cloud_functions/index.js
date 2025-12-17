const admin = require("firebase-admin/app");
admin.initializeApp();

const getNPS = require("./get_n_p_s.js");
exports.getNPS = getNPS.getNPS;
