-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 02, 2025 at 06:08 PM
-- Server version: 8.0.33
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marchentease`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `address_type` enum('billing','shipping') NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `address_line_1` varchar(255) NOT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `order_notes` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  PRIMARY KEY (`brand_id`),
  KEY `category_id_fk` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `category_id`, `brand_name`) VALUES
(1, 1, 'Iphone'),
(2, 1, 'Apple'),
(3, 1, 'Samsung'),
(4, 1, 'Sony'),
(5, 2, 'Nike'),
(6, 2, 'Zara'),
(7, 2, 'Gucci'),
(8, 3, 'IKEA'),
(9, 3, 'Dyson'),
(10, 3, 'West Elm'),
(11, 4, 'L’Oréal Paris'),
(12, 4, 'The Ordinary'),
(13, 5, 'Adidas'),
(14, 5, 'The North Face'),
(15, 6, 'Moleskine'),
(16, 6, 'Staedtler'),
(17, 7, 'LEGO'),
(18, 7, 'Hasbro'),
(19, 8, 'Nestlé'),
(20, 8, 'Kellogg’s'),
(21, 9, 'Bosch'),
(22, 9, 'Michelin'),
(23, 10, 'Purina'),
(24, 10, 'Kong'),
(25, 2, 'adidas'),
(26, 2, 'Polo');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `added_at` varchar(255) NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `customer_id_fk` (`customer_id`),
  KEY `product_id_fk` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catigories`
--

DROP TABLE IF EXISTS `catigories`;
CREATE TABLE IF NOT EXISTS `catigories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `catigories`
--

INSERT INTO `catigories` (`category_id`, `category_name`) VALUES
(1, 'Electronics'),
(2, 'Fashion'),
(3, 'Home & Living'),
(4, 'Health & Beauty'),
(5, 'Sports & Outdoors'),
(6, 'Books & Stationery'),
(8, 'Food & Beverages'),
(9, 'Automotive'),
(10, 'Pet Supplies');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id_fk` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `total_amount`, `order_date`, `status`) VALUES
(26, 8, 373.02, '2025-06-02 20:22:48', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `subtotal` double NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_fk` (`order_id`),
  KEY `shop_id_fk` (`shop_id`),
  KEY `product_id_fk` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `shop_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `rating` float DEFAULT NULL,
  `dimensions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `quantity` int NOT NULL,
  `category_id` int NOT NULL,
  `brand_id` int NOT NULL,
  `stock_status` varchar(255) NOT NULL,
  `weight` float DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `subcategory_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `shop_id_fk` (`shop_id`),
  KEY `category_id_fk` (`category_id`),
  KEY `brand_id_fk` (`brand_id`),
  KEY `subcategory_id_fk` (`subcategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `shop_id`, `product_name`, `product_description`, `size`, `target`, `price`, `rating`, `dimensions`, `quantity`, `category_id`, `brand_id`, `stock_status`, `weight`, `slug`, `subcategory_id`) VALUES
(21, 9, 'Apple iPhone 12 Pro, 128/256/512GB - Fully Unlocked - Used Excellent', '- This pre-owned product has been professionally inspected, tested and cleaned by qualified vendors. It is not certified by Apple. - This product is in \"Used Excellent condition\". The screen and body show no signs of cosmetic damage visible from 12 inches away. - This product will have a battery that exceeds 80% capacity relative to new. - Accessories may not be original, but will be compatible and fully functional. Product may come in generic box. - Product will come with a charging cable. Headphone, charging block and SIM card are not included. - This product is eligible for a refund within 30 days of receipt if it does not work as expected. - Used products are not guaranteed to be waterproof.', 'small', 'women,men,kids', 299.99, NULL, '2*10*5', 100, 1, 1, 'in_stock', 2.5, 'apple-iphone-12-pro-128256512gb-fully-unlocked-used-excellent', 2),
(22, 10, 'HP Desktop Computer i5 Mini Pc 8GB RAM 500GB HDD Windows 10 Pro Wi-Fi', 'The item is in like-new condition, backed by a one year warranty. It has been professionally refurbished, inspected and cleaned to excellent condition by qualified sellers. The item includes original or new accessories and will come in new generic packaging. See the seller\'s listing for full details', 'small,medium,large', 'women,men', 76.44, NULL, '2*10*5', 50, 1, 4, 'in_stock', 4.3, 'hp-desktop-computer-i5-mini-pc-8gb-ram-500gb-hdd-windows-10-pro-wi-fi', 1),
(23, 10, 'Dell Latitude 7320 Tablet 13” Laptop Core i5 8GB RAM 256GB SSD Windows 10 Pro', 'The item is in like-new condition, backed by a one year warranty. It has been professionally refurbished, inspected and cleaned to excellent condition by qualified sellers. The item includes original or new accessories and will come in new generic packaging. See the seller\'s listing for full details', 'medium', 'men', 231.53, NULL, '2*10*5', 30, 1, 3, 'in_stock', 2.5, 'dell-latitude-7320-tablet-13-laptop-core-i5-8gb-ram-256gb-ssd-windows-10-pro', 1),
(24, 11, 'TAG Heuer Aquaracer WAK2110.BA0830 Caliber 5 Black Dial 41mm Steel Men\'s Watch', 'Excellent Condition. Comes with 1 Year Warranty!', 'medium', 'men', 1389.9, NULL, '2*10*5', 20, 2, 7, 'in_stock', 2.5, 'tag-heuer-aquaracer-wak2110ba0830-caliber-5-black-dial-41mm-steel-mens-watch', 29),
(25, 12, 'adidas men Short Sleeve Pregame Badge of Sport Tee', 'New with tags: This item is brand new and has never been worn. It still has the original tags and/or original packaging', 'small,medium,large,xlarge,xxlarge,xxxlarge', 'men', 9, NULL, '2*10*5', 500, 2, 25, 'in_stock', 0.5, 'adidas-men-short-sleeve-pregame-badge-of-sport-tee', 5),
(26, 12, 'adidas men GRAND COURT 2.0 SHOES', 'New with box: A brand-new, unused, and unworn item (including handmade items) in the original packaging (such as the original box or bag) and/or with the original tags attached', 'medium,large', 'men', 22, NULL, '2*10*5', 300, 2, 25, 'in_stock', 1, 'adidas-men-grand-court-20-shoes', 5),
(27, 9, 'Google Pixel Watch 2 41mm GPS WiFi Bluetooth Gold, Black, Silver G4TSL', 'Very Good with Minimal wear, Comes with a Generic magnetic charger and a Generic Silicone Black band, Please Refer to Pictures to see the band and charger it comes with', 'medium,large', 'women,men,kids', 99.99, NULL, '2*10*5', 75, 1, 3, 'in_stock', 0.75, 'google-pixel-watch-2-41mm-gps-wifi-bluetooth-gold-black-silver-g4tsl', 2),
(28, 9, 'Genuine Apple AirPods Pro (1st Gen) Replacement Parts Right Left AirPods or Case', '100% genuine and OEM Apple cleaned, disinfected, and tested to ensure the best quality!', 'small,medium,large', 'women,men,kids', 53.99, NULL, '2*10*5', 100, 1, 3, 'in_stock', 0.3, 'genuine-apple-airpods-pro-1st-gen-replacement-parts-right-left-airpods-or-case', 2),
(29, 9, 'Sony PlayStation 5 Slim 1TB Console', 'Pre owned - Fully functional - Great Condition - Controller & Cables included', 'medium', 'women,men,kids', 359.99, NULL, '2*10*5', 36, 1, 4, 'in_stock', 2.5, 'sony-playstation-5-slim-1tb-console', 3),
(30, 13, 'Outdoor Double Egg Chair Patio Chairs with Ottoman 680lbs Capacity for 2 Person', 'A brand-new, unused, unopened, undamaged item in its original packaging (where packaging is applicable). Packaging should be the same as what is found in a retail store, unless the item is handmade or was packaged by the manufacturer in non-retail packaging, such as an unprinted box or plastic bag. See the seller\'s listing for full details. ', 'medium', 'men,kids', 328.99, NULL, '2*10*5', 100, 3, 8, 'in_stock', 30, 'outdoor-double-egg-chair-patio-chairs-with-ottoman-680lbs-capacity-for-2-person', 10),
(31, 14, 'Polo Ralph Lauren Shirt Mens 2XL XXL Purple Plaid Stretch Button Up Long Sleeve', 'Preowned condition. Please refer to the photos for more details and actual measurements. Please read the description for more information.', 'small,medium,large,xlarge,xxlarge,xxxlarge', 'men', 39, NULL, '2*10*5', 400, 2, 26, 'in_stock', 0.2, 'polo-ralph-lauren-shirt-mens-2xl-xxl-purple-plaid-stretch-button-up-long-sleeve', 5),
(32, 14, 'Tommy Bahama Men\'s Coconut White Sweatshirt Nassau 1/2 Zip Pullover (S01)', 'New with tags: This item is brand new and has never been worn. It still has the original tags and/or original packaging.', 'small,medium,large', 'men', 44.03, NULL, '2*10*5', 144, 2, 26, 'in_stock', 1, 'tommy-bahama-mens-coconut-white-sweatshirt-nassau-12-zip-pullover-s01', 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `image3` varchar(255) NOT NULL,
  `image4` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id_fk` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `image2`, `image3`, `image4`) VALUES
(11, 21, '/uploads/products/1748184121_15a0ee3053c82cf8237f.jpg', '/uploads/products/1748184121_12c8f107362a2eecbbe7.jpeg', '/uploads/products/1748184121_e90a4ce81c1adb0a30fe.jpeg', '/uploads/products/1748184121_1cea8361f3db8686384f.jpeg'),
(12, 22, '/uploads/products/1748186852_d1afec55c725352aca1d.jpg', '/uploads/products/1748186852_3cc18be546c8c0167aab.jpg', '/uploads/products/1748186852_08a90b6b91ceb100df9b.jpeg', '/uploads/products/1748186852_b1ee0185abc5956902f7.jpeg'),
(13, 23, '/uploads/products/1748187696_c57d526dee2741f59193.jpg', '/uploads/products/1748187696_2affaf2703b3116fca63.jpeg', '/uploads/products/1748187697_3697b9214229416603be.jpeg', '/uploads/products/1748187697_befeea2babd288fb7fee.jpeg'),
(14, 24, '/uploads/products/1748188220_e8d5b77d3dca075cae49.jpeg', '/uploads/products/1748188220_efdeb7213a34577a5964.jpeg', '/uploads/products/1748188220_b60de9c4c169d6429d1f.jpeg', '/uploads/products/1748188220_0f6815efb68f714627ae.jpeg'),
(15, 25, '/uploads/products/1748191144_abab987ef63fe8fd9dd8.jpeg', '/uploads/products/1748191144_85f55ebe07e85804ca2f.jpeg', '/uploads/products/1748191144_bfd8acd42162dba0e56f.jpeg', '/uploads/products/1748191144_72ba3ec8398199603043.jpeg'),
(16, 26, '/uploads/products/1748191292_22ff2a583ccd7075d675.jpeg', '/uploads/products/1748191292_5bf3e7319d2d0b19f1ef.jpeg', '/uploads/products/1748191292_561918c1a0045c2381bc.jpeg', '/uploads/products/1748191292_18a0e71d6a37f24411fb.jpeg'),
(17, 27, '/uploads/products/1748191508_0f04527efe2b76dbb547.jpeg', '/uploads/products/1748191508_dd1b68913cac01050436.jpeg', '/uploads/products/1748191508_8b4a681bafabfdf9d0a0.jpeg', '/uploads/products/1748191508_2499e104481fecf60d91.jpeg'),
(18, 28, '/uploads/products/1748191658_54e43f1fdfd0e6030112.jpeg', '/uploads/products/1748191658_b9f6ad430f6ed5bd4aba.jpeg', '/uploads/products/1748191658_d31449a2a7512846c538.jpeg', '/uploads/products/1748191658_d02ea08d2cb94be0692c.jpeg'),
(19, 29, '/uploads/products/1748194489_da5cc7b59f5a7a2ec7e4.jpeg', '/uploads/products/1748194489_9c1724cd17072ea4de93.jpeg', '/uploads/products/1748194489_40da3a84fd86e98abd3f.jpeg', '/uploads/products/1748194489_153c979b327a821c6004.jpeg'),
(20, 30, '/uploads/products/1748196612_1e504777e37e39f5c8a0.jpeg', '/uploads/products/1748196612_9664d356277d3bf96f86.jpeg', '/uploads/products/1748196612_4bf4986e79af11f556fc.jpeg', '/uploads/products/1748196612_447426596578960d296c.jpeg'),
(21, 31, '/uploads/products/1748198118_b005fc6c4d791d2bc5d5.jpg', '/uploads/products/1748198118_66f162a8b6d891b7e5e2.jpg', '/uploads/products/1748198118_b43301c443fb6d5250c9.jpeg', '/uploads/products/1748198118_81aadbec1184edec1801.jpeg'),
(22, 32, '/uploads/products/1748356622_3e89a4fa714c3c31b930.jpeg', '/uploads/products/1748356622_1813219064fc8594fe5d.jpeg', '/uploads/products/1748356622_2c0bbee5cb68eea09619.jpeg', '/uploads/products/1748356622_051b4c8e7f9eacca8895.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
CREATE TABLE IF NOT EXISTS `shops` (
  `shop_id` int NOT NULL AUTO_INCREMENT,
  `marchent_id` int NOT NULL,
  `shop_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `shop_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `shop_description` varchar(512) DEFAULT NULL,
  `shop_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `user_id_fk` (`marchent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`shop_id`, `marchent_id`, `shop_name`, `shop_address`, `shop_description`, `shop_icon`) VALUES
(9, 17, 'Electronic deals', 'jerusalem', 'Welcome to Electronic Deals. We try to have the best products with the highest quality at unbeatable prices and present them to our valued customers at \"too good to be true prices\".Please add us to your list of favorite sellers and visit often. Happy Shopping :)', '1748183829_62848bde3cc47b6d7524.jpg'),
(10, 18, 'Discount computers', 'ramallah', 'Welcome to Discount Computer Depot! We are proud to sell Microsoft Authorized Refurbished desktop and laptop computers here on eBay! We not only offer the computers themselves, but have any array of other parts and electronics like motherboards, projectors, printers, Apple iPads and MacBooks, Chromebooks, and a lot more! Feel free to contact us today with any questions, or use the Make Offer button on applicable listings to send a messsage directly to sales.', '1748186611_eb1d99a5cedd0df4d7d8.jpg'),
(11, 19, 'Quartz whatches', 'qalqelia', 'Quartz Watches Inc. 805-791-9300. We specialize in Wholesale Luxury Swiss Watches. We buy and trade watches. RAYMOND WEIL LONGINES EBEL CHRISTIAN DIOR TAG HEUER INVICTA CITIZEN GUCCI ORIS OMEGA MICHELE BREITLING CARTIER TECHNOMARINE MOVADO GUCCI HAMILTON ZENITH WRISTWATCH TIMEPIECE AUTOMATIC CHRONOGRAPH LIMITED EDITION LINK AQUARACER SEAMASTER PLANET OCEAN FORMULA 1 F1 LADIES MENS CARRERA SPEEDMASTER RAILMASTER Worldwide Shipping Available.', '1748188053_2b6006be35e2dc86cc82.jpg'),
(12, 20, 'adidas', 'jerusalem', 'At adidas, our love for sport drives who we are and what we do. Every day.  It is not only about faster shoes and fashion statements. Just as a shoe is more than padding and foam, there is more to us than just the product. Everything we do is bound by one simple thought: we strive to help you perform at your best. Your success is our ambition. Your defeat spurs us on to be better.', '1748190796_876335d6dee58041abba.jpg'),
(13, 21, 'HomeGarden', 'jerusalem', '[vixlonhome] Your Outdoor Living Essentials Store Welcome to vixlonhome', '1748196473_e335c3cd7b85ce022bd1.jpg'),
(14, 22, 'MG', 'ramallah', 'Welcome to MG the thrift store where every purchase supports autism awareness and inclusion located in Nashville, TN. I\'m thrilled to take you on a journey through our store, where every item holds a piece of someone\'s past and a promise for a brighter future.', '1748196965_94cca00e11dde2e9df75.jpg'),
(15, 23, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE IF NOT EXISTS `subcategories` (
  `subcategory_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `subcategory_name` varchar(255) NOT NULL,
  PRIMARY KEY (`subcategory_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`subcategory_id`, `category_id`, `subcategory_name`) VALUES
(1, 1, 'Computers, Tablets & Network Hardware'),
(2, 1, 'Cell Phones, Smart Watches & Accessories'),
(3, 1, 'Video Games & Consoles'),
(4, 1, 'Cameras & Photo'),
(5, 2, 'Clothing & Accessories'),
(6, 2, 'Women'),
(7, 2, 'Men'),
(8, 2, 'Handbags'),
(9, 2, 'Collectible Sneakers'),
(10, 3, 'Home & Garden'),
(11, 3, 'Yard, Garden & Outdoor Living Items'),
(12, 3, 'Tools & Workshop Equipment'),
(13, 3, 'Home Improvement'),
(14, 3, 'Kitchen, Dining & Bar Supplies'),
(15, 4, 'Health & Beauty'),
(16, 5, 'Sporting Goods'),
(17, 5, 'Hunting Equipment'),
(18, 5, 'Golf Equipment'),
(19, 5, 'Outdoor Sports'),
(20, 5, 'Cycling Equipment'),
(21, 6, 'Books, Movies & Music'),
(23, 8, 'Restaurant & Food Service'),
(24, 9, 'Parts & Accessories'),
(25, 9, 'Cars & Trucks'),
(26, 9, 'Motorcycles'),
(27, 9, 'Other Vehicles'),
(28, 10, 'Pet Supplies'),
(29, 2, 'Luxury Watches'),
(30, 2, 'Wristwatches'),
(31, 2, 'Fashion Jewelry'),
(32, 2, 'Fine Jewelry'),
(33, 3, 'Trading Cards & Art'),
(34, 3, 'Collectibles'),
(35, 3, 'Coins & Paper Money'),
(36, 3, 'Sports Memorabilia'),
(37, 6, 'Baby Essentials');

-- --------------------------------------------------------

--
-- Table structure for table `suborders`
--

DROP TABLE IF EXISTS `suborders`;
CREATE TABLE IF NOT EXISTS `suborders` (
  `suborder_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL,
  `condition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`suborder_id`),
  KEY `order_id_fk` (`order_id`),
  KEY `shop_id_fk` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `suborders`
--

INSERT INTO `suborders` (`suborder_id`, `order_id`, `shop_id`, `subtotal`, `status`, `condition`) VALUES
(30, 26, 14, 44.03, 'pending', 'seen'),
(31, 26, 13, 328.99, 'pending', 'unseen');

-- --------------------------------------------------------

--
-- Table structure for table `suborder_items`
--

DROP TABLE IF EXISTS `suborder_items`;
CREATE TABLE IF NOT EXISTS `suborder_items` (
  `suborder_item_id` int NOT NULL AUTO_INCREMENT,
  `suborder_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`suborder_item_id`),
  KEY `suborder_id_fk` (`suborder_id`),
  KEY `product_id_fk` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `suborder_items`
--

INSERT INTO `suborder_items` (`suborder_item_id`, `suborder_id`, `product_id`, `quantity`, `price`) VALUES
(36, 30, 32, 1, 44.03),
(37, 31, 30, 1, 328.99);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_type` varchar(64) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userName`, `first_name`, `last_name`, `email`, `password`, `address`, `user_type`, `remember_token`) VALUES
(1, 'masjcnkf', '', '', 'root@hotmail.com', '$2y$10$eJUGS7fqFqnf1rate2ntsu9D1bZ.2.V7YWSXkYt4wL8dKl9ZkhCOW', 'ramallah', 'customer', NULL),
(2, 'Mahmoud zatari', '', '', 'Mahmoud@hotmail.com', '$2y$10$a0lTLEYXz9hHGLrmTTxJmepyM8j2Bm8SCqw2rEmo0o0lK0tp6uuPO', NULL, 'customer', NULL),
(3, 'Mahmoud zatari', '', '', 'root@hotmail.com', '$2y$10$Df93ENTQw3bibe.KwUb0BOILq7dvjpxDhPc/viHeiTribX3j7eVzO', NULL, 'customer', NULL),
(6, 'M7mood', '', '', 'test@hotmail.com', '$2y$10$jI9.qf8Iyntr1YkJjp.fUu8j6Zqfg2Ux/Rl6NoNoKRLS.sgvk1xba', NULL, 'customer', NULL),
(8, 'M7mood1z2', 'Mahmoud', 'Zatari', 'M7mood1z2@hotmail.com', '$2y$10$lrUWpjpt6rfeqm.WhMk3i.XxqJNMZjDKkH0sepHkObGlCQxqvU4C6', NULL, 'customer', NULL),
(12, 'test5', 'test', 'test', 'test5@hotmail.com', '$2y$10$zpnH85d0Qqp8R9JUbfUWaOlpxKjrjiBCGRulqEhQfz3dhq1dfr.sO', NULL, 'customer', NULL),
(13, 'test6', 'test', 'test', 'test6@hotmail.com', '$2y$10$.t4KwOWdEMmC.PAJxRUahutJZcx57O6AQP09F3O5vpCvmP2pus0Hu', NULL, 'customer', NULL),
(16, 'abd123', 'abduallh', 'abualwlaya', 'abd1@hotmail.com', '$2y$10$WJgwcLnpDNtdQHmiiuv9b./PK65RdMn6rAvI/EUXDQ/DVORaLreNa', NULL, 'customer', NULL),
(17, 'Ahmad113', 'Ahmad', 'Ahmad', 'ahmad@hotmail.com', '$2y$10$NV3W9bSIiYezSVgDDKVroOCAwCN008sKHRtxCl6lxEP.Xy30Z8GAS', NULL, 'merchant', NULL),
(18, 'mar34343', 'mar1', 'mar1', 'mar1@hotmail.com', '$2y$10$mZRHx/S8xihc6ribcTokYufDbiTfEaShv9qPLEU12uOvU4OzRaNWS', NULL, 'merchant', NULL),
(19, 'mar22321', 'mar2', 'mar2', 'mar2@hotmail.com', '$2y$10$47MX/O7.ZS3TsvA4qJjFueEO4XV407HdMRGhkSshdA9YmDEdgLbeu', NULL, 'merchant', NULL),
(20, 'mar35324', 'mar3', 'mar3', 'mar3@hotmail.com', '$2y$10$VI3gG4bMBlPXkhqm9JawkOIeJ6EA5ny1Z9P433gW3Pc.mPGhHewuy', NULL, 'merchant', NULL),
(21, 'mar42342', 'mar4', 'mar4', 'mar4@hotmail.com', '$2y$10$zwBiGM1OxGpPOCRXYBHXhulC7eo6rQHp5RThU271vnanLRfVx521m', NULL, 'merchant', NULL),
(22, 'mar52143', 'mar5', 'mar5', 'mar5@hotmail.com', '$2y$10$MRs.yEIUkIele64zRDqyQeOS8QyIDhm2i3WnOgK7JZF.iHL2jJwWS', NULL, 'merchant', NULL),
(23, 'Mar7435', 'mar7', 'mar7', 'mar7@hotmail.com', '$2y$10$G/2SMJf7YnX9NaqYhzQRYeyZ6dNIC1VVr14aJq/KmPeNgF/.XAp02', NULL, 'merchant', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `wishlist_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wishlist_id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`subcategory_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_ibfk_1` FOREIGN KEY (`marchent_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `catigories` (`category_id`) ON DELETE CASCADE;

--
-- Constraints for table `suborders`
--
ALTER TABLE `suborders`
  ADD CONSTRAINT `suborders_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `suborders_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `suborder_items`
--
ALTER TABLE `suborder_items`
  ADD CONSTRAINT `suborder_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `suborder_items_ibfk_2` FOREIGN KEY (`suborder_id`) REFERENCES `suborders` (`suborder_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
