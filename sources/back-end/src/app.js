const express = require('express');
const sequelize = require('./config/database');
const setupSwagger = require('./swagger/swagger');

// Tạo ứng dụng Express
const app = express();

// Middleware để parse JSON
app.use(express.json());

// Route mặc định
app.get('/', (req, res) => {
    res.send('Hello, World!');
});

// Đồng bộ cơ sở dữ liệu
sequelize.sync({ alter: true }) // `alter: true` để tự động cập nhật bảng
    .then(() => console.log('Database synced successfully.'))
    .catch(err => console.error('Error syncing database:', err.message));

// Khởi động Swagger
setupSwagger(app);

// Khởi động server
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
