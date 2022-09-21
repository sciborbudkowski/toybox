const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');
const https = require('https');
const fs = require('fs');

const { startDatabase } = require('./database/mongo');
const { getPopularToys, getRecentToys, getToy } = require('./database/toys');
const { getCategories } = require('./database/categories');
const { getInitialData } = require('./database/initialData');
const { isFavorite, switchFavorite } = require('./database/favorities');
const { getCartForUser } = require('./database/carts');

const httpsOptions = {
    key: fs.readFileSync('./src/ssl/key.pem', 'utf8'),
    cert: fs.readFileSync('./src/ssl/cert.pem', 'utf8')
}

const app = express();

const PORT = 8000;

app.use(helmet());
app.use(bodyParser.json());
app.use(cors());
app.use(morgan('combined'));

app.get('/toys-popular', async (req, res) => {
    res.send(await getPopularToys());
});

app.get('/toys-recent', async (req, res) => {
    res.send(await getRecentToys());
});

app.get('/categories', async (req, res) => {
    var parrentId = '';
    if (typeof req.query.parrentId !== 'undefined') {
        parrentId = req.query.parrentId;
    }

    res.send(await getCategories(parrentId));
});

app.get('/initial-data', async (req, res) => {
    if (typeof req.query.userId !== 'undefined') {
        const userId = req.query.userId;
        res.send(await getInitialData(userId));
        return;
    }

    const json = {
        'result': false,
        'type': 'initialData',
        'count': -1,
        'data': {
            'message': 'userId parameter not provided.'
        }
    };
    res.send(await json);
});

app.get('/is-favorite', async (req, res) => {
    if (typeof req.query.userId !== 'undefined' && typeof req.query.toyId !== 'undefined') {
        const userId = req.query.userId;
        const toyId = req.query.toyId;
        res.send(await isFavorite(userId, toyId));
        return;
    }

    const json = {
        'result': false,
        'type': 'isFavorite',
        'count': -1,
        'data': {
            'message': 'userId or toyId parameters not provided.'
        }
    };
    res.send(await json);
});

app.get('/switch-favorite', async (req, res) => {
    if (typeof req.query.userId !== 'undefined' && typeof req.query.toyId !== 'undefined') {
        const userId = req.query.userId;
        const toyId = req.query.toyId;
        res.send(await switchFavorite(userId, toyId));
        return;
    }

    const json = {
        'result': false,
        'type': 'isFavorite',
        'count': -1,
        'data': {
            'message': 'userId or toyId parameters not provided.'
        }
    };
    res.send(await json);
});

app.get('/get-cart', async (req, res) => {
    if (typeof req.query.userId !== 'undefined') {
        const userId = req.query.userId;
        res.send(await getCartForUser(userId));
        return;
    }

    const json = {
        'result': false,
        'type': 'getCartForUser',
        'count': -1,
        'data': {
            'message': 'userId parameter not provided.'
        }
    };
    res.send(await json);
});

app.get('/get-toy', async (req, res) => {
    if (typeof req.query.toyId !== 'undefined') {
        const toyId = req.query.toyId;
        res.send(await getToy(toyId));
        return;
    }

    const json = {
        'result': false,
        'type': 'getToy',
        'count': -1,
        'data': {
            'message': 'toyId parameter not provided.'
        }
    };
    res.send(await json);
});

startDatabase().then(async () => {
    https.createServer(httpsOptions, app).listen(PORT);
});