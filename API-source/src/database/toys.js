var ObjectId = require('mongodb').ObjectId;

const { getDatabase } = require('./mongo');

const collectionName = 'toys';

async function getPopularToys() {
    const database = await getDatabase();
    const result = await database.collection(collectionName).find({}).sort({ viewCount: -1 }).toArray();
    const json = {
        'result': true,
        'type': 'popular-toys',
        'count': result.length,
        'data': result
    };

    return json;
}

async function getRecentToys() {
    const database = await getDatabase();
    const result = await database.collection(collectionName).find({}).sort({ dateAdded: -1 }).toArray();
    const json = {
        'result': true,
        'type': 'recent-toys',
        'count': result.length,
        'data': result
    };

    return json;
};

async function getToy(toyId) {
    const database = await getDatabase();
    const idForQuery = new ObjectId(toyId);
    const query = { _id: idForQuery };
    const result = await database.collection(collectionName).find(query).toArray();

    const json = {
        'result': true,
        'type': 'get-toy',
        'count': 1,
        'data': result
    };

    console.log(json);

    return json
}

module.exports = { getPopularToys, getRecentToys, getToy };