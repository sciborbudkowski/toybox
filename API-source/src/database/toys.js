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

module.exports = { getPopularToys, getRecentToys };