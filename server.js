const express = require('express');
const { Pool } = require('pg');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 3000;

// Настройки подключения к PostgreSQL
const pool = new Pool({
    user: 'postgres',       // Замените на ваше имя пользователя
    host: 'localhost',
    database: 'arch_vision_db', // База данных, которую вы создали ранее
    password: '1234567890', // Пароль от PostgreSQL
    port: 5432,
});

app.use(cors());
app.use(bodyParser.json());
app.use(express.static('public'));

// API для регистрации
app.post('/register', async (req, res) => {
    const { name, email, password, phone } = req.body;

    if (!name || !email || !password) {
        return res.status(400).json({ error: 'Имя, Email и Пароль обязательны' });
    }

    try {
        const result = await pool.query(
            'INSERT INTO users (name, email, password, phone) VALUES ($1, $2, $3, $4) RETURNING *',
            [name, email, password, phone || null]
        );
        res.json({ message: 'Регистрация успешна!', user: result.rows[0] });
    } catch (err) {
        if (err.code === '23505') {
            return res.status(400).json({ error: 'Пользователь с таким email уже существует' });
        }
        console.error(err);
        res.status(500).json({ error: 'Ошибка сервера' });
    }
});

// Заголовки для защиты контента(Запрет копирования контента)
app.use((req, res, next) => {
    res.header('X-Content-Type-Options', 'nosniff');
    res.header('X-Frame-Options', 'DENY'); // Запрещает iframe-встраивание
    res.header('X-XSS-Protection', '1; mode=block');
    next();
});

app.listen(port, () => {
    console.log(`Сервер запущен на http://localhost:${port}`);
});