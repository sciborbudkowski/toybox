const { getDatabase } = require('./mongo');

const collectionName = 'carts';

async function getCartForUser(userId) {
    const database = await getDatabase();
    const query = { userId: userId };
    const result = await database.collection(collectionName).find(query).toArray();
    const json = {
        'result': true,
        'type': 'getCartForUser',
        'count': result.length,
        'data': result
    };

    return json;
}

module.exports = { getCartForUser };