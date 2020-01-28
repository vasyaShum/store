-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 28 2020 г., 22:32
-- Версия сервера: 5.6.38
-- Версия PHP: 7.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Процесори', NULL, NULL),
(2, 'Відеокарти', NULL, NULL),
(3, 'Материнські плати', NULL, NULL),
(4, 'Жорсткі диски', NULL, NULL),
(5, 'Корпуси', NULL, NULL),
(6, 'Блоки живлення\r\n', NULL, NULL),
(7, 'Модулі пам\'яті', NULL, NULL),
(8, 'Звукові плати', NULL, NULL),
(9, 'Інші товари', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `product_id`, `name`, `user_id`, `text`, `created_at`, `updated_at`) VALUES
(7, 2, 'Vasya', 2, 'Хороша відеокарта! Купив собі таку дуже задоволений...', '2019-06-25 15:29:34', '2019-06-25 15:29:34'),
(9, 23, 'Vasya', 2, 'Дуже гарний корпус. Рекомендую', '2019-06-25 22:48:13', '2019-06-25 22:48:13'),
(11, 23, 'Ivan', 4, 'Хочу собі такий.', '2019-06-26 10:51:40', '2019-06-26 10:51:40'),
(12, 22, 'Ivan', 4, 'Рекомендую!', '2019-06-26 10:52:17', '2019-06-26 10:52:17');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_06_08_121304_create_permission_tables', 2),
(9, '2019_06_19_095456_create_orders_table', 6),
(11, '2019_06_23_114035_create_comments_table', 7),
(12, '2014_10_12_000000_create_users_table', 8),
(17, '2019_06_13_080459_create_category_table', 9),
(18, '2019_06_08_144353_create_products_table', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_id`, `model_type`) VALUES
(1, 1, 'App\\User'),
(2, 2, 'App\\User'),
(2, 4, 'App\\User');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `cart`, `address`, `email`, `name`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:1:{i:3;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:2112;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:3;s:4:\"name\";s:55:\"МАТЕРИНСЬКА ПЛАТА GIGABYTE GA-970A-DS3P\";s:6:\"detail\";s:131:\"Виробник GIGABYTE Модель GA-970A-DS3P  Країна виробництва Тайвань Гарантія, міс 36\";s:5:\"price\";i:2112;s:5:\"count\";i:7;s:5:\"photo\";s:16:\"U0050090_big.jpg\";s:11:\"category_id\";i:3;s:10:\"created_at\";s:19:\"2019-06-19 12:05:10\";s:10:\"updated_at\";s:19:\"2019-06-19 12:05:10\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:3;s:4:\"name\";s:55:\"МАТЕРИНСЬКА ПЛАТА GIGABYTE GA-970A-DS3P\";s:6:\"detail\";s:131:\"Виробник GIGABYTE Модель GA-970A-DS3P  Країна виробництва Тайвань Гарантія, міс 36\";s:5:\"price\";i:2112;s:5:\"count\";i:7;s:5:\"photo\";s:16:\"U0050090_big.jpg\";s:11:\"category_id\";i:3;s:10:\"created_at\";s:19:\"2019-06-19 12:05:10\";s:10:\"updated_at\";s:19:\"2019-06-19 12:05:10\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:1;s:10:\"totalPrice\";i:2112;}', 'Рівне', 'admin@gmail.com', 'Vasya', '+380680410327', 'Відправлено', '2019-06-21 08:02:19', '2019-06-21 10:23:40'),
(2, 1, 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:1:{i:3;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:2112;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:3;s:4:\"name\";s:55:\"МАТЕРИНСЬКА ПЛАТА GIGABYTE GA-970A-DS3P\";s:6:\"detail\";s:131:\"Виробник GIGABYTE Модель GA-970A-DS3P  Країна виробництва Тайвань Гарантія, міс 36\";s:5:\"price\";i:2112;s:5:\"count\";i:7;s:5:\"photo\";s:16:\"U0050090_big.jpg\";s:11:\"category_id\";i:3;s:10:\"created_at\";s:19:\"2019-06-19 12:05:10\";s:10:\"updated_at\";s:19:\"2019-06-19 12:05:10\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:3;s:4:\"name\";s:55:\"МАТЕРИНСЬКА ПЛАТА GIGABYTE GA-970A-DS3P\";s:6:\"detail\";s:131:\"Виробник GIGABYTE Модель GA-970A-DS3P  Країна виробництва Тайвань Гарантія, міс 36\";s:5:\"price\";i:2112;s:5:\"count\";i:7;s:5:\"photo\";s:16:\"U0050090_big.jpg\";s:11:\"category_id\";i:3;s:10:\"created_at\";s:19:\"2019-06-19 12:05:10\";s:10:\"updated_at\";s:19:\"2019-06-19 12:05:10\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:1;s:10:\"totalPrice\";i:2112;}', 'Zdolbuniv, Rivnensla street', 'admin@gmail.com', 'Admin', '+380980757076', 'Відправлено', '2019-06-21 09:45:40', '2019-06-21 10:00:29'),
(6, 4, 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:2:{i:1;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:4480;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:1;s:4:\"name\";s:33:\"ПРОЦЕСОР AMD RYZEN 5 2600\";s:6:\"detail\";s:626:\"Виробник AMD Модель Ryzen 5 2600 Сімейство процесора AMD Ryzen Тип сокету AM4 Кількість ядер 6 ядер Частота ядра в Boost режимі 3.9GHz Кількість потоків 12 потоків Тактова частота ядра 3.4GHz Графічне ядро немає Об\'єм кеш-пам\'яті 2-го рівня 3MB Об\'єм кеш-пам\'яті 3-го рівня L3: 16MB Теплопакет 65W Тип поставки BOX Мікроархітектура Zen+ Країна виробництва Гонконг Гарантія, міс 36\";s:5:\"price\";i:4480;s:5:\"count\";i:5;s:5:\"photo\";s:16:\"U0290345_big.jpg\";s:11:\"category_id\";i:1;s:10:\"created_at\";s:19:\"2019-06-17 16:48:05\";s:10:\"updated_at\";s:19:\"2019-06-18 08:01:45\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:1;s:4:\"name\";s:33:\"ПРОЦЕСОР AMD RYZEN 5 2600\";s:6:\"detail\";s:626:\"Виробник AMD Модель Ryzen 5 2600 Сімейство процесора AMD Ryzen Тип сокету AM4 Кількість ядер 6 ядер Частота ядра в Boost режимі 3.9GHz Кількість потоків 12 потоків Тактова частота ядра 3.4GHz Графічне ядро немає Об\'єм кеш-пам\'яті 2-го рівня 3MB Об\'єм кеш-пам\'яті 3-го рівня L3: 16MB Теплопакет 65W Тип поставки BOX Мікроархітектура Zen+ Країна виробництва Гонконг Гарантія, міс 36\";s:5:\"price\";i:4480;s:5:\"count\";i:5;s:5:\"photo\";s:16:\"U0290345_big.jpg\";s:11:\"category_id\";i:1;s:10:\"created_at\";s:19:\"2019-06-17 16:48:05\";s:10:\"updated_at\";s:19:\"2019-06-18 08:01:45\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:2;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:2346;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:2;s:4:\"name\";s:54:\"ВІДЕОКАРТА GIGABYTE GEFORCE GT1030 2048MB OC\";s:6:\"detail\";s:984:\"Виробник GIGABYTE Модель GeForce GT1030 2048Mb OC Сімейство графіки NVIDIA Графічний чіп GeForce GT 1030 Інтерфейс PCI Express 3.0 Об\'єм вбудованої пам\'яті 2 ГБ Тип пам\'яті GDDR 5 Розрядність шини пам\'яті 64 Bit Частота ядра (Base) 1290 MHz Частота ядра (Boost) 1544 MHz Частота пам\'яті 6008 MHz Максимальне число дисплеїв 2 Максимальна роздільна здатність 4096 x 2160 Роз\'єми HDMI, DVI Тип системи охолодження активний Вид охолодження радіатор, кулер Кількість вентиляторів 1 шт Мінімальна рекомендована потужність блоку живлення 300 Вт Версія DirectX 12 Версія OpenGL 4.5 Країна виробництва Китай Гарантія, міс 36\";s:5:\"price\";i:2346;s:5:\"count\";i:10;s:5:\"photo\";s:16:\"U0246322_big.jpg\";s:11:\"category_id\";i:2;s:10:\"created_at\";s:19:\"2019-06-18 07:58:56\";s:10:\"updated_at\";s:19:\"2019-06-18 07:58:56\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:2;s:4:\"name\";s:54:\"ВІДЕОКАРТА GIGABYTE GEFORCE GT1030 2048MB OC\";s:6:\"detail\";s:984:\"Виробник GIGABYTE Модель GeForce GT1030 2048Mb OC Сімейство графіки NVIDIA Графічний чіп GeForce GT 1030 Інтерфейс PCI Express 3.0 Об\'єм вбудованої пам\'яті 2 ГБ Тип пам\'яті GDDR 5 Розрядність шини пам\'яті 64 Bit Частота ядра (Base) 1290 MHz Частота ядра (Boost) 1544 MHz Частота пам\'яті 6008 MHz Максимальне число дисплеїв 2 Максимальна роздільна здатність 4096 x 2160 Роз\'єми HDMI, DVI Тип системи охолодження активний Вид охолодження радіатор, кулер Кількість вентиляторів 1 шт Мінімальна рекомендована потужність блоку живлення 300 Вт Версія DirectX 12 Версія OpenGL 4.5 Країна виробництва Китай Гарантія, міс 36\";s:5:\"price\";i:2346;s:5:\"count\";i:10;s:5:\"photo\";s:16:\"U0246322_big.jpg\";s:11:\"category_id\";i:2;s:10:\"created_at\";s:19:\"2019-06-18 07:58:56\";s:10:\"updated_at\";s:19:\"2019-06-18 07:58:56\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:2;s:10:\"totalPrice\";i:6826;}', 'Рівне, вулиця Тичини 20', 'ivanov@gmail.com', 'Ivan Ivanov', '380985555555', 'Відправлено', '2019-06-25 10:06:24', '2019-06-26 11:06:55'),
(7, 2, 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:2:{i:23;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:942;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:23;s:4:\"name\";s:23:\"КОРПУС VINGA GAIA\";s:6:\"detail\";s:1353:\"<p><strong>Класс корпусу</strong>&nbsp; Геймерські</p>\r\n<p><strong>Типорозмір</strong>&nbsp; Minitower</p>\r\n<p><strong>Спосіб установки</strong>&nbsp; вертикальний</p>\r\n<p><strong>Підтримувані материнські плати&nbsp;</strong> Micro - ATX, Mini - ITX</p>\r\n<p><strong>Наявність блоку живлення</strong>&nbsp; без блоку живлення</p>\r\n<p><strong>Розташування блоку живлення</strong>&nbsp; нижнє</p>\r\n<p><strong>Зовнішні роз\'єми</strong>&nbsp; 1 x USB 3.1, 1 x USB 2.0, Audio</p>\r\n<p><strong>Особливості&nbsp; отвори</strong> для укладання кабелів, вікно на бічній панелі</p>\r\n<p><strong>Встановлення довгих відеокарт</strong>&nbsp; до 393 мм</p>\r\n<p><strong>Максимальна висота процесорного кулера</strong>&nbsp; 16 см</p>\r\n<p><strong>Матеріал корпусу</strong>&nbsp; метал, пластик</p>\r\n<p><strong>Виробник&nbsp;</strong> Vinga</p>\r\n<p><strong>Модель&nbsp;</strong> Gaia</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>\r\n<p>&nbsp;</p>\";s:5:\"price\";i:942;s:5:\"count\";i:15;s:5:\"photo\";s:16:\"U0300245_big.jpg\";s:11:\"category_id\";i:5;s:10:\"created_at\";s:19:\"2019-06-26 01:15:09\";s:10:\"updated_at\";s:19:\"2019-06-26 01:15:24\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:23;s:4:\"name\";s:23:\"КОРПУС VINGA GAIA\";s:6:\"detail\";s:1353:\"<p><strong>Класс корпусу</strong>&nbsp; Геймерські</p>\r\n<p><strong>Типорозмір</strong>&nbsp; Minitower</p>\r\n<p><strong>Спосіб установки</strong>&nbsp; вертикальний</p>\r\n<p><strong>Підтримувані материнські плати&nbsp;</strong> Micro - ATX, Mini - ITX</p>\r\n<p><strong>Наявність блоку живлення</strong>&nbsp; без блоку живлення</p>\r\n<p><strong>Розташування блоку живлення</strong>&nbsp; нижнє</p>\r\n<p><strong>Зовнішні роз\'єми</strong>&nbsp; 1 x USB 3.1, 1 x USB 2.0, Audio</p>\r\n<p><strong>Особливості&nbsp; отвори</strong> для укладання кабелів, вікно на бічній панелі</p>\r\n<p><strong>Встановлення довгих відеокарт</strong>&nbsp; до 393 мм</p>\r\n<p><strong>Максимальна висота процесорного кулера</strong>&nbsp; 16 см</p>\r\n<p><strong>Матеріал корпусу</strong>&nbsp; метал, пластик</p>\r\n<p><strong>Виробник&nbsp;</strong> Vinga</p>\r\n<p><strong>Модель&nbsp;</strong> Gaia</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>\r\n<p>&nbsp;</p>\";s:5:\"price\";i:942;s:5:\"count\";i:15;s:5:\"photo\";s:16:\"U0300245_big.jpg\";s:11:\"category_id\";i:5;s:10:\"created_at\";s:19:\"2019-06-26 01:15:09\";s:10:\"updated_at\";s:19:\"2019-06-26 01:15:24\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:14;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:449;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:14;s:4:\"name\";s:35:\"МИШКА LOGITECH M185 SWIFT GREY\";s:6:\"detail\";s:1245:\"<p><strong>Виробник&nbsp;</strong> Logitech</p>\r\n<p><strong>Модель&nbsp;</strong> M185 swift grey</p>\r\n<p><strong>Тип&nbsp;</strong> Бездротові</p>\r\n<p><strong>Призначення&nbsp;</strong> для ноутбука, для комп\'ютера</p>\r\n<p><strong>Тип сенсора</strong>&nbsp; оптичний</p>\r\n<p><strong>Роздільна здатність (max)&nbsp;</strong> 1000 dpi</p>\r\n<p><strong>Кількість кнопок</strong>&nbsp; 3</p>\r\n<p><strong>Кількість коліс прокрутки</strong>&nbsp; 1</p>\r\n<p><strong>Тип скрола&nbsp;</strong> 1 кнопка-скрол</p>\r\n<p><strong>Інтерфейс підключення</strong>&nbsp; радіо</p>\r\n<p><strong>Живлення&nbsp;</strong> 1 &times; AA</p>\r\n<p><strong>Додаткові функції&nbsp;</strong> симетрична (підходить під ліву руку)</p>\r\n<p><strong>Розміри&nbsp;</strong> 99x60x39 мм</p>\r\n<p><strong>Вага&nbsp;</strong> 80 г</p>\r\n<p><strong>Колір&nbsp;</strong> сірий, чорний</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 36</p>\";s:5:\"price\";i:449;s:5:\"count\";i:10;s:5:\"photo\";s:16:\"B0004852_big.jpg\";s:11:\"category_id\";i:9;s:10:\"created_at\";s:19:\"2019-06-26 00:22:58\";s:10:\"updated_at\";s:19:\"2019-06-26 00:23:19\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:14;s:4:\"name\";s:35:\"МИШКА LOGITECH M185 SWIFT GREY\";s:6:\"detail\";s:1245:\"<p><strong>Виробник&nbsp;</strong> Logitech</p>\r\n<p><strong>Модель&nbsp;</strong> M185 swift grey</p>\r\n<p><strong>Тип&nbsp;</strong> Бездротові</p>\r\n<p><strong>Призначення&nbsp;</strong> для ноутбука, для комп\'ютера</p>\r\n<p><strong>Тип сенсора</strong>&nbsp; оптичний</p>\r\n<p><strong>Роздільна здатність (max)&nbsp;</strong> 1000 dpi</p>\r\n<p><strong>Кількість кнопок</strong>&nbsp; 3</p>\r\n<p><strong>Кількість коліс прокрутки</strong>&nbsp; 1</p>\r\n<p><strong>Тип скрола&nbsp;</strong> 1 кнопка-скрол</p>\r\n<p><strong>Інтерфейс підключення</strong>&nbsp; радіо</p>\r\n<p><strong>Живлення&nbsp;</strong> 1 &times; AA</p>\r\n<p><strong>Додаткові функції&nbsp;</strong> симетрична (підходить під ліву руку)</p>\r\n<p><strong>Розміри&nbsp;</strong> 99x60x39 мм</p>\r\n<p><strong>Вага&nbsp;</strong> 80 г</p>\r\n<p><strong>Колір&nbsp;</strong> сірий, чорний</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 36</p>\";s:5:\"price\";i:449;s:5:\"count\";i:10;s:5:\"photo\";s:16:\"B0004852_big.jpg\";s:11:\"category_id\";i:9;s:10:\"created_at\";s:19:\"2019-06-26 00:22:58\";s:10:\"updated_at\";s:19:\"2019-06-26 00:23:19\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:2;s:10:\"totalPrice\";i:1391;}', 'Рівне, вулиця Тичини 20', 'vasya@gmail.com', 'Vasya Shumskyy', '380980757076', 'Відправлено', '2019-06-25 22:45:19', '2019-06-25 22:54:52'),
(8, 2, 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:1:{i:5;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:3385;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:5;s:4:\"name\";s:39:\"ПРОЦЕСОР INTEL CORE™ I3 9100F\";s:6:\"detail\";s:878:\"<p><strong>Виробник&nbsp;</strong> INTEL</p>\r\n<p><strong>Модель&nbsp;</strong> Core&trade; i3 9100F</p>\r\n<p><strong>Тип сокету</strong>&nbsp; s1151</p>\r\n<p><strong>Сімейство процесора</strong>&nbsp; Intel Core &trade; i3</p>\r\n<p><strong>Кількість ядер</strong>&nbsp; 4 ядра</p>\r\n<p><strong>Тактова частота ядра</strong>&nbsp; 3.6GHz</p>\r\n<p><strong>Кількість потоків</strong>&nbsp; 4 потоки</p>\r\n<p><strong>Графічне ядро</strong>&nbsp; немає</p>\r\n<p><strong>Технологія CMOS</strong>&nbsp; 14nm</p>\r\n<p><strong>Теплопакет</strong>&nbsp; 65W</p>\r\n<p><strong>Тип поставки</strong>&nbsp; BOX</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Гонконг</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 36</p>\";s:5:\"price\";i:3385;s:5:\"count\";i:3;s:5:\"photo\";s:16:\"U0356256_big.jpg\";s:11:\"category_id\";i:1;s:10:\"created_at\";s:19:\"2019-06-19 10:49:03\";s:10:\"updated_at\";s:19:\"2019-06-25 21:47:35\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:5;s:4:\"name\";s:39:\"ПРОЦЕСОР INTEL CORE™ I3 9100F\";s:6:\"detail\";s:878:\"<p><strong>Виробник&nbsp;</strong> INTEL</p>\r\n<p><strong>Модель&nbsp;</strong> Core&trade; i3 9100F</p>\r\n<p><strong>Тип сокету</strong>&nbsp; s1151</p>\r\n<p><strong>Сімейство процесора</strong>&nbsp; Intel Core &trade; i3</p>\r\n<p><strong>Кількість ядер</strong>&nbsp; 4 ядра</p>\r\n<p><strong>Тактова частота ядра</strong>&nbsp; 3.6GHz</p>\r\n<p><strong>Кількість потоків</strong>&nbsp; 4 потоки</p>\r\n<p><strong>Графічне ядро</strong>&nbsp; немає</p>\r\n<p><strong>Технологія CMOS</strong>&nbsp; 14nm</p>\r\n<p><strong>Теплопакет</strong>&nbsp; 65W</p>\r\n<p><strong>Тип поставки</strong>&nbsp; BOX</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Гонконг</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 36</p>\";s:5:\"price\";i:3385;s:5:\"count\";i:3;s:5:\"photo\";s:16:\"U0356256_big.jpg\";s:11:\"category_id\";i:1;s:10:\"created_at\";s:19:\"2019-06-19 10:49:03\";s:10:\"updated_at\";s:19:\"2019-06-25 21:47:35\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:1;s:10:\"totalPrice\";i:3385;}', 'Zdolbuniv, Rivnensla street', 'vasya@gmail.com', 'Vasya Shumskyy', '380980757076', 'Готується до відправлення', '2019-06-25 22:53:24', '2019-06-26 11:07:00'),
(9, 2, 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:3:{i:23;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:942;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:23;s:4:\"name\";s:23:\"КОРПУС VINGA GAIA\";s:6:\"detail\";s:1353:\"<p><strong>Класс корпусу</strong>&nbsp; Геймерські</p>\r\n<p><strong>Типорозмір</strong>&nbsp; Minitower</p>\r\n<p><strong>Спосіб установки</strong>&nbsp; вертикальний</p>\r\n<p><strong>Підтримувані материнські плати&nbsp;</strong> Micro - ATX, Mini - ITX</p>\r\n<p><strong>Наявність блоку живлення</strong>&nbsp; без блоку живлення</p>\r\n<p><strong>Розташування блоку живлення</strong>&nbsp; нижнє</p>\r\n<p><strong>Зовнішні роз\'єми</strong>&nbsp; 1 x USB 3.1, 1 x USB 2.0, Audio</p>\r\n<p><strong>Особливості&nbsp; отвори</strong> для укладання кабелів, вікно на бічній панелі</p>\r\n<p><strong>Встановлення довгих відеокарт</strong>&nbsp; до 393 мм</p>\r\n<p><strong>Максимальна висота процесорного кулера</strong>&nbsp; 16 см</p>\r\n<p><strong>Матеріал корпусу</strong>&nbsp; метал, пластик</p>\r\n<p><strong>Виробник&nbsp;</strong> Vinga</p>\r\n<p><strong>Модель&nbsp;</strong> Gaia</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>\r\n<p>&nbsp;</p>\";s:5:\"price\";i:942;s:5:\"count\";i:15;s:5:\"photo\";s:16:\"U0300245_big.jpg\";s:11:\"category_id\";i:5;s:10:\"created_at\";s:19:\"2019-06-26 01:15:09\";s:10:\"updated_at\";s:19:\"2019-06-26 01:15:24\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:23;s:4:\"name\";s:23:\"КОРПУС VINGA GAIA\";s:6:\"detail\";s:1353:\"<p><strong>Класс корпусу</strong>&nbsp; Геймерські</p>\r\n<p><strong>Типорозмір</strong>&nbsp; Minitower</p>\r\n<p><strong>Спосіб установки</strong>&nbsp; вертикальний</p>\r\n<p><strong>Підтримувані материнські плати&nbsp;</strong> Micro - ATX, Mini - ITX</p>\r\n<p><strong>Наявність блоку живлення</strong>&nbsp; без блоку живлення</p>\r\n<p><strong>Розташування блоку живлення</strong>&nbsp; нижнє</p>\r\n<p><strong>Зовнішні роз\'єми</strong>&nbsp; 1 x USB 3.1, 1 x USB 2.0, Audio</p>\r\n<p><strong>Особливості&nbsp; отвори</strong> для укладання кабелів, вікно на бічній панелі</p>\r\n<p><strong>Встановлення довгих відеокарт</strong>&nbsp; до 393 мм</p>\r\n<p><strong>Максимальна висота процесорного кулера</strong>&nbsp; 16 см</p>\r\n<p><strong>Матеріал корпусу</strong>&nbsp; метал, пластик</p>\r\n<p><strong>Виробник&nbsp;</strong> Vinga</p>\r\n<p><strong>Модель&nbsp;</strong> Gaia</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>\r\n<p>&nbsp;</p>\";s:5:\"price\";i:942;s:5:\"count\";i:15;s:5:\"photo\";s:16:\"U0300245_big.jpg\";s:11:\"category_id\";i:5;s:10:\"created_at\";s:19:\"2019-06-26 01:15:09\";s:10:\"updated_at\";s:19:\"2019-06-26 01:15:24\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:19;a:3:{s:3:\"qty\";i:2;s:5:\"price\";i:170;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:19;s:4:\"name\";s:50:\"USB ФЛЕШКА GOODRAM 16GB TWISTER BLUE USB 2.0\";s:6:\"detail\";s:1073:\"<p><strong>Виробник&nbsp;</strong> GOODRAM</p>\r\n<p><strong>Модель&nbsp; </strong>16GB Twister Blue USB 2.0</p>\r\n<p><strong>Тип&nbsp;</strong> Класичні</p>\r\n<p><strong>Об\'єм пам\'яті&nbsp;</strong> 16 Gb</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> USB 2.0</p>\r\n<p><strong>Максимальня швидкість читання</strong>&nbsp; 20 Мбайт/сек</p>\r\n<p><strong>Максимальна швидкість запису&nbsp;</strong> 5 Мбайт/сек</p>\r\n<p><strong>Матеріал корпусу</strong>&nbsp; пластик/метал</p>\r\n<p><strong>Фізичні розміри&nbsp;</strong> 57.1 x 19.3 x 10.7 мм</p>\r\n<p><strong>Вага&nbsp;</strong> 15 г</p>\r\n<p><strong>Колір&nbsp;</strong> синій</p>\r\n<p><strong>Додатково&nbsp;</strong> вушко для кріплення до брелока, поворотний ковпачок</p>\r\n<p><strong>Країна виробництва&nbsp;</strong> Тайвань</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 60</p>\";s:5:\"price\";i:85;s:5:\"count\";i:20;s:5:\"photo\";s:16:\"U0175513_big.jpg\";s:11:\"category_id\";i:9;s:10:\"created_at\";s:19:\"2019-06-26 00:50:36\";s:10:\"updated_at\";s:19:\"2019-06-26 00:52:12\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:19;s:4:\"name\";s:50:\"USB ФЛЕШКА GOODRAM 16GB TWISTER BLUE USB 2.0\";s:6:\"detail\";s:1073:\"<p><strong>Виробник&nbsp;</strong> GOODRAM</p>\r\n<p><strong>Модель&nbsp; </strong>16GB Twister Blue USB 2.0</p>\r\n<p><strong>Тип&nbsp;</strong> Класичні</p>\r\n<p><strong>Об\'єм пам\'яті&nbsp;</strong> 16 Gb</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> USB 2.0</p>\r\n<p><strong>Максимальня швидкість читання</strong>&nbsp; 20 Мбайт/сек</p>\r\n<p><strong>Максимальна швидкість запису&nbsp;</strong> 5 Мбайт/сек</p>\r\n<p><strong>Матеріал корпусу</strong>&nbsp; пластик/метал</p>\r\n<p><strong>Фізичні розміри&nbsp;</strong> 57.1 x 19.3 x 10.7 мм</p>\r\n<p><strong>Вага&nbsp;</strong> 15 г</p>\r\n<p><strong>Колір&nbsp;</strong> синій</p>\r\n<p><strong>Додатково&nbsp;</strong> вушко для кріплення до брелока, поворотний ковпачок</p>\r\n<p><strong>Країна виробництва&nbsp;</strong> Тайвань</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 60</p>\";s:5:\"price\";i:85;s:5:\"count\";i:20;s:5:\"photo\";s:16:\"U0175513_big.jpg\";s:11:\"category_id\";i:9;s:10:\"created_at\";s:19:\"2019-06-26 00:50:36\";s:10:\"updated_at\";s:19:\"2019-06-26 00:52:12\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:18;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:894;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:18;s:4:\"name\";s:43:\"ВЕБ-КАМЕРА LOGITECH WEBCAM C270 HD\";s:6:\"detail\";s:1181:\"<p><strong>Виробник&nbsp;</strong> Logitech</p>\r\n<p><strong>Модель&nbsp;</strong> Webcam C270 HD</p>\r\n<p><strong>Кількість пікселів</strong>&nbsp; 3 МП</p>\r\n<p><strong>Стандарт роздільної здатності відео</strong>&nbsp; HD</p>\r\n<p><strong>Максимальна роздільна здатність відео</strong>&nbsp; 1280 x 720 пікселів</p>\r\n<p><strong>Максимальна частота кадрів</strong>&nbsp; до 30 кадрів/с</p>\r\n<p><strong>Фокусування&nbsp;</strong> ручне</p>\r\n<p><strong>Кріплення&nbsp;</strong> настільний, прищіпка</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> USB 2.0</p>\r\n<p><strong>Системні вимоги</strong>&nbsp; Windows XP, Windows Vista, Windows 7</p>\r\n<p><strong>Довжина кабеля&nbsp;</strong> 1.5 м</p>\r\n<p><strong>Мікрофон&nbsp;</strong> вбудований мікрофон</p>\r\n<p><strong>Колір&nbsp;</strong> чорний</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 24</p>\";s:5:\"price\";i:894;s:5:\"count\";i:7;s:5:\"photo\";s:16:\"U0162513_big.jpg\";s:11:\"category_id\";i:9;s:10:\"created_at\";s:19:\"2019-06-26 00:41:42\";s:10:\"updated_at\";s:19:\"2019-06-26 00:41:42\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:18;s:4:\"name\";s:43:\"ВЕБ-КАМЕРА LOGITECH WEBCAM C270 HD\";s:6:\"detail\";s:1181:\"<p><strong>Виробник&nbsp;</strong> Logitech</p>\r\n<p><strong>Модель&nbsp;</strong> Webcam C270 HD</p>\r\n<p><strong>Кількість пікселів</strong>&nbsp; 3 МП</p>\r\n<p><strong>Стандарт роздільної здатності відео</strong>&nbsp; HD</p>\r\n<p><strong>Максимальна роздільна здатність відео</strong>&nbsp; 1280 x 720 пікселів</p>\r\n<p><strong>Максимальна частота кадрів</strong>&nbsp; до 30 кадрів/с</p>\r\n<p><strong>Фокусування&nbsp;</strong> ручне</p>\r\n<p><strong>Кріплення&nbsp;</strong> настільний, прищіпка</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> USB 2.0</p>\r\n<p><strong>Системні вимоги</strong>&nbsp; Windows XP, Windows Vista, Windows 7</p>\r\n<p><strong>Довжина кабеля&nbsp;</strong> 1.5 м</p>\r\n<p><strong>Мікрофон&nbsp;</strong> вбудований мікрофон</p>\r\n<p><strong>Колір&nbsp;</strong> чорний</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 24</p>\";s:5:\"price\";i:894;s:5:\"count\";i:7;s:5:\"photo\";s:16:\"U0162513_big.jpg\";s:11:\"category_id\";i:9;s:10:\"created_at\";s:19:\"2019-06-26 00:41:42\";s:10:\"updated_at\";s:19:\"2019-06-26 00:41:42\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:4;s:10:\"totalPrice\";i:2006;}', 'Рівне, вулиця Соборна 20', 'vasya@gmail.com', 'Vasya Shumskyy', '380980757076', 'Відправлено', '2019-06-26 11:05:56', '2019-06-26 11:21:55'),
(10, 2, 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:3:{i:22;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:1558;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:22;s:4:\"name\";s:42:\"ЖОРСТКИЙ ДИСК 3.5\" 3TB SEAGATE\";s:6:\"detail\";s:596:\"<p><strong>Виробник&nbsp;</strong> Seagate</p>\r\n<p><strong>Модель&nbsp;</strong> 3.5\" 3TB</p>\r\n<p><strong>Об&rsquo;єм&nbsp;</strong> 3 TB</p>\r\n<p><strong>Швидкість обертання шпинделя</strong>&nbsp; 5400 об/хв</p>\r\n<p><strong>Розмір буферу&nbsp;</strong> 256 MB</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> SATA III</p>\r\n<p><strong>Інше&nbsp;</strong> Refurbished(вІдновлений)</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>\";s:5:\"price\";i:1558;s:5:\"count\";i:10;s:5:\"photo\";s:16:\"U0354232_big.jpg\";s:11:\"category_id\";i:4;s:10:\"created_at\";s:19:\"2019-06-26 01:09:53\";s:10:\"updated_at\";s:19:\"2019-06-26 01:10:21\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:22;s:4:\"name\";s:42:\"ЖОРСТКИЙ ДИСК 3.5\" 3TB SEAGATE\";s:6:\"detail\";s:596:\"<p><strong>Виробник&nbsp;</strong> Seagate</p>\r\n<p><strong>Модель&nbsp;</strong> 3.5\" 3TB</p>\r\n<p><strong>Об&rsquo;єм&nbsp;</strong> 3 TB</p>\r\n<p><strong>Швидкість обертання шпинделя</strong>&nbsp; 5400 об/хв</p>\r\n<p><strong>Розмір буферу&nbsp;</strong> 256 MB</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> SATA III</p>\r\n<p><strong>Інше&nbsp;</strong> Refurbished(вІдновлений)</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>\";s:5:\"price\";i:1558;s:5:\"count\";i:10;s:5:\"photo\";s:16:\"U0354232_big.jpg\";s:11:\"category_id\";i:4;s:10:\"created_at\";s:19:\"2019-06-26 01:09:53\";s:10:\"updated_at\";s:19:\"2019-06-26 01:10:21\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:18;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:894;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:18;s:4:\"name\";s:43:\"ВЕБ-КАМЕРА LOGITECH WEBCAM C270 HD\";s:6:\"detail\";s:1181:\"<p><strong>Виробник&nbsp;</strong> Logitech</p>\r\n<p><strong>Модель&nbsp;</strong> Webcam C270 HD</p>\r\n<p><strong>Кількість пікселів</strong>&nbsp; 3 МП</p>\r\n<p><strong>Стандарт роздільної здатності відео</strong>&nbsp; HD</p>\r\n<p><strong>Максимальна роздільна здатність відео</strong>&nbsp; 1280 x 720 пікселів</p>\r\n<p><strong>Максимальна частота кадрів</strong>&nbsp; до 30 кадрів/с</p>\r\n<p><strong>Фокусування&nbsp;</strong> ручне</p>\r\n<p><strong>Кріплення&nbsp;</strong> настільний, прищіпка</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> USB 2.0</p>\r\n<p><strong>Системні вимоги</strong>&nbsp; Windows XP, Windows Vista, Windows 7</p>\r\n<p><strong>Довжина кабеля&nbsp;</strong> 1.5 м</p>\r\n<p><strong>Мікрофон&nbsp;</strong> вбудований мікрофон</p>\r\n<p><strong>Колір&nbsp;</strong> чорний</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 24</p>\";s:5:\"price\";i:894;s:5:\"count\";i:7;s:5:\"photo\";s:16:\"U0162513_big.jpg\";s:11:\"category_id\";i:9;s:10:\"created_at\";s:19:\"2019-06-26 00:41:42\";s:10:\"updated_at\";s:19:\"2019-06-26 00:41:42\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:18;s:4:\"name\";s:43:\"ВЕБ-КАМЕРА LOGITECH WEBCAM C270 HD\";s:6:\"detail\";s:1181:\"<p><strong>Виробник&nbsp;</strong> Logitech</p>\r\n<p><strong>Модель&nbsp;</strong> Webcam C270 HD</p>\r\n<p><strong>Кількість пікселів</strong>&nbsp; 3 МП</p>\r\n<p><strong>Стандарт роздільної здатності відео</strong>&nbsp; HD</p>\r\n<p><strong>Максимальна роздільна здатність відео</strong>&nbsp; 1280 x 720 пікселів</p>\r\n<p><strong>Максимальна частота кадрів</strong>&nbsp; до 30 кадрів/с</p>\r\n<p><strong>Фокусування&nbsp;</strong> ручне</p>\r\n<p><strong>Кріплення&nbsp;</strong> настільний, прищіпка</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> USB 2.0</p>\r\n<p><strong>Системні вимоги</strong>&nbsp; Windows XP, Windows Vista, Windows 7</p>\r\n<p><strong>Довжина кабеля&nbsp;</strong> 1.5 м</p>\r\n<p><strong>Мікрофон&nbsp;</strong> вбудований мікрофон</p>\r\n<p><strong>Колір&nbsp;</strong> чорний</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 24</p>\";s:5:\"price\";i:894;s:5:\"count\";i:7;s:5:\"photo\";s:16:\"U0162513_big.jpg\";s:11:\"category_id\";i:9;s:10:\"created_at\";s:19:\"2019-06-26 00:41:42\";s:10:\"updated_at\";s:19:\"2019-06-26 00:41:42\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:23;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:942;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:23;s:4:\"name\";s:23:\"КОРПУС VINGA GAIA\";s:6:\"detail\";s:1353:\"<p><strong>Класс корпусу</strong>&nbsp; Геймерські</p>\r\n<p><strong>Типорозмір</strong>&nbsp; Minitower</p>\r\n<p><strong>Спосіб установки</strong>&nbsp; вертикальний</p>\r\n<p><strong>Підтримувані материнські плати&nbsp;</strong> Micro - ATX, Mini - ITX</p>\r\n<p><strong>Наявність блоку живлення</strong>&nbsp; без блоку живлення</p>\r\n<p><strong>Розташування блоку живлення</strong>&nbsp; нижнє</p>\r\n<p><strong>Зовнішні роз\'єми</strong>&nbsp; 1 x USB 3.1, 1 x USB 2.0, Audio</p>\r\n<p><strong>Особливості&nbsp; отвори</strong> для укладання кабелів, вікно на бічній панелі</p>\r\n<p><strong>Встановлення довгих відеокарт</strong>&nbsp; до 393 мм</p>\r\n<p><strong>Максимальна висота процесорного кулера</strong>&nbsp; 16 см</p>\r\n<p><strong>Матеріал корпусу</strong>&nbsp; метал, пластик</p>\r\n<p><strong>Виробник&nbsp;</strong> Vinga</p>\r\n<p><strong>Модель&nbsp;</strong> Gaia</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>\r\n<p>&nbsp;</p>\";s:5:\"price\";i:942;s:5:\"count\";i:15;s:5:\"photo\";s:16:\"U0300245_big.jpg\";s:11:\"category_id\";i:5;s:10:\"created_at\";s:19:\"2019-06-26 01:15:09\";s:10:\"updated_at\";s:19:\"2019-06-26 01:15:24\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:23;s:4:\"name\";s:23:\"КОРПУС VINGA GAIA\";s:6:\"detail\";s:1353:\"<p><strong>Класс корпусу</strong>&nbsp; Геймерські</p>\r\n<p><strong>Типорозмір</strong>&nbsp; Minitower</p>\r\n<p><strong>Спосіб установки</strong>&nbsp; вертикальний</p>\r\n<p><strong>Підтримувані материнські плати&nbsp;</strong> Micro - ATX, Mini - ITX</p>\r\n<p><strong>Наявність блоку живлення</strong>&nbsp; без блоку живлення</p>\r\n<p><strong>Розташування блоку живлення</strong>&nbsp; нижнє</p>\r\n<p><strong>Зовнішні роз\'єми</strong>&nbsp; 1 x USB 3.1, 1 x USB 2.0, Audio</p>\r\n<p><strong>Особливості&nbsp; отвори</strong> для укладання кабелів, вікно на бічній панелі</p>\r\n<p><strong>Встановлення довгих відеокарт</strong>&nbsp; до 393 мм</p>\r\n<p><strong>Максимальна висота процесорного кулера</strong>&nbsp; 16 см</p>\r\n<p><strong>Матеріал корпусу</strong>&nbsp; метал, пластик</p>\r\n<p><strong>Виробник&nbsp;</strong> Vinga</p>\r\n<p><strong>Модель&nbsp;</strong> Gaia</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>\r\n<p>&nbsp;</p>\";s:5:\"price\";i:942;s:5:\"count\";i:15;s:5:\"photo\";s:16:\"U0300245_big.jpg\";s:11:\"category_id\";i:5;s:10:\"created_at\";s:19:\"2019-06-26 01:15:09\";s:10:\"updated_at\";s:19:\"2019-06-26 01:15:24\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:3;s:10:\"totalPrice\";i:3394;}', 'Рівне, вулиця Соборна 20', 'vasya@gmail.com', 'Vasya Shumskyy', '380980757076', 'Готується до відправлення', '2019-06-26 11:21:04', '2019-06-26 11:21:51'),
(11, 1, 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:1:{i:23;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:942;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:23;s:4:\"name\";s:23:\"КОРПУС VINGA GAIA\";s:6:\"detail\";s:1353:\"<p><strong>Класс корпусу</strong>&nbsp; Геймерські</p>\r\n<p><strong>Типорозмір</strong>&nbsp; Minitower</p>\r\n<p><strong>Спосіб установки</strong>&nbsp; вертикальний</p>\r\n<p><strong>Підтримувані материнські плати&nbsp;</strong> Micro - ATX, Mini - ITX</p>\r\n<p><strong>Наявність блоку живлення</strong>&nbsp; без блоку живлення</p>\r\n<p><strong>Розташування блоку живлення</strong>&nbsp; нижнє</p>\r\n<p><strong>Зовнішні роз\'єми</strong>&nbsp; 1 x USB 3.1, 1 x USB 2.0, Audio</p>\r\n<p><strong>Особливості&nbsp; отвори</strong> для укладання кабелів, вікно на бічній панелі</p>\r\n<p><strong>Встановлення довгих відеокарт</strong>&nbsp; до 393 мм</p>\r\n<p><strong>Максимальна висота процесорного кулера</strong>&nbsp; 16 см</p>\r\n<p><strong>Матеріал корпусу</strong>&nbsp; метал, пластик</p>\r\n<p><strong>Виробник&nbsp;</strong> Vinga</p>\r\n<p><strong>Модель&nbsp;</strong> Gaia</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>\r\n<p>&nbsp;</p>\";s:5:\"price\";i:942;s:5:\"count\";i:15;s:5:\"photo\";s:16:\"U0300245_big.jpg\";s:11:\"category_id\";i:5;s:10:\"created_at\";s:19:\"2019-06-26 01:15:09\";s:10:\"updated_at\";s:19:\"2019-06-26 01:15:24\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:23;s:4:\"name\";s:23:\"КОРПУС VINGA GAIA\";s:6:\"detail\";s:1353:\"<p><strong>Класс корпусу</strong>&nbsp; Геймерські</p>\r\n<p><strong>Типорозмір</strong>&nbsp; Minitower</p>\r\n<p><strong>Спосіб установки</strong>&nbsp; вертикальний</p>\r\n<p><strong>Підтримувані материнські плати&nbsp;</strong> Micro - ATX, Mini - ITX</p>\r\n<p><strong>Наявність блоку живлення</strong>&nbsp; без блоку живлення</p>\r\n<p><strong>Розташування блоку живлення</strong>&nbsp; нижнє</p>\r\n<p><strong>Зовнішні роз\'єми</strong>&nbsp; 1 x USB 3.1, 1 x USB 2.0, Audio</p>\r\n<p><strong>Особливості&nbsp; отвори</strong> для укладання кабелів, вікно на бічній панелі</p>\r\n<p><strong>Встановлення довгих відеокарт</strong>&nbsp; до 393 мм</p>\r\n<p><strong>Максимальна висота процесорного кулера</strong>&nbsp; 16 см</p>\r\n<p><strong>Матеріал корпусу</strong>&nbsp; метал, пластик</p>\r\n<p><strong>Виробник&nbsp;</strong> Vinga</p>\r\n<p><strong>Модель&nbsp;</strong> Gaia</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>\r\n<p>&nbsp;</p>\";s:5:\"price\";i:942;s:5:\"count\";i:15;s:5:\"photo\";s:16:\"U0300245_big.jpg\";s:11:\"category_id\";i:5;s:10:\"created_at\";s:19:\"2019-06-26 01:15:09\";s:10:\"updated_at\";s:19:\"2019-06-26 01:15:24\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:1;s:10:\"totalPrice\";i:942;}', 'ВУЛ. ТИЧИНИ 20-А-2', 'linashumska@gmail.com', 'ВУЛ. ТИЧИНИ 20-А-2 ШУМСЬКА', '0680410327', 'Замовлення прийнято', '2019-11-20 17:37:37', '2019-11-20 17:37:37');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2019-06-08 17:21:11', '2019-06-08 17:21:11'),
(2, 'role-create', 'web', '2019-06-08 17:21:11', '2019-06-08 17:21:11'),
(3, 'role-edit', 'web', '2019-06-08 17:21:11', '2019-06-08 17:21:11'),
(4, 'role-delete', 'web', '2019-06-08 17:21:11', '2019-06-08 17:21:11'),
(5, 'product-list', 'web', '2019-06-08 17:21:11', '2019-06-08 17:21:11'),
(6, 'product-create', 'web', '2019-06-08 17:21:11', '2019-06-08 17:21:11'),
(7, 'product-edit', 'web', '2019-06-08 17:21:11', '2019-06-08 17:21:11'),
(8, 'product-delete', 'web', '2019-06-08 17:21:11', '2019-06-08 17:21:11'),
(9, 'user', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `detail`, `price`, `count`, `photo`, `category_id`, `created_at`, `updated_at`) VALUES
(26, 'КОРПУС VINGA GAIA', 'a:15:{s:23:\"Клас корпусу\";s:20:\"Геймерські\";s:20:\"Типорозмір\";s:9:\"Minitower\";s:31:\"Спосіб установки\";s:24:\"вертикальний\";s:58:\"Підтримувані материнські плати\";s:23:\"Micro - ATX, Mini - ITX\";s:46:\"Наявність блоку живлення\";s:34:\"без блоку живлення\";s:52:\"Розташування блоку живлення\";s:10:\"нижнє\";s:30:\"Зовнішні роз\'єми\";s:31:\"1 x USB 3.1, 1 x USB 2.0, Audio\";s:35:\"Особливості отвори\";s:83:\"для укладання кабелів, вікно на бічній панелі\";s:56:\"Встановлення довгих відеокарт\";s:13:\"до 393 мм\";s:73:\"Максимальна висота процесорного кулера\";s:7:\"16 см\";s:31:\"Матеріал корпусу\";s:26:\"метал, пластик\";s:16:\"Виробник\";s:5:\"Vinga\";s:12:\"Модель\";s:4:\"Gaia\";s:35:\"Країна виробництва\";s:10:\"Китай\";s:24:\"Гарантія, міс\";s:2:\"12\";}', 943, 7, 'U0300245_big.jpg', 5, '2019-12-16 22:46:16', '2019-12-16 22:46:16'),
(28, 'ЖОРСТКИЙ ДИСК 3.5\" 3TB SEAGATE', 'a:9:{s:16:\"Виробник\";s:7:\"Seagate\";s:12:\"Модель\";s:8:\"3.5\" 3TB\";s:9:\"Об\'єм\";s:4:\"3 TB\";s:54:\"Швидкість обертання шпинделя\";s:14:\"5400 об/хв\";s:25:\"Розмір буферу\";s:6:\"256 MB\";s:18:\"Інтерфейс\";s:8:\"SATA III\";s:8:\"Інше\";s:36:\"Refurbished (відновлений)\";s:35:\"Країна виробництва\";s:10:\"Китай\";s:24:\"Гарантія, міс\";s:2:\"12\";}', 1558, 10, 'U0354232_big.jpg', 4, '2019-12-17 09:51:53', '2019-12-17 09:51:53'),
(29, 'ВІДЕОКАРТА ASUS GEFORCE GTX1060 6144MB DUAL OC', 'a:25:{s:16:\"Виробник\";s:4:\"ASUS\";s:12:\"Модель\";s:30:\"GeForce GTX1060 6144Mb DUAL OC\";s:33:\"Сімейство графіки\";s:6:\"NVIDIA\";s:25:\"Графічний чіп\";s:16:\"GeForce GTX 1060\";s:18:\"Інтерфейс\";s:15:\"PCI-Express x16\";s:44:\"Об\'єм вбудованої пам\'яті\";s:6:\"6 ГБ\";s:20:\"Тип пам\'яті\";s:6:\"GDDR 5\";s:45:\"Розрядність шини пам\'яті\";s:7:\"192 Bit\";s:30:\"Частота ядра (Base)\";s:8:\"1594 MHz\";s:31:\"Частота ядра (Boost)\";s:8:\"1809 MHz\";s:28:\"Частота пам\'яті\";s:8:\"8008 MHz\";s:20:\"Техпроцес \";s:7:\"16 нм\";s:50:\"Максимальне число дисплеїв\";s:1:\"4\";s:60:\"Максимальна роздільна здатність\";s:11:\"7680 x 4320\";s:28:\"Сумісність з HDCP\";s:6:\"так\";s:13:\"Роз\'єми\";s:31:\"2 x DisplayPort, DVI, 2 х HDMI\";s:44:\"Тип системи охолодження\";s:16:\"активний\";s:29:\"Вид охолодження\";s:28:\"кулер, радіатор\";s:43:\"Кількість вентиляторів\";s:6:\"2 шт\";s:96:\"Мінімальна рекомендована потужність блоку живлення\";s:8:\"500 Вт\";s:20:\"Версія DirectX\";s:2:\"12\";s:19:\"Версія OpenGL\";s:3:\"4.5\";s:21:\"Розміри (мм)\";s:19:\"242 x 130 x 43 мм\";s:35:\"Країна виробництва\";s:10:\"Китай\";s:24:\"Гарантія, міс\";s:2:\"36\";}', 6999, 7, 'U0189920_big.jpg', 2, '2019-12-17 10:06:35', '2019-12-17 10:06:35'),
(30, 'ВІДЕОКАРТА ASUS RADEON RX 580 8192MB ROG STRIX', 'a:22:{s:16:\"Виробник\";s:4:\"ASUS\";s:12:\"Модель\";s:41:\"Radeon RX 580 8192Mb ROG STRIX GAMING TOP\";s:33:\"Сімейство графіки\";s:3:\"AMD\";s:25:\"Графічний чіп\";s:13:\"Radeon RX 580\";s:18:\"Інтерфейс\";s:15:\"PCI-Express x16\";s:44:\"Об\'єм вбудованої пам\'яті\";s:6:\"8 ГБ\";s:20:\"Тип пам\'яті\";s:6:\"GDDR 5\";s:45:\"Розрядність шини пам\'яті\";s:7:\"256 Bit\";s:30:\"Частота ядра (Base)\";s:8:\"1431 MHz\";s:28:\"Частота пам\'яті\";s:8:\"8000 MHz\";s:60:\"Максимальна роздільна здатність\";s:11:\"7680 x 4320\";s:20:\"Сумісність\";s:15:\"з HDCP, так\";s:13:\"Роз\'єми\";s:31:\"DVI, 2 х HDMI, 2 x DisplayPort\";s:44:\"Тип системи охолодження\";s:16:\"активний\";s:29:\"Вид охолодження\";s:28:\"радіатор, кулер\";s:43:\"Кількість вентиляторів\";s:6:\"3 шт\";s:53:\"Роз\'єми додаткового живлення\";s:5:\"8 pin\";s:96:\"Мінімальна рекомендована потужність блоку живлення\";s:8:\"500 Вт\";s:20:\"Версія DirectX\";s:2:\"12\";s:19:\"Версія OpenGL\";s:3:\"4.5\";s:35:\"Країна виробництва\";s:10:\"Китай\";s:24:\"Гарантія, міс\";s:2:\"36\";}', 7099, 10, 'U0237943_big.jpg', 2, '2019-12-22 18:38:47', '2019-12-22 18:42:44'),
(31, 'USB ФЛЕШКА GOODRAM 16GB TWISTER BLUE USB 2.0', 'a:14:{s:16:\"Виробник\";s:7:\"GOODRAM\";s:12:\"Модель\";s:25:\"16GB Twister Blue USB 2.0\";s:6:\"Тип\";s:16:\"Класичні\";s:23:\"Об\'єм пам\'яті\";s:5:\"16 Gb\";s:18:\"Інтерфейс\";s:7:\"USB 2.0\";s:56:\"Максимальна швидкість читання\";s:20:\"20 Мбайт/сек\";s:54:\"Максимальна швидкість запису\";s:19:\"5 Мбайт/сек\";s:31:\"Матеріал корпусу\";s:25:\"пластик/метал\";s:29:\"Фізичні розміри\";s:23:\"57.1 x 19.3 x 10.7 мм\";s:8:\"Вага\";s:5:\"15 г\";s:10:\"Колір\";s:10:\"синій\";s:18:\"Додатково\";s:95:\"вушко для кріплення до брелока, поворотний ковпачок\";s:35:\"Країна виробництва\";s:14:\"Тайвань\";s:24:\"Гарантія, міс\";s:2:\"60\";}', 85, 20, 'U0175513_big.jpg', 9, '2019-12-22 18:49:12', '2019-12-22 18:49:12'),
(32, 'ВЕБ-КАМЕРА LOGITECH WEBCAM C270 HD', 'a:15:{s:16:\"Виробник\";s:8:\"Logitech\";s:12:\"Модель\";s:14:\"Webcam C270 HD\";s:35:\"Кількість пікселів\";s:6:\"3 МП\";s:67:\"Стандарт роздільної здатності відео\";s:2:\"HD\";s:71:\"Максимальна роздільна здатність відео\";s:27:\"1280 x 720 пікселів\";s:50:\"Максимальна частота кадрів\";s:23:\"до 30 кадрів/с\";s:22:\"Фокусування\";s:10:\"ручне\";s:18:\"Кріплення\";s:38:\"настільний, прищіпка\";s:18:\"Інтерфейс\";s:7:\"USB 2.0\";s:29:\"Системні вимоги\";s:36:\"Windows XP, Windows Vista, Windows 7\";s:27:\"Довжина кабеля\";s:6:\"1.5 м\";s:16:\"Мікрофон\";s:37:\"вбудований мікрофон\";s:10:\"Колір\";s:12:\"чорний\";s:35:\"Країна виробництва\";s:10:\"Китай\";s:24:\"Гарантія, міс\";s:2:\"24\";}', 894, 7, 'U0162513_big.jpg', 9, '2019-12-22 18:54:51', '2019-12-22 18:54:51'),
(33, 'КАБЕЛЬ ЖИВЛЕННЯ VIDEO POWER 6PIN TO 2MOLEX ATCOM', 'a:8:{s:16:\"Виробник\";s:5:\"Atcom\";s:12:\"Модель\";s:26:\"Video power 6pin to 2molex\";s:6:\"Тип\";s:12:\"кабель\";s:13:\"Роз\'єм 1\";s:5:\"6 pin\";s:13:\"Роз\'єм 2\";s:17:\"2 х молекс\";s:14:\"Довжина\";s:7:\"0.15 м\";s:35:\"Країна виробництва\";s:10:\"Китай\";s:24:\"Гарантія, міс\";s:1:\"0\";}', 27, 30, 'U0247870_big.jpg', 9, '2019-12-22 19:00:24', '2019-12-22 19:00:24'),
(34, 'КУЛЕР ДО КОРПУСУ VINGA 12025', 'a:14:{s:16:\"Виробник\";s:5:\"Vinga\";s:12:\"Модель\";s:5:\"12025\";s:43:\"Кількість вентиляторів\";s:1:\"1\";s:39:\"Діаметр вентиляторів\";s:8:\"120 мм\";s:85:\"Максимальна швидкість обертання вентиляторів\";s:7:\"1200RPM\";s:16:\"Матеріал\";s:14:\"пластик\";s:21:\"Рівень шуму\";s:7:\"23.5 dB\";s:43:\"Тип роз\'єму підключення\";s:12:\"4pin (Molex)\";s:56:\"Напруга живлення вентиляторів\";s:5:\"12 В\";s:58:\"Струм споживання вентиляторами\";s:6:\"0.2 А\";s:57:\"Енергоспоживання вентиляторів\";s:8:\"2.4 Вт\";s:12:\"Розмір\";s:21:\"120 х 120 х 25 мм\";s:35:\"Країна виробництва\";s:10:\"Китай\";s:24:\"Гарантія, міс\";s:2:\"12\";}', 100, 10, 'U0186738_big.jpg', 9, '2019-12-22 19:07:37', '2019-12-22 19:07:37'),
(35, 'КЛАВІАТУРА LOGITECH K400 PLUS DARK RU', 'a:14:{s:16:\"Виробник\";s:8:\"Logitech\";s:12:\"Модель\";s:17:\"K400 Plus dark RU\";s:6:\"Тип\";s:48:\"мультимедійна, бездротова\";s:22:\"Призначення\";s:65:\"для планшета, для телевізора, для ПК\";s:22:\"Конструкція\";s:18:\"мембранна\";s:29:\"Тип підключення\";s:20:\"бездротова\";s:41:\"Інтерфейс підключення\";s:10:\"радіо\";s:33:\"Формат клавіатури\";s:18:\"компактна\";s:22:\"Особливості\";s:83:\"вбудована сенсорна панель, безшумне введення\";s:14:\"Розміри\";s:27:\"354.3 х 139.9 х 23.5 мм\";s:8:\"Вага\";s:6:\"380 г\";s:10:\"Колір\";s:10:\"чорна\";s:35:\"Країна виробництва\";s:10:\"Китай\";s:24:\"Гарантія, міс\";s:2:\"24\";}', 859, 10, 'U0149527_big.jpg', 9, '2019-12-22 19:14:31', '2019-12-22 19:14:31'),
(36, 'МИШКА LOGITECH M185 SWIFT GREY', 'a:16:{s:16:\"Виробник\";s:8:\"Logitech\";s:12:\"Модель\";s:15:\"M185 swift grey\";s:6:\"Тип\";s:20:\"Бездротові\";s:22:\"Призначення\";s:51:\"для ноутбука, для комп\'ютера\";s:21:\"Тип сенсора\";s:16:\"оптичний\";s:43:\"Роздільна здатність (max)\";s:8:\"1000 dpi\";s:31:\"Кількість кнопок\";s:1:\"3\";s:48:\"Кількість коліс прокрутки\";s:1:\"1\";s:19:\"Тип скрола\";s:25:\"1 кнопка-скрол\";s:41:\"Інтерфейс підключення\";s:10:\"радіо\";s:33:\"Додаткові функції\";s:66:\"симетрична (підходить під ліву руку)\";s:14:\"Розміри\";s:13:\"99x60x39 мм\";s:8:\"Вага\";s:5:\"80 г\";s:10:\"Колір\";s:24:\"сірий, чорний\";s:35:\"Країна виробництва\";s:10:\"Китай\";s:24:\"Гарантія, міс\";s:2:\"36\";}', 449, 10, 'B0004852_big.jpg', 9, '2019-12-22 19:21:11', '2019-12-22 19:21:11'),
(37, 'КУЛЕР ДО ПРОЦЕСОРА VINGA CL3007R', 'a:20:{s:16:\"Виробник\";s:5:\"Vinga\";s:12:\"Модель\";s:7:\"CL3007R\";s:27:\"Для процесорів\";s:10:\"INTEL, AMD\";s:19:\"Під сокети\";s:54:\"AM4, 1151, 775, 1155, 1150, 1156, AM2, AM2+, AM3, AM3+\";s:42:\"Тип системи охолодженн\";s:27:\"активна (кулер)\";s:35:\"Матеріал радіатора\";s:16:\"алюміній\";s:43:\"Кількість вентиляторів\";s:1:\"1\";s:39:\"Діаметр вентиляторів\";s:8:\"120 мм\";s:85:\"Максимальна швидкість обертання вентиляторів\";s:14:\"1500 об/хв\";s:37:\"Система підшипників\";s:49:\"гідродинамічний підшипник\";s:58:\"Управління швидкістю обертання\";s:6:\"так\";s:31:\"Повітряний потік\";s:6:\"65 CFM\";s:21:\"Рівень шуму\";s:7:\"26.5 dB\";s:30:\"Роз\'єми живлення\";s:5:\"4-pin\";s:18:\"Підсвітка\";s:14:\"червона\";s:72:\"Максимальна потужність, що розсіюється\";s:8:\"160 Вт\";s:33:\"Розмір (загальний)\";s:19:\"125 x 85 x 155 мм\";s:18:\"Додатково\";s:27:\"5 теплових труб\";s:35:\"Країна виробництва\";s:10:\"Китай\";s:24:\"Гарантія, міс\";s:2:\"12\";}', 808, 8, 'U0301226_big.jpg', 9, '2019-12-22 19:27:31', '2019-12-22 19:27:31'),
(38, 'ТЕРМОПАСТА VINGA TG10', 'a:9:{s:16:\"Виробник\";s:5:\"Vinga\";s:12:\"Модель\";s:4:\"TG10\";s:20:\"Сумісність\";s:27:\"для процесорів\";s:32:\"Теплопровідність\";s:9:\"4.63 W/mK\";s:35:\"Робоча температура\";s:15:\"-30 до 300 С\";s:8:\"Вага\";s:3:\"1.5\";s:23:\"Тип упаковки\";s:10:\"шприц\";s:35:\"Країна виробництва\";s:10:\"Китай\";s:24:\"Гарантія, міс\";s:1:\"0\";}', 67, 20, 'U0205612_big.jpg', 9, '2019-12-22 20:48:11', '2019-12-22 20:48:11'),
(39, 'БЛОК ЖИВЛЕННЯ CHIEFTEC 600W', 'a:19:{s:16:\"Виробник\";s:8:\"CHIEFTEC\";s:12:\"Модель\";s:4:\"600W\";s:11:\"Тип БЖ\";s:28:\"для комп\'ютерів\";s:21:\"Стандарт БЖ\";s:12:\"ATX 12V v2.3\";s:20:\"Потужність\";s:7:\"600Вт\";s:54:\"Модульне підключення кабелів\";s:11:\"не має\";s:15:\"Модуль PF\";s:17:\"Cактивний\";s:56:\"Підключення материнскої плати\";s:8:\"20+4 pin\";s:41:\"Підключення процесора\";s:7:\"4+4 pin\";s:93:\"Кіл-ть роз\'ємів додаткового живлення для відеокарт\";s:1:\"2\";s:43:\"Підключення відеокарти\";s:9:\"2x6+2 pin\";s:39:\"Кількість роз\'ємів SATA\";s:1:\"4\";s:45:\"Кількість роз\'ємів Peripheral\";s:1:\"2\";s:38:\"Кількість роз\'ємів FDD\";s:1:\"1\";s:29:\"Тип охолодження\";s:20:\"вентилятор\";s:39:\"Діаметр вентиляторів\";s:10:\"1x120 мм\";s:18:\"Розмір, мм\";s:19:\"87 x 150 x 140 мм\";s:35:\"Країна виробництва\";s:10:\"Китай\";s:24:\"Гарантія, міс\";s:2:\"24\";}', 1208, 15, 'U0024637_big.jpg', 6, '2019-12-22 20:55:03', '2019-12-22 20:55:03'),
(41, 'ЗВУКОВА ПЛАТА ASUS XONAR DG 5.1', 'a:6:{s:16:\"Виробник\";s:4:\"ASUS\";s:12:\"Модель\";s:12:\"Xonar DG 5.1\";s:18:\"Інтерфейс\";s:3:\"PCI\";s:33:\"Кількість каналів\";s:3:\"5.1\";s:35:\"Країна виробництва\";s:10:\"Китай\";s:24:\"Гарантія, міс\";s:2:\"12\";}', 903, 5, 'U0236867_big.jpg', 8, '2019-12-22 20:57:18', '2019-12-22 20:57:18'),
(42, 'МОДУЛЬ ПАМ\'ЯТІ для ПК DDR4 16GB BLACK KINGSTON', 'a:13:{s:16:\"Виробник\";s:8:\"Kingston\";s:12:\"Модель\";s:44:\"DDR4 16GB (2x8GB) 2400 MHz HyperX FURY Black\";s:20:\"Тип пам\'яті\";s:5:\"DDR 4\";s:23:\"Об\'єм пам\'яті\";s:5:\"16 GB\";s:49:\"Кількість модулів у наборі\";s:1:\"2\";s:32:\"Стандарти пам\'яті\";s:9:\"PC4-19200\";s:28:\"Частота пам\'яті\";s:8:\"2400 MHz\";s:16:\"Таймінги\";s:4:\"CL15\";s:14:\"Напруга\";s:5:\"1.2 V\";s:35:\"Форм-фактор пам\'яті\";s:12:\"288-pin DIMM\";s:22:\"Охолодження\";s:16:\"радіатор\";s:35:\"Країна виробництва\";s:14:\"Тайвань\";s:24:\"Гарантія, міс\";s:2:\"99\";}', 2452, 10, 'U0170754_big.jpg', 7, '2019-12-22 21:01:02', '2019-12-22 21:01:02'),
(43, 'КОРПУС VINGA CHAOS', 'a:12:{s:25:\"Класс корпусу\";s:20:\"Геймерські\";s:20:\"Типорозмір\";s:9:\"Miditower\";s:31:\"Спосіб установки\";s:24:\"вертикальний\";s:58:\"Підтримувані материнські плати\";s:16:\"ATX, Micro - ATX\";s:46:\"Наявність блоку живлення\";s:34:\"без блоку живлення\";s:52:\"Розташування блоку живлення\";s:10:\"нижнє\";s:52:\"Кількість слотів розширення\";s:1:\"7\";s:18:\"Розмір, мм\";s:20:\"390 x 210 x 450 мм\";s:16:\"Виробник\";s:5:\"Vinga\";s:12:\"Модель\";s:5:\"Chaos\";s:35:\"Країна виробництва\";s:10:\"Китай\";s:24:\"Гарантія, міс\";s:2:\"12\";}', 1260, 7, 'U0300243_big.jpg', 5, '2019-12-22 21:04:11', '2019-12-22 21:04:11'),
(44, 'ПРОЦЕСОР INTEL CORE™ I3 9100F', 'a:13:{s:16:\"Виробник\";s:5:\"INTEL\";s:12:\"Модель\";s:13:\"Core i3 9100F\";s:19:\"Тип сокету\";s:5:\"s1151\";s:37:\"Сімейство процесора\";s:13:\"Intel Core i3\";s:27:\"Кількість ядер\";s:10:\"4 ядра\";s:38:\"Тактова частота ядра\";s:6:\"3.6GHz\";s:33:\"Кількість потоків\";s:14:\"4 потоки\";s:25:\"Графічне ядро\";s:10:\"немає\";s:25:\"Технологія CMOS\";s:4:\"14nm\";s:20:\"Теплопакет\";s:3:\"65W\";s:23:\"Тип поставки\";s:3:\"BOX\";s:35:\"Країна виробництва\";s:14:\"Гонконг\";s:24:\"Гарантія, міс\";s:2:\"36\";}', 3385, 5, 'U0356256_big.jpg', 1, '2019-12-22 21:07:25', '2019-12-22 21:07:25'),
(45, 'ЖОРСТКИЙ ДИСК 3.5\" 1TB WESTERN DIGITAL', 'a:9:{s:16:\"Виробник\";s:15:\"Western Digital\";s:12:\"Модель\";s:8:\"3.5\" 1TB\";s:9:\"Об\'єм\";s:4:\"1 TB\";s:54:\"Швидкість обертання шпинделя\";s:14:\"7200 об/хв\";s:25:\"Розмір буферу\";s:5:\"64 MB\";s:18:\"Інтерфейс\";s:8:\"SATA III\";s:27:\"Лінійка (Серія)\";s:11:\"Caviar Blue\";s:35:\"Країна виробництва\";s:14:\"Таїланд\";s:24:\"Гарантія, міс\";s:2:\"24\";}', 1159, 10, 'U0018669_big.jpg', 4, '2019-12-22 21:14:30', '2019-12-22 21:14:30'),
(46, 'МАТЕРИНСЬКА ПЛАТА GIGABYTE GA-970A-DS3P', 'a:17:{s:6:\"Вид\";s:26:\"для комп\'ютера\";s:22:\"Призначення\";s:16:\"звичайна\";s:54:\"Охолодження південного моста\";s:16:\"радіатор\";s:10:\"Сокет\";s:11:\"Socket AM3+\";s:31:\"Слоти розширення\";s:86:\"2 x PCI, 1 x PCI-Eх 2.0 x16, 1 x PCI-Eх 2.0 x16 (4 канала), 3 x PCI-Eх 2.0 x1\";s:43:\"Тип оперативної пам\'яті\";s:4:\"DDR3\";s:22:\"Частота, МГц\";s:35:\"1600, 1333, 1066, 1866, 2000 (O.C.)\";s:41:\"Кількість роз\'ємів, шт.\";s:1:\"4\";s:48:\"Максимальний об\'єм пам\'яті\";s:5:\"64 GB\";s:46:\"Внутрішні роз\'єми і порти\";s:17:\"6 x Sata 6.0 Gb/s\";s:14:\"Колодки\";s:26:\"1-х USB 3.0, 3-х USB 2.0\";s:31:\"Основне живлення\";s:21:\"24 піновий ATX\";s:21:\"Живлення 12В\";s:28:\"4 піновий АТХ 12В\";s:21:\"Форм-фактор\";s:3:\"ATX\";s:18:\"Висота, мм\";s:3:\"305\";s:18:\"Ширина, мм\";s:3:\"215\";s:23:\"Тип поставки\";s:3:\"BOX\";}', 2112, 7, 'U0050090_big.jpg', 3, '2019-12-22 21:23:15', '2019-12-22 21:23:15'),
(47, 'ВІДЕОКАРТА GIGABYTE GEFORCE GT1030 2048MB OC', 'a:19:{s:16:\"Виробник\";s:8:\"GIGABYTE\";s:12:\"Модель\";s:24:\"GeForce GT1030 2048Mb OC\";s:33:\"Сімейство графіки\";s:6:\"NVIDIA\";s:25:\"Графічний чіп\";s:15:\"GeForce GT 1030\";s:18:\"Інтерфейс\";s:15:\"PCI Express 3.0\";s:44:\"Об\'єм вбудованої пам\'яті\";s:6:\"2 ГБ\";s:20:\"Тип пам\'яті\";s:6:\"GDDR 5\";s:45:\"Розрядність шини пам\'яті\";s:6:\"64 Bit\";s:30:\"Частота ядра (Base)\";s:8:\"1290 MHz\";s:31:\"Частота ядра (Boost)\";s:8:\"1544 MHz\";s:28:\"Частота пам\'яті\";s:8:\"6008 MHz\";s:50:\"Максимальне число дисплеїв\";s:1:\"2\";s:60:\"Максимальна роздільна здатність\";s:11:\"4096 x 2160\";s:13:\"Роз\'єми\";s:9:\"HDMI, DVI\";s:96:\"Мінімальна рекомендована потужність блоку живлення\";s:8:\"300 Вт\";s:20:\"Версія DirectX\";s:2:\"12\";s:19:\"Версія OpenGL\";s:3:\"4.5\";s:35:\"Країна виробництва\";s:10:\"Китай\";s:24:\"Гарантія, міс\";s:2:\"36\";}', 2346, 10, 'U0246322_big.jpg', 2, '2019-12-22 21:27:42', '2019-12-22 21:27:42'),
(48, 'ПРОЦЕСОР AMD RYZEN 5 2600', 'a:14:{s:16:\"Виробник\";s:3:\"AMD\";s:12:\"Модель\";s:12:\"Ryzen 5 2600\";s:37:\"Сімейство процесора\";s:9:\"AMD Ryzen\";s:19:\"Тип сокету\";s:3:\"AM4\";s:27:\"Кількість ядер\";s:10:\"6 ядер\";s:45:\"Частота ядра в Boost режимі\";s:6:\"3.9GHz\";s:33:\"Кількість потоків\";s:17:\"12 потоків\";s:38:\"Тактова частота ядра\";s:6:\"3.4GHz\";s:25:\"Графічне ядро\";s:10:\"немає\";s:20:\"Теплопакет\";s:3:\"65W\";s:32:\"Мікроархітектура\";s:4:\"Zen+\";s:23:\"Тип поставки\";s:3:\"BOX\";s:35:\"Країна виробництва\";s:14:\"Гонконг\";s:24:\"Гарантія, міс\";s:2:\"36\";}', 4480, 5, 'U0290345_big.jpg', 1, '2019-12-22 21:31:34', '2019-12-22 21:31:34');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', NULL, NULL),
(2, 'user', 'web', '2019-06-24 20:41:26', '2019-06-24 20:41:26');

-- --------------------------------------------------------

--
-- Структура таблицы `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `phone`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', 'admin@gmail.com', '380987777777', '$2y$10$nUivBUTIYhdKJbPkFv0KyuuCB.m9jVisjLregNooLjEF9Vfp.TI.y', 'jJHdlWZO11hV1Lo8inU4Srvhw1QIMZzoqgGwCcYRAlw00I8KnIjsSFkkr5xA', '2019-06-24 12:27:26', '2019-06-24 12:27:26'),
(2, 'Vasya', 'Shumskyy', 'vasya@gmail.com', '380980757076', '$2y$10$RLWMZJz0zdnFnaRXZmDmWu5bqKqjDIGdeMuODSqrx3tD1I3/ATzIS', 'ipVARr9Yt3JWYjvlKpckaD88YAquOf5FLmRTY1u5ciVn9IPjDrHkBqkBuox6', '2019-06-24 12:30:28', '2019-10-02 11:04:04'),
(4, 'Ivan', 'Ivanov', 'ivanov@gmail.com', '380985555555', '$2y$10$SXIGJzVq/PPpUsLIQVuUbOXV3ddp0LJZhseYcoEsW8TMkZ1JTdjOG', 'lX1d0QZFEeyiAZ3Dq7LeaA7L6UiVNBU6mjpO7S8TTmeHbeqa2L79Wn5feb9q', '2019-06-24 21:50:58', '2019-06-24 21:50:58');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Индексы таблицы `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
