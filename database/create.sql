-- Kiểm tra và xóa schema "order" nếu tồn tại
DROP SCHEMA IF EXISTS `order-app`;

-- Tạo lại schema "order"
CREATE SCHEMA `order-app`;

-- Sử dụng schema "order"
USE `order-app`;

-- Tạo bảng User
CREATE TABLE `User` (
                        user_id INT AUTO_INCREMENT PRIMARY KEY,
                        username VARCHAR(50) NOT NULL UNIQUE,
                        password VARCHAR(255) NOT NULL,
                        role ENUM('phục vụ', 'bếp', 'thu ngân') NOT NULL
);

-- Tạo bảng Order
CREATE TABLE `Order` (
                          order_id INT AUTO_INCREMENT PRIMARY KEY,
                          table_id INT NOT NULL,
                          status ENUM('Mới', 'Đang làm', 'Hoàn thành') NOT NULL,
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng Menu
CREATE TABLE `Menu` (
                        item_id INT AUTO_INCREMENT PRIMARY KEY,
                        name VARCHAR(100) NOT NULL,
                        price DECIMAL(10, 2) NOT NULL,
                        description TEXT
);

-- Tạo bảng OrderItem
CREATE TABLE `OrderItem` (
                               order_id INT NOT NULL,
                               item_id INT NOT NULL,
                               quantity INT NOT NULL,
                               PRIMARY KEY (order_id, item_id),
                               FOREIGN KEY (order_id) REFERENCES `Order`(order_id) ON DELETE CASCADE,
                               FOREIGN KEY (item_id) REFERENCES `Menu`(item_id) ON DELETE CASCADE
);