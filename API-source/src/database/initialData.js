const { getDatabase } = require('./mongo');

const categoriesCollectionName = 'categories';
const toysCollectionName = 'toys';
const cartsCollectionName = 'carts';
const favoritiesCollectionName = 'favorites';

async function getInitialData(userId) {
    const database = await getDatabase();

    const resultCategories = await database.collection(categoriesCollectionName).find({ parrentId: '' }).toArray();
    const resultPopularToys = await database.collection(toysCollectionName).find({}).sort({ viewCount: -1 }).toArray();
    const resultRecentToys = await database.collection(toysCollectionName).find({}).sort({ dateAdded: -1 }).toArray();
    const resultCart = await database.collection(cartsCollectionName).find({ userId: userId }).toArray();
    const resultFavorities = await database.collection(favoritiesCollectionName).find({ userId: userId }).toArray();

    const json = {
        'result': true,
        'type': 'initialData',
        'popularToysData': resultPopularToys,
        'recentToysData': resultRecentToys,
        'categories': resultCategories,
        'cart': resultCart,
        'favorities': resultFavorities
    };

    return json;
}

module.exports = { getInitialData };