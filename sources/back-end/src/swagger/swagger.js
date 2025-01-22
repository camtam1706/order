const swaggerJsdoc = require('swagger-jsdoc');
const swaggerUi = require('swagger-ui-express');

// Cấu hình các thông tin cơ bản cho Swagger
const swaggerOptions = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'Order App API',
            version: '1.0.0',
            description: 'API documentation for the Order App',
        },
        servers: [
            {
                url: 'http://localhost:3000', // URL server của bạn
            },
        ],
    },
    apis: ['./src/routes/*.js'], // Đường dẫn tới các file định nghĩa route (cần để tài liệu)
};

const swaggerSpec = swaggerJsdoc(swaggerOptions);

const setupSwagger = (app) => {
    app.use('/swagger', swaggerUi.serve, swaggerUi.setup(swaggerSpec));
    console.log('Swagger docs available at http://localhost:3000/swagger');
};

module.exports = setupSwagger;
