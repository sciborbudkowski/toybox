const { getDatabase } = require('./mongo');

const collectionName = 'favorites';

async function isFavorite(userId, toyId) {
    const database = await getDatabase();
    const query = { userId: userId, toyId: toyId };
    const result = await database.collection(collectionName).find(query).toArray();
    const json = {
        'result': true,
        'type': 'isFavorite',
        'count': result.length,
        'data': result
    };

    return json;
}

async function switchFavorite(userId, toyId) {
    var json = { };
    const database = await getDatabase();
    const query = { userId: userId, toyId: toyId };
    var result = await database.collection(collectionName).find(query).toArray();
    if (result.length == 0) {
        result = await database.collection(collectionName).insertOne(query);
        json = {
            'result': result.acknowledged,
            'type': 'switchFavorite',
            'operation': 'add'
        };
    } else {
        result = await database.collection(collectionName).deleteOne(query);
        json = {
            'result': result.acknowledged,
            'type': 'switchFavorite',
            'operation': 'remove'
        };
    }

    return json;
}

module.exports = { isFavorite, switchFavorite };