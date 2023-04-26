SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for insurance_quotes
-- ----------------------------
DROP TABLE IF EXISTS `insurance_quotes`;
CREATE TABLE `insurance_quotes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle_type_id` int NOT NULL,
  `product_id` int NOT NULL,
  `policy_number` varchar(50) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_age` tinyint unsigned NOT NULL,
  `vehicle_model` varchar(100) NOT NULL,
  `license_plate` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `paid_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_policy_number` (`policy_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of insurance_quotes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle_type_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '1: valid, 0: invalid',
  `deductible` int NOT NULL,
  `days` int NOT NULL,
  `policy_limit` int DEFAULT NULL,
  `premium` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` (`id`, `vehicle_type_id`, `name`, `description`, `status`, `deductible`, `days`, `policy_limit`, `premium`) VALUES (1, 1, 'basic', NULL, 1, 15, 30, 1, 100);
INSERT INTO `products` (`id`, `vehicle_type_id`, `name`, `description`, `status`, `deductible`, `days`, `policy_limit`, `premium`) VALUES (2, 1, 'premium', NULL, 1, 20, 100, 1, 200);
INSERT INTO `products` (`id`, `vehicle_type_id`, `name`, `description`, `status`, `deductible`, `days`, `policy_limit`, `premium`) VALUES (3, 1, 'empire', NULL, 1, 25, 365, 1, 300);
INSERT INTO `products` (`id`, `vehicle_type_id`, `name`, `description`, `status`, `deductible`, `days`, `policy_limit`, `premium`) VALUES (4, 2, 'basic', NULL, 1, 30, 30, 1, 50);
INSERT INTO `products` (`id`, `vehicle_type_id`, `name`, `description`, `status`, `deductible`, `days`, `policy_limit`, `premium`) VALUES (5, 2, 'premium', NULL, 1, 35, 100, 1, 100);
INSERT INTO `products` (`id`, `vehicle_type_id`, `name`, `description`, `status`, `deductible`, `days`, `policy_limit`, `premium`) VALUES (6, 2, 'empire', NULL, 1, 4, 365, 1, 150);
COMMIT;

-- ----------------------------
-- Table structure for vehicle_types
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_types`;
CREATE TABLE `vehicle_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1: valid, 0: invalid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of vehicle_types
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_types` (`id`, `name`, `description`, `status`) VALUES (1, 'automobile', 'product for automobile', 1);
INSERT INTO `vehicle_types` (`id`, `name`, `description`, `status`) VALUES (2, 'bike', 'product for bile', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
