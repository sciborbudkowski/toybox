const { getDatabase } = require('./mongo');

const collectionName = 'categories';

async function getCategories(parrentId) {
    console.log('parrentId is ', parrentId);
    const database = await getDatabase();
    const query = { parrentId: parrentId };
    const result = await database.collection(collectionName).find(query).toArray();
    const json = {
        'result': true,
        'type': 'categories',
        'count': result.length,
        'data': result
    };

    return json;
}

module.exports = { getCategories };