const { MongoClient } = require('mongodb');
const f = require('util').format;

let database = null;

let user = encodeURIComponent('ToyBoxUser');
let pass = encodeURIComponent('1990ToyBoxUser@');
let url = f('mongodb://%s:%s@develop-box.pl:27017/ToyBox', user, pass);

async function startDatabase() {
    const connection = await MongoClient.connect(url, { useNewUrlParser: true });
    database = connection.db();
}

async function getDatabase() {
    if(!database) await startDatabase();
    return database;
}

module.exports = { getDatabase, startDatabase }; 