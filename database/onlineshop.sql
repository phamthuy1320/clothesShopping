-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 20, 2020 lúc 07:04 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `onlineshop`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Cloth Brand');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1),
(153, 10, '::1', 26, 1),
(154, 17, '::1', 26, 1),
(156, 1, '::1', 26, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Quần áo nữ'),
(2, 'Quần áo nam'),
(3, 'Quần áo trẻ em');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(2, 26, 'Pham Thuy', 'phamthithuy1320@gmail.com', 'Nam Dinh,Viet Nam', 'Nam Dinh', 'ok', 153885, 'gthyju', '13248798', '12/12', 1, 1000, 318),
(3, 28, 'Nguyen A', 'abc@gmail.com', 'A', 'B', 'Cau Giay', 123456, 'Nguyen A', '123456789', '12/10', 1, 200000, 1233);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` mediumtext NOT NULL,
  `product_image` mediumtext NOT NULL,
  `product_link` text NOT NULL,
  `product_keywords` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_link`, `product_keywords`) VALUES
(1, 2, 1, 'Áo ba lỗ nam', 100000, 'Áo ba lỗ nam', '58183.jpg', 'http://assets.myntassets.com/v1/images/style/properties/c5c095c0e09eb200aa8d57457c53ec07_images.jpg', 'Áo'),
(3, 2, 1, 'Áo khoác nam xám', 400000, 'Áo khoác nam xám', '21977.jpg', 'http://assets.myntassets.com/v1/images/style/properties/59912a0287751ff0475c8748dbcf4ea0_images.jpg', 'Áo khoác'),
(5, 1, 1, 'Áo ngực màu be nữ', 200000, 'Áo ngực màu be nữ', '54118.jpg', 'http://assets.myntassets.com/v1/image/style/properties/51832/Bwitch-Beige-Full-Coverage-Bra-BW335_1_d516fa94f14f0a5ecc90df7754390eb5.jpg', 'Áo'),
(6, 2, 1, 'Áo phông đen nam', 100000, 'Áo phông đen nam', '49653.jpg', 'http://assets.myntassets.com/v1/images/style/properties/296a8c388d05d67346db88af27d3b763_images.jpg', 'Áo phông'),
(7, 2, 1, 'Áo phông đỏ nam', 100000, 'Áo phông đỏ nam', '12967.jpg', 'http://assets.myntassets.com/v1/images/style/properties/b34550bc6415dcd66892de4ef2837fd9_images.jpg', 'Áo phông'),
(8, 2, 1, 'Áo phông kẻ ngang nam', 100000, 'Áo phông kẻ ngang nam', '12369.jpg', 'http://assets.myntassets.com/v1/images/style/properties/02e4e32cd9d09052f0ec3d46fa747d39_images.jpg', 'Áo phông'),
(9, 2, 1, 'Áo phông ko tay nam đỏ', 100000, 'Áo phông ko tay nam đỏ', '48781.jpg', 'http://assets.myntassets.com/v1/images/style/properties/eba1c1b241555d8afa3f7232ed2c6933_images.jpg', 'Áo phông'),
(10, 2, 1, 'Áo phông nam đen', 100000, 'Áo phông nam đen', '5865.jpg', 'http://assets.myntassets.com/v1/images/style/properties/135f9aa8141d682fc218393049c70324_images.jpg', 'Áo phông'),
(11, 2, 1, 'Áo phông nam xám hoạt hình', 100000, 'Áo phông nam xám hoạt hình', '1855.jpg', 'http://assets.myntassets.com/v1/images/style/properties/9c1b19682ecf926c296f520d5d6e0972_images.jpg', 'Áo phông'),
(12, 2, 1, 'Áo phông nam xanh', 100000, 'Áo phông nam xanh', '3954.jpg', 'http://assets.myntassets.com/v1/images/style/properties/2d986dbf9e5f64e3ab8471120c557db4_images.jpg', 'Áo phông'),
(13, 1, 1, 'Áo phông nữ hoạt hình', 200000, 'Áo phông nữ hoạt hình', '4729.jpg', 'http://assets.myntassets.com/v1/images/style/properties/b56e261f9206aa95e42c43f4e62d0e5a_images.jpg', 'Áo'),
(14, 2, 1, 'Áo phông puma nam đen', 100000, 'Áo phông puma nam đen', '59607.jpg', 'http://assets.myntassets.com/v1/images/style/properties/Puma-Men-Grey-T-shirt_32668f8a61454d0cc028a808cf21b383_images.jpg', 'Áo phông'),
(15, 2, 1, 'Áo phông thể thao nam đen', 100000, 'Áo phông thể thao nam đen', '10268.jpg', 'http://assets.myntassets.com/v1/images/style/properties/cd16e955e4b6b3f9d7089c15652a3f00_images.jpg', 'Áo phông'),
(16, 2, 1, 'Áo phông thể thao nam xanh dương', 100000, 'ÁO phông thể thao nam xanh dương', '6628.jpg', 'http://assets.myntassets.com/v1/images/style/properties/7a1bc7d255671c7f4b85f1b1b35e945b_images.jpg', 'Áo phông'),
(18, 1, 1, 'Áo phông xanh nữ', 200000, 'Áo phông xanh nữ', '2288.jpg', 'http://assets.myntassets.com/v1/images/style/properties/fe446adf94f9beb301b61bfc75a70bfa_images.jpg', 'Áo'),
(19, 1, 1, 'Áo sali nữ', 200000, 'Áo sali nữ', '49495.jpg', 'http://assets.myntassets.com/v1/images/style/properties/FNF-Green-Collection-for-Wedding-Wear-Sari_6c60eef0b8d9cff87cfcd1f73953e5cd_images.jpg', 'Áo'),
(20, 2, 1, 'Áo sơ mi cộc tay nam', 300000, 'Áo sơ mi cộc tay nam', '9036.jpg', 'http://assets.myntassets.com/v1/images/style/properties/John-Players-Men-Brown-Shirt_7eec3b0568f65dc8f39a534376538551_images.jpg', 'Áo sơ mi'),
(21, 2, 1, 'Áo sơ mi kẻ xọc nam', 300000, 'Áo sơ mi kẻ xọc nam', '20099.jpg', 'http://assets.myntassets.com/v1/images/style/properties/5e557eb0be7c6420f7c7a6bbaa432993_images.jpg', 'Áo sơ mi'),
(22, 2, 1, 'Áo sơ mi nam', 300000, 'Áo sơ mi nam', '48311.jpg', 'http://assets.myntassets.com/v1/images/style/properties/0be615f02ae1f1cfe78155555a79007c_images.jpg', 'Áo sơ mi'),
(23, 2, 1, 'Áo sơ mi nam tím', 300000, 'Áo sơ mi nam tím', '48123.jpg', 'http://assets.myntassets.com/v1/images/style/properties/8bc9be576081baae77e8561b1132288f_images.jpg', 'Áo sơ mi'),
(24, 2, 1, 'Áo sơ mi nam xanh kẻ xọc', 300000, 'Áo sơ mi nam xanh kẻ xọc', '5891.jpg', 'http://assets.myntassets.com/v1/images/style/properties/06e9d4231254fdb2c7fe967ad413ad7b_images.jpg', 'Áo sơ mi'),
(25, 1, 1, 'Áo sơ mi nữ tím', 200000, 'Áo sơ mi nữ tím', '18005.jpg', 'http://assets.myntassets.com/v1/images/style/properties/45ddbc6a15140556214e15923244755b_images.jpg', 'Áo'),
(26, 2, 1, 'Áo sơ mi xanh ca rô nam', 300000, 'Áo sơ mi xanh ca rô nam', '26960.jpg', 'http://assets.myntassets.com/v1/images/style/properties/7a5b82d1372a7a5c6de67ae7a314fd91_images.jpg', 'Áo sơ mi'),
(27, 2, 1, 'Áo sơ mi xanh than nam', 300000, 'Áo sơ mi xanh than nam', '17429.jpg', 'http://assets.myntassets.com/v1/images/style/properties/3af9f145845d8453a066322de35980af_images.jpg', 'Áo sơ mi'),
(28, 1, 1, 'Áo thể thao nữ tím', 200000, 'Áo thể thao nữ tím', '9204.jpg', 'http://assets.myntassets.com/v1/images/style/properties/206a0614c4644cd8816576efd47d60d8_images.jpg', 'Áo'),
(29, 2, 1, 'Áo phông nam hồng', 100000, 'Áo phông nam hồng', '23278.jpg', 'http://assets.myntassets.com/v1/images/style/properties/8d7f0bbb0bdefcbcc692bcdf4a6400ee_images.jpg', 'Áo phông'),
(30, 2, 1, 'Bộ áo vét nam', 1000000, 'Bộ áo vét nam', '22198.jpg', 'http://assets.myntassets.com/v1/images/style/properties/0d2e2ceaaf6d09d447caad678b2edbe6_images.jpg', 'Áo vét'),
(31, 1, 1, 'Bộ quần áo nữ', 200000, 'Bộ quần áo nữ', '6842.jpg', 'http://assets.myntassets.com/v1/images/style/properties/Tonga-Women-Maroon-Top_e5cc855ba59e5640817434d45f9c088d_images.jpg', 'Áo'),
(32, 1, 1, 'Bộ quần áo nữ', 200000, 'Bộ quần áo nữ', '26538.jpg', 'http://assets.myntassets.com/v1/images/style/properties/SDL-by-Sweet-Dreams-Women-White-Pyjama-Set_debea45adf6bdb5816030e5d05b53d2f_images.jpg', 'Áo'),
(33, 2, 1, 'Cặp máy tính nam', 500000, 'Cặp máy tính nam', '2886.jpg', 'http://assets.myntassets.com/v1/images/style/properties/1847a81fa1d237bfbae1e797dff55909_images.jpg', 'Cặp'),
(34, 1, 1, 'Dép nữ', 35000, 'Dép nữ', '18237.jpg', 'http://assets.myntassets.com/v1/images/style/properties/8d6fd53f28e010658cdf5c14c43d0cb0_images.jpg', 'Dép'),
(35, 1, 1, 'Dép nữ đen', 35000, 'Dép nữ đen', '56825.jpg', 'http://assets.myntassets.com/v1/images/style/properties/94a9deea53125663d9bbe61cb38b84b4_images.jpg', 'Dép'),
(36, 2, 1, 'Dép tông đen nam', 30000, 'Dép tông đen nam', '35913.jpg', 'http://assets.myntassets.com/v1/images/style/properties/647838a2e988ab55b76c9aa9ddd15ad7_images.jpg', 'Dép'),
(37, 2, 1, 'Dép tông nam', 30000, 'Dép tông nam', '30805.jpg', 'http://assets.myntassets.com/v1/images/style/properties/b23f1e70aec0102c360fb9dfdc476023_images.jpg', 'Dép'),
(38, 2, 1, 'Dép tông nam đen', 30000, 'Dép tông nam đen', '18461.jpg', 'http://assets.myntassets.com/v1/images/style/properties/4d90e05b9e99e203b3ce191439619bcb_images.jpg', 'Dép'),
(39, 1, 1, 'Dép tông nữ', 35000, 'Dép tông nữ', '4943.jpg', 'http://assets.myntassets.com/v1/images/style/properties/Carlton-London-Women-Black-Gladiator-Sandals_b8f695202ccc1889f65d57b4000a888f_images.jpg', 'Dép'),
(40, 1, 1, 'Dép tông nữ', 35000, 'Dép tông nữ', '58513.jpg', 'http://assets.myntassets.com/v1/images/style/properties/69482728a521cbd2ba571e36016d5f63_images.jpg', 'Dép'),
(41, 2, 1, 'Đồng hồ casio nam', 1000000, 'Đồng hồ casio nam', '45856.jpg', 'http://assets.myntassets.com/assets/images/17429/2018/3/5/11520250143953-CASIO-G-Shock-Men-Black-Digital-Watch-G223-8211520250143786-1.jpg', 'Đồng hồ'),
(42, 1, 1, 'Đồng hồ trắng bạc nữ', 1000000, 'Đồng hồ trắng bạc nữ', '39988.jpg', 'http://assets.myntassets.com/v1/images/style/properties/Titan-Women-Silver-Watch_b4ef04538840c0020e4829ecc042ead1_images.jpg', 'Đồng hồ'),
(43, 2, 1, 'Đồng hồ nam', 1000000, 'Đồng hồ nam', '13089.jpg', 'http://assets.myntassets.com/v1/images/style/properties/b8024bdd3fc47c2b20bd840f89811979_images.jpg', 'Đồng hồ'),
(44, 2, 1, 'Đồng hồ nam', 1000000, 'Đồng hồ nam', '8580.jpg', 'http://assets.myntassets.com/v1/images/style/properties/80c170d3a8e46c81f22ecebd1f772d32_images.jpg', 'Đồng hồ'),
(45, 2, 1, 'Đồng hồ nam carrera', 1000000, 'Đồng hồ nam carrera', '43369.jpg', 'http://assets.myntassets.com/v1/images/style/properties/b2959d44db543af13d78492225a830de_images.jpg', 'Đồng hồ'),
(46, 2, 1, 'Đồng hồ nam đen', 1000000, 'Đồng hồ nam đen', '29928.jpg', 'http://assets.myntassets.com/v1/images/style/properties/Skagen-Men-Black-Watch_4982b2b1a76a85a85c9adc8b4b2d523a_images.jpg', 'Đồng hồ'),
(47, 2, 1, 'Đồng hồ nam màu bạc', 1000000, 'Đồng hồ nam màu bạc', '10866.jpg', 'http://assets.myntassets.com/v1/images/style/properties/93aa34922c6446706c003ba2255747f5_images.jpg', 'Đồng hồ'),
(48, 2, 1, 'Đồng hồ nam maxima', 1000000, 'Đồng hồ nam maxima', '42841.jpg', 'http://assets.myntassets.com/v1/images/style/properties/676dd802241d46a5ce28c78d1dabbc5a_images.jpg', 'Đồng hồ'),
(49, 2, 1, 'Đồng hồ nam police', 1000000, 'Đồng hồ nam police', '11188.jpg', 'http://assets.myntassets.com/v1/images/style/properties/Police-Men-Black-Dial-Watch_5bd8cae4fc61052a6f00cfcd69c4a936_images.jpg', 'Đồng hồ'),
(50, 1, 1, 'Đồng hồ nữ trắng bạc', 600000, 'Đồng hồ nữ trắng bạc', '33822.jpg', 'http://assets.myntassets.com/v1/images/style/properties/072af0cd079f20296c72f3594a21f141_images.jpg', 'Đồng hồ'),
(51, 1, 1, 'Giày cao cổ nữ đen', 500000, 'Giày cao cổ nữ đen', '29584.jpg', 'http://assets.myntassets.com/v1/images/style/properties/70e74ca34b3b534b19d6b006d5bfad0a_images.jpg', 'Giày'),
(52, 2, 1, 'Giày da nam', 550000, 'Giày da nam', '16957.jpg', 'http://assets.myntassets.com/v1/images/style/properties/Arrow-Men-Black-Formal-Shoes_70a3c7c185338a5636c8c0e668829bb6_images.jpg', 'Giày'),
(53, 2, 1, 'Giày da nam', 550000, 'Giày da nam', '29114.jpg', 'http://assets.myntassets.com/v1/images/style/properties/2976e4095e7b3ae2de99df54d2adeaaa_images.jpg', 'Giày'),
(54, 2, 1, 'Giày da nam', 550000, 'Giày da nam', '21379.jpg', 'http://assets.myntassets.com/v1/images/style/properties/06edc2da9c6d103d299e5e8dafc5b6b9_images.jpg', 'Giày'),
(55, 2, 1, 'Giày nam đỏ', 550000, 'Giày nam đỏ', '46885.jpg', 'http://assets.myntassets.com/v1/images/style/properties/6a6ebc47eaf2fe034bcfd94060a285ba_images.jpg', 'Giày'),
(56, 2, 1, 'Giày nam xám', 550000, 'Giày nam xám', '32138.jpg', 'http://assets.myntassets.com/v1/images/style/properties/Vans-Men-Khaki-Shoes_dcaf7c703e9c0396650529df2b2a8893_images.jpg', 'Giày'),
(57, 1, 1, 'Giày nữ ca rô tím', 500000, 'Giày nữ ca rô tím', '43993.jpg', 'http://assets.myntassets.com/v1/images/style/properties/49f884ddf4420d869ad143857d3bc33d_images.jpg', 'Giày'),
(58, 2, 1, 'Giày thể thao nam', 550000, 'Giày thể thao nam', '42419.jpg', 'http://assets.myntassets.com/v1/images/style/properties/52ad8ae288ba080d88a116b3c70305ec_images.jpg', 'Giày'),
(59, 2, 1, 'Giày thể thao nam đen', 550000, 'Giày thể thao nam đen', '18653.jpg', 'http://assets.myntassets.com/v1/images/style/properties/051d64772f1b38ff476fbf0a807f365a_images.jpg', 'Giày'),
(60, 2, 1, 'Giày thể thao nam trắng xám', 550000, 'Giày thể thao nam trắng xám', '8574.jpg', 'http://assets.myntassets.com/v1/images/style/properties/0707b75d2d44e9cec9d27c944294ddbe_images.jpg', 'Giày'),
(61, 2, 1, 'Giày thể thao trắng nam', 550000, 'Giày thể thao trắng nam', '53759.jpg', 'http://assets.myntassets.com/v1/images/style/properties/9c3d77147758ab10f12caf6184fe13ef_images.jpg', 'Giày'),
(62, 1, 1, 'Kẹp tóc nữ', 20000, 'Kẹp tóc nữ', '30039.jpg', 'http://assets.myntassets.com/v1/images/style/properties/aff52e6e6bc208923a493612e8f6a3e7_images.jpg', 'Kẹp tóc'),
(63, 2, 1, 'Khăn quàng cổ nam', 100000, 'Khăn quàng cổ nam', '9452.jpg', 'http://assets.myntassets.com/v1/images/style/properties/aeb9132a29d8844aca73a4544d8135c5_images.jpg', 'Khăn'),
(64, 1, 1, 'Kính râm nữ', 200000, 'Kính râm nữ', '44984.jpg', 'http://assets.myntassets.com/v1/images/style/properties/Image-Men-Classic-Eyewear-Black-Sunglasses_a37f3b87d0d05062ed063adc7aac78bf_images.jpg', 'Kính râm'),
(65, 1, 1, 'Móc khóa nữ', 20000, 'Móc khóa nữ', '51832.jpg', 'http://assets.myntassets.com/v1/images/style/properties/92589dc7416b70f1a5c6a4c1f13d14e3_images.jpg', 'Móc Khóa'),
(66, 2, 1, 'Nước hoa nam', 1000000, 'Nước hoa nam', '2872.jpg', 'http://assets.myntassets.com/v1/images/style/properties/3295fc148576955745c0b259d7968727_images.jpg', 'Nước hoa'),
(67, 1, 1, 'Nước hoa nữ police', 500000, 'Nước hoa nữ police', '44970.jpg', 'http://assets.myntassets.com/v1/images/style/properties/438c41900a80acabb3ef197f0559a9eb_images.jpg', 'Nước hoa'),
(68, 2, 1, 'Quần bò nam', 220000, 'Quần bò nam', '39386.jpg', 'http://assets.myntassets.com/v1/images/style/properties/4850873d0c417e6480a26059f83aac29_images.jpg', 'Quần'),
(69, 2, 1, 'Quần dài thể thao nam đen', 220000, 'Quần dài thể thao nam đen', '13419.jpg', 'http://assets.myntassets.com/v1/images/style/properties/8153dc35d9a5420eeb93922067137db6_images.jpg', 'Quần'),
(70, 2, 1, 'Quần đùi nam xanh', 220000, 'Quần đùi nam xanh', '29570.jpg', 'http://assets.myntassets.com/v1/images/style/properties/Do-u-speak-green-Men-Blue-Shorts_40b6775eae62124195817a64d4ae4a93_images.jpg', 'Quần'),
(71, 2, 1, 'Quần lửng thể thao nam đen', 220000, 'Quần lửng thể thao nam đen', '59263.jpg', 'http://assets.myntassets.com/v1/images/style/properties/91ca48e3204f23cd376fad7f186875bf_images.jpg', 'Quần'),
(72, 1, 1, 'Son nữ đỏ thẫm', 600000, 'Son nữ đỏ thẫm', '37812.jpg', 'http://assets.myntassets.com/assets/images/56019/2019/1/11/49d718c4-6d86-42d1-8d00-1ce4b7851b2c1547190759839-Colorbar-Soft-Touch-Show-Stopper-Copper-Lipstick-037-2715471-1.jpg', 'Son'),
(73, 1, 1, 'Sơn móng nữ xám', 20000, 'Sơn móng nữ xám', '47957.jpg', 'http://assets.myntassets.com/v1/images/style/properties/Streetwear-Ash-Nail-Polish--31_21d33100dbf0e4b8bb0b33a980de469b_images.jpg', 'Sơn móng'),
(74, 2, 1, 'Tất nam đen', 50000, 'Tất nam đen', '39524.jpg', 'http://assets.myntassets.com/v1/images/style/properties/4ca8848ab441378a392d9d5bf0b0f3c7_images.jpg', 'Tất'),
(75, 1, 1, 'Thắt lưng nữ', 50000, 'Thắt lưng nữ', '25349.jpg', 'http://assets.myntassets.com/v1/images/style/properties/8eee4563e14cf451b07f27761fd6535f_images.jpg', 'Thắt lưng'),
(76, 1, 1, 'Thắt lưng nữ đen', 600000, 'Thắt lưng nữ đen', '56019.jpg', 'http://assets.myntassets.com/v1/images/style/properties/2eb3aa5eefb3319f10f7815100a18e3c_images.jpg', 'Thắt lưng'),
(77, 1, 1, 'Thắt lưng nữ đen', 100000, 'Thắt lưng nữ đen', '19123.jpg', 'http://assets.myntassets.com/v1/images/style/properties/Peter-England-Men-Formal-Black-Beltbc472bd919c505690ecbc1eed8af7fbf_images.jpg', 'Thắt lưng'),
(78, 1, 1, 'Túi da nữ be', 500000, 'Túi da nữ be', '38402.jpg', 'http://assets.myntassets.com/v1/images/style/properties/97d3bb4a71c9f7da88305ce9144d8576_images.jpg', 'Túi xách'),
(79, 1, 1, 'Túi da nữ nâu', 500000, 'Túi da nữ nâu', '38630.jpg', 'http://assets.myntassets.com/v1/images/style/properties/88d0bc675d72477729f38c30332e749a_images.jpg', 'Túi xách'),
(80, 1, 1, 'Túi hoa nữ', 500000, 'Túi hoa nữ', '51658.jpg', 'http://assets.myntassets.com/v1/images/style/properties/Murcia-Women-Blue-Handbag_13cfaff26872c298112a8e7da15c1e1d_images.jpg', 'Túi xách'),
(81, 1, 1, 'Túi xách ca rô nữ', 500000, 'Túi xách ca rô nữ', '59435.jpg', 'http://assets.myntassets.com/v1/images/style/properties/73bc7d63943231e4df1c7b7600496a3d_images.jpg', 'Túi xách'),
(82, 1, 1, 'Túi xách nữ  xanh dương', 500000, 'Túi xách nữ  xanh dương', '39716.jpg', 'http://assets.myntassets.com/v1/images/style/properties/8b58c65e5634233b165c40cdbbcf58b8_images.jpg', 'Túi xách'),
(83, 1, 1, 'Túi xách nữ nâu', 500000, 'Túi xách nữ nâu', '29742.jpg', 'http://assets.myntassets.com/v1/images/style/properties/b14c7bf275c6edca3e849200fb7cbf6c_images.jpg', 'Túi xách'),
(84, 1, 1, 'Túi xách nữ trắng', 500000, 'Túi xách nữ trắng', '54924.jpg', 'http://assets.myntassets.com/v1/images/style/properties/Rocky-S-Women-White-Handbag_1440a0abd2ddaf3199965e604831b164_images.jpg', 'Túi xách'),
(86, 1, 1, 'Váy nữ xanh dương', 300000, 'Váy nữ xanh dương', '18839.jpg', 'http://assets.myntassets.com/v1/images/style/properties/c5b0d7c1f0308be020655bc10ca16427_images.jpg', 'Váy'),
(87, 3, 1, 'Áo phông trẻ em xanh lá nam', 60000, 'Áo phông trẻ em xanh lá nam', '47359.jpg', 'http://assets.myntassets.com/v1/images/style/properties/0108969213975af06095ff84a0ec0c72_images.jpg', 'Áo phông'),
(88, 3, 1, 'Dép quai hậu trẻ em', 40000, 'Dép quai hậu trẻ em', '45258.jpg', 'http://assets.myntassets.com/v1/images/style/properties/c5a22e9ccf9b10e0a89ffbbf3e386584_images.jpg', 'Dép'),
(89, 3, 1, 'Dép ben10 trẻ em', 40000, 'Dép ben10 trẻ em', '15528.jpg', 'http://assets.myntassets.com/v1/images/style/properties/5cab6a2305d0e63142f721228aa6d293_images.jpg', 'Dép'),
(90, 3, 1, 'Giày trẻ em trắng', 300000, 'Giày trẻ em trắng', '7990.jpg', 'http://assets.myntassets.com/v1/images/style/properties/4eff2353c62ec8b7bca9fbbaf5996bd2_images.jpg', 'Giày'),
(91, 3, 1, 'Dép trẻ em hồng', 40000, 'Dép trẻ em hồng', '59051.jpg', 'http://assets.myntassets.com/v1/images/style/properties/0be6693dafb4261645b22c6e9e7e67f4_images.jpg', 'Dép'),
(92, 3, 1, 'Dép tông trẻ em', 40000, 'Dép tông trẻ em', '9660.jpg', 'http://assets.myntassets.com/v1/images/style/properties/53690e3f396f411e184b249672d6ebae_images.jpg', 'Dép'),
(93, 3, 1, 'Bộ quần áo trẻ em', 300000, 'Bộ quần áo trẻ em', '3168.jpg', 'http://assets.myntassets.com/v1/images/style/properties/1aae016d0abb224cfc18e6bd9bb01ad1_images.jpg', 'Áo'),
(99, 2, 1, 'Áo sơ mi đen nam', 300000, 'Áo sơ mi đen nam', '1592667365_dress_shirt_PNG.png', '../img/1592667365_dress_shirt_PNG.png', 'Áo sơ mi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(26, 'Pham', 'Thuy', 'phamthithuy1320@gmail.com', 'phamthuy@1320', '0123456789', 'Nam Dinh,Viet Nam', 'Nam Dinh'),
(27, 'pham', 'thuy', '1320@gmail.com', 'htuy@1320', '0375518575', 'Trần Bình, Cầu Giấy, Hà Nội', 'Hanoi'),
(28, 'Nguyen', 'A', 'abc@gmail.com', 'nguyena@1320', '0123456789', 'A', 'B');

--
-- Bẫy `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(26, 'Pham', 'Thuy', 'phamthithuy1320@gmail.com', 'phamthuy@1320', '0123456789', 'Nam Dinh,Viet Nam', 'Nam Dinh'),
(27, 'pham', 'thuy', '1320@gmail.com', 'htuy@1320', '0375518575', 'Trần Bình, Cầu Giấy, Hà Nội', 'Hanoi'),
(28, 'Nguyen', 'A', 'abc@gmail.com', 'nguyena@1320', '0123456789', 'A', 'B');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Chỉ mục cho bảng `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Chỉ mục cho bảng `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT cho bảng `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Các ràng buộc cho bảng `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
