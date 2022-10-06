var ObjectId = require('mongodb').ObjectId;

const { getDatabase } = require('./mongo');

const collectionName = 'favorites';
const toysCollectionName = 'toys';

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

async function getFavorities(userId) {
    const database = await getDatabase();
    const resultToys = await database.collection(collectionName).find({ userId: userId }, { projection: { toyId: 1, _id: 0 } }).toArray();
    var json = {
        'result': true,
        'type': 'getFavorities',
        'count': resultToys.length,
        'data': []
    }
    
    var array = [];
    await Promise.all(resultToys.map(async (element) => {
        console.log(element);
        const idForQuery = new ObjectId(element.toyId);
        const resultToy = await database.collection(toysCollectionName).findOne( { _id: idForQuery });
        array.push(resultToy);
    }));

    json.data = array;
    return json;
}

module.exports = { isFavorite, switchFavorite, getFavorities };