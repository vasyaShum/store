-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 26 2019 г., 23:34
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
(10, 14, 'Vasya', 2, 'Хочу собі таку мишку)', '2019-06-25 22:52:42', '2019-06-25 22:52:42'),
(11, 23, 'Ivan', 4, 'Хочу собі такий.', '2019-06-26 10:51:40', '2019-06-26 10:51:40'),
(12, 22, 'Ivan', 4, 'Рекомендую!', '2019-06-26 10:52:17', '2019-06-26 10:52:17'),
(14, 24, 'Admin', 1, 'Клас', '2019-06-26 11:23:30', '2019-06-26 11:23:30');

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
(10, 2, 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:3:{i:22;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:1558;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:22;s:4:\"name\";s:42:\"ЖОРСТКИЙ ДИСК 3.5\" 3TB SEAGATE\";s:6:\"detail\";s:596:\"<p><strong>Виробник&nbsp;</strong> Seagate</p>\r\n<p><strong>Модель&nbsp;</strong> 3.5\" 3TB</p>\r\n<p><strong>Об&rsquo;єм&nbsp;</strong> 3 TB</p>\r\n<p><strong>Швидкість обертання шпинделя</strong>&nbsp; 5400 об/хв</p>\r\n<p><strong>Розмір буферу&nbsp;</strong> 256 MB</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> SATA III</p>\r\n<p><strong>Інше&nbsp;</strong> Refurbished(вІдновлений)</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>\";s:5:\"price\";i:1558;s:5:\"count\";i:10;s:5:\"photo\";s:16:\"U0354232_big.jpg\";s:11:\"category_id\";i:4;s:10:\"created_at\";s:19:\"2019-06-26 01:09:53\";s:10:\"updated_at\";s:19:\"2019-06-26 01:10:21\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:22;s:4:\"name\";s:42:\"ЖОРСТКИЙ ДИСК 3.5\" 3TB SEAGATE\";s:6:\"detail\";s:596:\"<p><strong>Виробник&nbsp;</strong> Seagate</p>\r\n<p><strong>Модель&nbsp;</strong> 3.5\" 3TB</p>\r\n<p><strong>Об&rsquo;єм&nbsp;</strong> 3 TB</p>\r\n<p><strong>Швидкість обертання шпинделя</strong>&nbsp; 5400 об/хв</p>\r\n<p><strong>Розмір буферу&nbsp;</strong> 256 MB</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> SATA III</p>\r\n<p><strong>Інше&nbsp;</strong> Refurbished(вІдновлений)</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>\";s:5:\"price\";i:1558;s:5:\"count\";i:10;s:5:\"photo\";s:16:\"U0354232_big.jpg\";s:11:\"category_id\";i:4;s:10:\"created_at\";s:19:\"2019-06-26 01:09:53\";s:10:\"updated_at\";s:19:\"2019-06-26 01:10:21\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:18;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:894;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:18;s:4:\"name\";s:43:\"ВЕБ-КАМЕРА LOGITECH WEBCAM C270 HD\";s:6:\"detail\";s:1181:\"<p><strong>Виробник&nbsp;</strong> Logitech</p>\r\n<p><strong>Модель&nbsp;</strong> Webcam C270 HD</p>\r\n<p><strong>Кількість пікселів</strong>&nbsp; 3 МП</p>\r\n<p><strong>Стандарт роздільної здатності відео</strong>&nbsp; HD</p>\r\n<p><strong>Максимальна роздільна здатність відео</strong>&nbsp; 1280 x 720 пікселів</p>\r\n<p><strong>Максимальна частота кадрів</strong>&nbsp; до 30 кадрів/с</p>\r\n<p><strong>Фокусування&nbsp;</strong> ручне</p>\r\n<p><strong>Кріплення&nbsp;</strong> настільний, прищіпка</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> USB 2.0</p>\r\n<p><strong>Системні вимоги</strong>&nbsp; Windows XP, Windows Vista, Windows 7</p>\r\n<p><strong>Довжина кабеля&nbsp;</strong> 1.5 м</p>\r\n<p><strong>Мікрофон&nbsp;</strong> вбудований мікрофон</p>\r\n<p><strong>Колір&nbsp;</strong> чорний</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 24</p>\";s:5:\"price\";i:894;s:5:\"count\";i:7;s:5:\"photo\";s:16:\"U0162513_big.jpg\";s:11:\"category_id\";i:9;s:10:\"created_at\";s:19:\"2019-06-26 00:41:42\";s:10:\"updated_at\";s:19:\"2019-06-26 00:41:42\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:18;s:4:\"name\";s:43:\"ВЕБ-КАМЕРА LOGITECH WEBCAM C270 HD\";s:6:\"detail\";s:1181:\"<p><strong>Виробник&nbsp;</strong> Logitech</p>\r\n<p><strong>Модель&nbsp;</strong> Webcam C270 HD</p>\r\n<p><strong>Кількість пікселів</strong>&nbsp; 3 МП</p>\r\n<p><strong>Стандарт роздільної здатності відео</strong>&nbsp; HD</p>\r\n<p><strong>Максимальна роздільна здатність відео</strong>&nbsp; 1280 x 720 пікселів</p>\r\n<p><strong>Максимальна частота кадрів</strong>&nbsp; до 30 кадрів/с</p>\r\n<p><strong>Фокусування&nbsp;</strong> ручне</p>\r\n<p><strong>Кріплення&nbsp;</strong> настільний, прищіпка</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> USB 2.0</p>\r\n<p><strong>Системні вимоги</strong>&nbsp; Windows XP, Windows Vista, Windows 7</p>\r\n<p><strong>Довжина кабеля&nbsp;</strong> 1.5 м</p>\r\n<p><strong>Мікрофон&nbsp;</strong> вбудований мікрофон</p>\r\n<p><strong>Колір&nbsp;</strong> чорний</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 24</p>\";s:5:\"price\";i:894;s:5:\"count\";i:7;s:5:\"photo\";s:16:\"U0162513_big.jpg\";s:11:\"category_id\";i:9;s:10:\"created_at\";s:19:\"2019-06-26 00:41:42\";s:10:\"updated_at\";s:19:\"2019-06-26 00:41:42\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:23;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:942;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:6:{i:0;s:4:\"name\";i:1;s:6:\"detail\";i:2;s:5:\"price\";i:3;s:5:\"count\";i:4;s:5:\"photo\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:23;s:4:\"name\";s:23:\"КОРПУС VINGA GAIA\";s:6:\"detail\";s:1353:\"<p><strong>Класс корпусу</strong>&nbsp; Геймерські</p>\r\n<p><strong>Типорозмір</strong>&nbsp; Minitower</p>\r\n<p><strong>Спосіб установки</strong>&nbsp; вертикальний</p>\r\n<p><strong>Підтримувані материнські плати&nbsp;</strong> Micro - ATX, Mini - ITX</p>\r\n<p><strong>Наявність блоку живлення</strong>&nbsp; без блоку живлення</p>\r\n<p><strong>Розташування блоку живлення</strong>&nbsp; нижнє</p>\r\n<p><strong>Зовнішні роз\'єми</strong>&nbsp; 1 x USB 3.1, 1 x USB 2.0, Audio</p>\r\n<p><strong>Особливості&nbsp; отвори</strong> для укладання кабелів, вікно на бічній панелі</p>\r\n<p><strong>Встановлення довгих відеокарт</strong>&nbsp; до 393 мм</p>\r\n<p><strong>Максимальна висота процесорного кулера</strong>&nbsp; 16 см</p>\r\n<p><strong>Матеріал корпусу</strong>&nbsp; метал, пластик</p>\r\n<p><strong>Виробник&nbsp;</strong> Vinga</p>\r\n<p><strong>Модель&nbsp;</strong> Gaia</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>\r\n<p>&nbsp;</p>\";s:5:\"price\";i:942;s:5:\"count\";i:15;s:5:\"photo\";s:16:\"U0300245_big.jpg\";s:11:\"category_id\";i:5;s:10:\"created_at\";s:19:\"2019-06-26 01:15:09\";s:10:\"updated_at\";s:19:\"2019-06-26 01:15:24\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:23;s:4:\"name\";s:23:\"КОРПУС VINGA GAIA\";s:6:\"detail\";s:1353:\"<p><strong>Класс корпусу</strong>&nbsp; Геймерські</p>\r\n<p><strong>Типорозмір</strong>&nbsp; Minitower</p>\r\n<p><strong>Спосіб установки</strong>&nbsp; вертикальний</p>\r\n<p><strong>Підтримувані материнські плати&nbsp;</strong> Micro - ATX, Mini - ITX</p>\r\n<p><strong>Наявність блоку живлення</strong>&nbsp; без блоку живлення</p>\r\n<p><strong>Розташування блоку живлення</strong>&nbsp; нижнє</p>\r\n<p><strong>Зовнішні роз\'єми</strong>&nbsp; 1 x USB 3.1, 1 x USB 2.0, Audio</p>\r\n<p><strong>Особливості&nbsp; отвори</strong> для укладання кабелів, вікно на бічній панелі</p>\r\n<p><strong>Встановлення довгих відеокарт</strong>&nbsp; до 393 мм</p>\r\n<p><strong>Максимальна висота процесорного кулера</strong>&nbsp; 16 см</p>\r\n<p><strong>Матеріал корпусу</strong>&nbsp; метал, пластик</p>\r\n<p><strong>Виробник&nbsp;</strong> Vinga</p>\r\n<p><strong>Модель&nbsp;</strong> Gaia</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>\r\n<p>&nbsp;</p>\";s:5:\"price\";i:942;s:5:\"count\";i:15;s:5:\"photo\";s:16:\"U0300245_big.jpg\";s:11:\"category_id\";i:5;s:10:\"created_at\";s:19:\"2019-06-26 01:15:09\";s:10:\"updated_at\";s:19:\"2019-06-26 01:15:24\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:3;s:10:\"totalPrice\";i:3394;}', 'Рівне, вулиця Соборна 20', 'vasya@gmail.com', 'Vasya Shumskyy', '380980757076', 'Готується до відправлення', '2019-06-26 11:21:04', '2019-06-26 11:21:51');

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
(1, 'ПРОЦЕСОР AMD RYZEN 5 2600', '<p><strong>Виробник&nbsp;</strong> AMD</p>\r\n<p><strong>Модель&nbsp; </strong>Ryzen 5 2600</p>\r\n<p><strong>Сімейство процесора&nbsp;</strong> AMD Ryzen</p>\r\n<p><strong>Тип сокету&nbsp;</strong> AM4</p>\r\n<p><strong>Кількість ядер</strong>&nbsp; 6 ядер</p>\r\n<p><strong>Частота ядра в Boost режимі</strong>&nbsp; 3.9GHz</p>\r\n<p><strong>Кількість потоків</strong>&nbsp; 12 потоків</p>\r\n<p><strong>Тактова частота ядра</strong>&nbsp; 3.4GHz</p>\r\n<p><strong>Графічне ядро</strong>&nbsp; немає</p>\r\n<p><strong>Теплопакет&nbsp;</strong> 65W</p>\r\n<p><strong>Мікроархітектура&nbsp;</strong> Zen+</p>\r\n<p><strong>Тип поставки</strong>&nbsp; BOX</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Гонконг</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 36</p>', 4480, 5, 'U0290345_big.jpg', 1, '2019-06-17 10:48:05', '2019-06-25 19:02:05'),
(2, 'ВІДЕОКАРТА GIGABYTE GEFORCE GT1030 2048MB OC', '<p><strong>Виробник&nbsp;</strong> GIGABYTE</p>\r\n<p><strong>Модель&nbsp;</strong> GeForce GT1030 2048Mb OC</p>\r\n<p><strong>Сімейство графіки</strong>&nbsp; NVIDIA</p>\r\n<p><strong>Графічний чіп</strong>&nbsp; GeForce GT 1030</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> PCI Express 3.0</p>\r\n<p><strong>Об\'єм вбудованої пам\'яті</strong>&nbsp; 2 ГБ</p>\r\n<p><strong>Тип пам\'яті</strong>&nbsp; GDDR 5</p>\r\n<p><strong>Розрядність шини пам\'яті</strong>&nbsp; 64 Bit</p>\r\n<p><strong>Частота ядра (Base)</strong>&nbsp; 1290 MHz</p>\r\n<p><strong>Частота ядра (Boost)</strong>&nbsp; 1544 MHz</p>\r\n<p><strong>Частота пам\'яті</strong>&nbsp; 6008 MHz</p>\r\n<p><strong>Максимальне число дисплеїв</strong>&nbsp; 2</p>\r\n<p><strong>Максимальна роздільна здатність</strong>&nbsp; 4096 x 2160</p>\r\n<p><strong>Роз\'єми</strong>&nbsp; HDMI, DVI</p>\r\n<p><strong>Мінімальна рекомендована потужність блоку живлення</strong>&nbsp; 300 Вт</p>\r\n<p><strong>Версія DirectX</strong>&nbsp; 12</p>\r\n<p><strong>Версія OpenGL</strong>&nbsp; 4.5</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 36</p>', 2346, 10, 'U0246322_big.jpg', 2, '2019-06-18 01:58:56', '2019-06-25 18:58:37'),
(3, 'МАТЕРИНСЬКА ПЛАТА GIGABYTE GA-970A-DS3P', '<p><strong>Вид&nbsp;</strong> для комп\'ютера</p>\r\n<p><strong>Призначення&nbsp;</strong> звичайна</p>\r\n<p><strong>Охолодження південного моста</strong>&nbsp; радіатор</p>\r\n<p><strong>Сокет&nbsp;</strong> Socket AM3+</p>\r\n<p><strong>Слоти розширення</strong>&nbsp; 2 x PCI, 1 x PCI-Eх 2.0 x16, 1 x PCI-Eх 2.0 x16 (4 канала), 3 x PCI-Eх 2.0 x1</p>\r\n<p><strong>Тип оперативної пам\'яті</strong>&nbsp; DDR3</p>\r\n<p><strong>Частота, МГц</strong>&nbsp; 1600, 1333, 1066, 1866, 2000 (O.C.)</p>\r\n<p><strong>Кількість роз\'ємів, шт.</strong>&nbsp; 4</p>\r\n<p><strong>Максимальний об\'єм пам\'яті</strong>&nbsp; 64 GB</p>\r\n<p><strong>Внутрішні роз\'єми і порти</strong>&nbsp; 6 x Sata 6.0 Gb/s</p>\r\n<p><strong>Колодки&nbsp;</strong> 1-х USB 3.0, 3-х USB 2.0</p>\r\n<p><strong>Основне живлення</strong>&nbsp; 24 піновий ATX</p>\r\n<p><strong>Живлення 12В</strong>&nbsp; 4 піновий АТХ 12В</p>\r\n<p><strong>Форм-фактор</strong>&nbsp; ATX</p>\r\n<p><strong>Висота, мм</strong>&nbsp; 305</p>\r\n<p><strong>Ширина, мм</strong>&nbsp; 215</p>\r\n<p><strong>Тип поставки</strong>&nbsp; BOX</p>', 2112, 7, 'U0050090_big.jpg', 3, '2019-06-19 06:05:10', '2019-06-25 18:58:23'),
(4, 'ЖОРСТКИЙ ДИСК 3.5\" 1TB WESTERN DIGITAL', '<p><strong>Виробник&nbsp;</strong> Western Digital</p>\r\n<p><strong>Модель&nbsp;</strong> 3.5\" 1TB</p>\r\n<p><strong>Об&rsquo;єм&nbsp;</strong> 1 TB</p>\r\n<p><strong>Швидкість обертання шпинделя</strong>&nbsp; 7200 об/хв</p>\r\n<p><strong>Розмір буферу</strong>&nbsp; 64 MB</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> SATA III</p>\r\n<p><strong>Лінійка (Серія)</strong>&nbsp; Caviar Blue</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Таїланд</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 24</p>', 1159, 10, 'U0018669_big.jpg', 4, '2019-06-24 18:35:15', '2019-06-25 18:56:39'),
(5, 'ПРОЦЕСОР INTEL CORE™ I3 9100F', '<p><strong>Виробник&nbsp;</strong> INTEL</p>\r\n<p><strong>Модель&nbsp;</strong> Core&trade; i3 9100F</p>\r\n<p><strong>Тип сокету</strong>&nbsp; s1151</p>\r\n<p><strong>Сімейство процесора</strong>&nbsp; Intel Core &trade; i3</p>\r\n<p><strong>Кількість ядер</strong>&nbsp; 4 ядра</p>\r\n<p><strong>Тактова частота ядра</strong>&nbsp; 3.6GHz</p>\r\n<p><strong>Кількість потоків</strong>&nbsp; 4 потоки</p>\r\n<p><strong>Графічне ядро</strong>&nbsp; немає</p>\r\n<p><strong>Технологія CMOS</strong>&nbsp; 14nm</p>\r\n<p><strong>Теплопакет</strong>&nbsp; 65W</p>\r\n<p><strong>Тип поставки</strong>&nbsp; BOX</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Гонконг</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 36</p>', 3385, 3, 'U0356256_big.jpg', 1, '2019-06-19 07:49:03', '2019-06-25 18:47:35'),
(6, 'КОРПУС VINGA CHAOS', '<p><strong>Класс корпусу&nbsp; </strong>Геймерські</p>\r\n<p><strong>Типорозмір&nbsp; </strong>Miditower</p>\r\n<p><strong>Спосіб установки&nbsp; </strong>вертикальний</p>\r\n<p><strong>Підтримувані материнські плати&nbsp;</strong> ATX, Micro - ATX</p>\r\n<p><strong>Наявність блоку живлення&nbsp;</strong> без блоку живлення</p>\r\n<p><strong>Розташування блоку живлення</strong>&nbsp; нижнє</p>\r\n<p><strong>Кількість слотів розширення&nbsp; </strong>7</p>\r\n<p><strong>Розмір, мм&nbsp; </strong>390 x 210 x 450 мм</p>\r\n<p><strong>Виробник&nbsp; </strong>Vinga</p>\r\n<p><strong>Модель&nbsp;</strong> Chaos</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 12</p>', 1260, 7, 'U0300243_big.jpg', 5, '2019-06-24 18:58:02', '2019-06-25 18:56:32'),
(9, 'МОДУЛЬ ПАМ\'ЯТІ для ПК DDR4 16GB BLACK KINGSTON', '<p><strong>Виробник&nbsp;</strong> Kingston</p>\r\n<p><strong>Модель&nbsp;</strong> DDR4 16GB (2x8GB) 2400 MHz HyperX FURY Black</p>\r\n<p><strong>Тип пам\'яті&nbsp;</strong> DDR 4</p>\r\n<p><strong>Об\'єм пам\'яті&nbsp;</strong> 16 GB</p>\r\n<p><strong>Кількість модулів у наборі</strong>&nbsp; 2</p>\r\n<p><strong>Стандарти пам\'яті&nbsp;</strong> PC4-19200</p>\r\n<p><strong>Частота пам\'яті</strong>&nbsp; 2400 MHz</p>\r\n<p><strong>Таймінги</strong>&nbsp; CL15</p>\r\n<p><strong>Напруга</strong>&nbsp; 1.2 V</p>\r\n<p><strong>Форм-фактор пам\'яті</strong>&nbsp; 288-pin DIMM</p>\r\n<p><strong>Буферизація&nbsp;</strong> unbuffered</p>\r\n<p><strong>Охолодження&nbsp; </strong>радіатор</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Тайвань</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 99</p>', 2452, 10, 'U0170754_big.jpg', 7, '2019-06-25 19:21:35', '2019-06-25 19:22:53'),
(10, 'ЗВУКОВА ПЛАТА ASUS XONAR DG 5.1', '<p><strong>Виробник&nbsp;</strong> ASUS</p>\r\n<p><strong>Модель&nbsp;</strong> Xonar DG 5.1</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> PCI</p>\r\n<p><strong>Кількість каналів</strong>&nbsp; 5.1</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>', 903, 5, 'U0236867_big.jpg', 8, '2019-06-25 19:29:35', '2019-06-25 19:29:35'),
(11, 'БЛОК ЖИВЛЕННЯ CHIEFTEC 600W', '<p><strong>Виробник&nbsp;</strong> CHIEFTEC</p>\r\n<p><strong>Модель&nbsp;</strong> 600W</p>\r\n<p><strong>Тип БЖ&nbsp;</strong> для комп\'ютерів</p>\r\n<p><strong>Стандарт БЖ</strong>&nbsp; ATX 12V v2.3</p>\r\n<p><strong>Потужність&nbsp;</strong> 600Вт</p>\r\n<p><strong>Модульне підключення кабелів</strong>&nbsp; не має</p>\r\n<p><strong>Модуль PF</strong>&nbsp; Cактивний</p>\r\n<p><strong>Підключення материнскої плати</strong>&nbsp; 20+4 pin</p>\r\n<p><strong>Підключення процесора</strong>&nbsp; 4+4 pin</p>\r\n<p><strong>Кіл-ть роз\'ємів додаткового живлення для відеокарт</strong>&nbsp; 2</p>\r\n<p><strong>Підключення відеокарти</strong>&nbsp; 2x6+2 pin</p>\r\n<p><strong>Кількість роз\'ємів SATA</strong>&nbsp; 4</p>\r\n<p><strong>Кількість роз\'ємів Peripheral</strong>&nbsp; 2</p>\r\n<p><strong>Кількість роз\'ємів FDD</strong>&nbsp; 1</p>\r\n<p><strong>Тип охолодження</strong>&nbsp; вентилятор</p>\r\n<p><strong>Діаметр вентиляторів</strong>&nbsp; 1x120 мм</p>\r\n<p><strong>Розмір, мм</strong>&nbsp; 87 x 150 x 140 мм</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 24</p>', 1208, 15, 'U0024637_big.jpg', 6, '2019-06-25 19:35:00', '2019-06-25 19:35:37'),
(12, 'ТЕРМОПАСТА VINGA TG10', '<p><strong>Виробник</strong>&nbsp; Vinga</p>\r\n<p><strong>Модель&nbsp;</strong> TG10</p>\r\n<p><strong>Сумісність&nbsp;</strong> для процесорів</p>\r\n<p><strong>Теплопровідність&nbsp;</strong> 4.63 W/mK</p>\r\n<p><strong>Робоча температура</strong>&nbsp; -30 до 300 &deg;C</p>\r\n<p><strong>Вага&nbsp;</strong> 1.5 г</p>\r\n<p><strong>Тип упаковки&nbsp;</strong> шприц</p>\r\n<p><strong>Країна</strong> виробництва&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 0</p>', 67, 20, 'U0205612_big.jpg', 9, '2019-06-25 21:08:19', '2019-06-25 21:08:19'),
(13, 'КУЛЕР ДО ПРОЦЕСОРА VINGA CL3007R', '<p><strong>Виробник&nbsp;</strong> Vinga</p>\r\n<p><strong>Модель&nbsp;</strong> CL3007R</p>\r\n<p><strong>Для процесорів</strong>&nbsp; INTEL, AMD</p>\r\n<p><strong>Під сокети</strong>&nbsp; AM4, 1151, 775, 1155, 1150, 1156, AM2, AM2+, AM3, AM3+</p>\r\n<p><strong>Тип системи охолодження</strong>&nbsp; активна (кулер)</p>\r\n<p><strong>Матеріал радіатора</strong>&nbsp; алюміній</p>\r\n<p><strong>Кількість вентиляторів</strong>&nbsp; 1</p>\r\n<p><strong>Діаметр вентиляторів</strong>&nbsp; 120 мм</p>\r\n<p><strong>Максимальна швидкість обертання вентиляторів</strong>&nbsp; 1500 об/хв</p>\r\n<p><strong>Система підшипників</strong>&nbsp; гідродинамічний підшипник</p>\r\n<p><strong>Управління швидкістю обертання</strong>&nbsp; так</p>\r\n<p><strong>Повітряний потік</strong>&nbsp; 65 CFM</p>\r\n<p><strong>Рівень шуму&nbsp;</strong> 26.5 dB</p>\r\n<p><strong>Роз\'єми живлення</strong>&nbsp; 4-pin</p>\r\n<p><strong>Підсвітка&nbsp;</strong> червона</p>\r\n<p><strong>Максимальна потужність, що розсіюється</strong>&nbsp; 160 Вт</p>\r\n<p><strong>Розмір (загальний)&nbsp;</strong> 125 x 85 x 155 мм</p>\r\n<p><strong>Додатково</strong>&nbsp; 5 теплових труб</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>', 808, 8, 'U0301226_big.jpg', 9, '2019-06-25 21:12:48', '2019-06-25 21:12:48'),
(14, 'МИШКА LOGITECH M185 SWIFT GREY', '<p><strong>Виробник&nbsp;</strong> Logitech</p>\r\n<p><strong>Модель&nbsp;</strong> M185 swift grey</p>\r\n<p><strong>Тип&nbsp;</strong> Бездротові</p>\r\n<p><strong>Призначення&nbsp;</strong> для ноутбука, для комп\'ютера</p>\r\n<p><strong>Тип сенсора</strong>&nbsp; оптичний</p>\r\n<p><strong>Роздільна здатність (max)&nbsp;</strong> 1000 dpi</p>\r\n<p><strong>Кількість кнопок</strong>&nbsp; 3</p>\r\n<p><strong>Кількість коліс прокрутки</strong>&nbsp; 1</p>\r\n<p><strong>Тип скрола&nbsp;</strong> 1 кнопка-скрол</p>\r\n<p><strong>Інтерфейс підключення</strong>&nbsp; радіо</p>\r\n<p><strong>Живлення&nbsp;</strong> 1 &times; AA</p>\r\n<p><strong>Додаткові функції&nbsp;</strong> симетрична (підходить під ліву руку)</p>\r\n<p><strong>Розміри&nbsp;</strong> 99x60x39 мм</p>\r\n<p><strong>Вага&nbsp;</strong> 80 г</p>\r\n<p><strong>Колір&nbsp;</strong> сірий, чорний</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 36</p>', 449, 10, 'B0004852_big.jpg', 9, '2019-06-25 21:22:58', '2019-06-25 21:23:19'),
(15, 'КЛАВІАТУРА LOGITECH K400 PLUS DARK RU', '<p><strong>Виробник&nbsp;</strong> Logitech</p>\r\n<p><strong>Модель&nbsp;</strong> K400 Plus dark RU</p>\r\n<p><strong>Тип&nbsp;</strong> мультимедійна, бездротова</p>\r\n<p><strong>Призначення&nbsp;</strong> для планшета, для телевізора, для ПК</p>\r\n<p><strong>Конструкція&nbsp;</strong> мембранна</p>\r\n<p><strong>Тип підключення</strong>&nbsp; бездротова</p>\r\n<p><strong>Інтерфейс підключення</strong>&nbsp; радіо</p>\r\n<p><strong>Формат клавіатури</strong>&nbsp; компактна</p>\r\n<p><strong>Особливості&nbsp;</strong> вбудована сенсорна панель, безшумне введення</p>\r\n<p><strong>Розміри</strong>&nbsp; 354.3 х 139.9 х 23.5 мм</p>\r\n<p><strong>Вага&nbsp;</strong> 380 г</p>\r\n<p><strong>Колір&nbsp;</strong> чорна</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 24</p>', 859, 10, 'U0149527_big.jpg', 9, '2019-06-25 21:28:24', '2019-06-25 21:28:24'),
(16, 'КУЛЕР ДО КОРПУСУ VINGA 12025', '<p><strong>Виробник&nbsp;</strong> Vinga</p>\r\n<p><strong>Модель&nbsp;</strong> 12025</p>\r\n<p><strong>Кількість вентиляторів</strong>&nbsp; 1</p>\r\n<p><strong>Діаметр вентиляторів</strong>&nbsp; 120 мм</p>\r\n<p><strong>Максимальна швидкість обертання вентиляторів</strong>&nbsp; 1200RPM</p>\r\n<p><strong>Матеріал&nbsp;</strong> пластик</p>\r\n<p><strong>Рівень шуму</strong>&nbsp; 23.5 dB</p>\r\n<p><strong>Тип роз\'єму підключення</strong>&nbsp; 4pin (Molex)</p>\r\n<p><strong>Напруга живлення вентиляторів</strong>&nbsp; 12 В</p>\r\n<p><strong>Струм споживання вентиляторами</strong>&nbsp; 0.2 А</p>\r\n<p><strong>Енергоспоживання вентиляторів</strong>&nbsp; 2.4 Вт</p>\r\n<p><strong>Розмір&nbsp;</strong> 120 х 120 х 25 мм</p>\r\n<p><strong>Країна виробництва&nbsp;</strong> Китай</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 12</p>', 100, 10, 'U0186738_big.jpg', 9, '2019-06-25 21:32:17', '2019-06-25 21:32:17'),
(17, 'КАБЕЛЬ ЖИВЛЕННЯ VIDEO POWER 6PIN TO 2MOLEX ATCOM', '<p><strong>Виробник&nbsp;</strong> Atcom</p>\r\n<p><strong>Модель&nbsp; &nbsp;</strong>Video power 6pin to 2molex</p>\r\n<p><strong>Тип&nbsp;</strong> кабель</p>\r\n<p><strong>Роз\'єм 1</strong>&nbsp; 6 pin</p>\r\n<p><strong>Роз\'єм 2</strong>&nbsp; 2 х молекс</p>\r\n<p><strong>Довжина&nbsp;</strong> 0.15 м</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 0</p>', 27, 15, 'U0247870_big.jpg', 9, '2019-06-25 21:38:26', '2019-06-25 21:38:49'),
(18, 'ВЕБ-КАМЕРА LOGITECH WEBCAM C270 HD', '<p><strong>Виробник&nbsp;</strong> Logitech</p>\r\n<p><strong>Модель&nbsp;</strong> Webcam C270 HD</p>\r\n<p><strong>Кількість пікселів</strong>&nbsp; 3 МП</p>\r\n<p><strong>Стандарт роздільної здатності відео</strong>&nbsp; HD</p>\r\n<p><strong>Максимальна роздільна здатність відео</strong>&nbsp; 1280 x 720 пікселів</p>\r\n<p><strong>Максимальна частота кадрів</strong>&nbsp; до 30 кадрів/с</p>\r\n<p><strong>Фокусування&nbsp;</strong> ручне</p>\r\n<p><strong>Кріплення&nbsp;</strong> настільний, прищіпка</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> USB 2.0</p>\r\n<p><strong>Системні вимоги</strong>&nbsp; Windows XP, Windows Vista, Windows 7</p>\r\n<p><strong>Довжина кабеля&nbsp;</strong> 1.5 м</p>\r\n<p><strong>Мікрофон&nbsp;</strong> вбудований мікрофон</p>\r\n<p><strong>Колір&nbsp;</strong> чорний</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 24</p>', 894, 7, 'U0162513_big.jpg', 9, '2019-06-25 21:41:42', '2019-06-25 21:41:42'),
(19, 'USB ФЛЕШКА GOODRAM 16GB TWISTER BLUE USB 2.0', '<p><strong>Виробник&nbsp;</strong> GOODRAM</p>\r\n<p><strong>Модель&nbsp; </strong>16GB Twister Blue USB 2.0</p>\r\n<p><strong>Тип&nbsp;</strong> Класичні</p>\r\n<p><strong>Об\'єм пам\'яті&nbsp;</strong> 16 Gb</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> USB 2.0</p>\r\n<p><strong>Максимальня швидкість читання</strong>&nbsp; 20 Мбайт/сек</p>\r\n<p><strong>Максимальна швидкість запису&nbsp;</strong> 5 Мбайт/сек</p>\r\n<p><strong>Матеріал корпусу</strong>&nbsp; пластик/метал</p>\r\n<p><strong>Фізичні розміри&nbsp;</strong> 57.1 x 19.3 x 10.7 мм</p>\r\n<p><strong>Вага&nbsp;</strong> 15 г</p>\r\n<p><strong>Колір&nbsp;</strong> синій</p>\r\n<p><strong>Додатково&nbsp;</strong> вушко для кріплення до брелока, поворотний ковпачок</p>\r\n<p><strong>Країна виробництва&nbsp;</strong> Тайвань</p>\r\n<p><strong>Гарантія, міс</strong>&nbsp; 60</p>', 85, 20, 'U0175513_big.jpg', 9, '2019-06-25 21:50:36', '2019-06-25 21:52:12'),
(20, 'ВІДЕОКАРТА ASUS RADEON RX 580 8192MB ROG STRIX', '<p><strong>Виробник&nbsp;</strong> ASUS</p>\r\n<p><strong>Модель&nbsp;</strong> Radeon RX 580 8192Mb ROG STRIX GAMING TOP</p>\r\n<p><strong>Сімейство графіки</strong>&nbsp; AMD</p>\r\n<p><strong>Графічний чіп</strong>&nbsp; Radeon RX 580</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> PCI-Express x16</p>\r\n<p><strong>Об\'єм вбудованої пам\'яті</strong>&nbsp; 8 ГБ</p>\r\n<p><strong>Тип пам\'яті</strong>&nbsp; GDDR 5</p>\r\n<p><strong>Розрядність шини пам\'яті</strong>&nbsp; 256 Bit</p>\r\n<p><strong>Частота ядра (Base)&nbsp;</strong> 1431 MHz</p>\r\n<p><strong>Частота пам\'яті</strong>&nbsp; 8000 MHz</p>\r\n<p><strong>Максимальна роздільна здатність</strong>&nbsp; 7680 x 4320</p>\r\n<p><strong>Сумісність</strong> з HDCP&nbsp; так</p>\r\n<p><strong>Роз\'єми&nbsp;</strong> DVI, 2 х HDMI, 2 x DisplayPort</p>\r\n<p><strong>Тип системи охолодження</strong>&nbsp; активний</p>\r\n<p><strong>Вид охолодження</strong>&nbsp; радіатор, кулер</p>\r\n<p><strong>Кількість вентиляторів</strong>&nbsp; 3 шт</p>\r\n<p><strong>Роз\'єми додаткового живлення&nbsp;</strong> 8 pin</p>\r\n<p><strong>Мінімальна рекомендована потужність блоку живлення</strong>&nbsp; 500 Вт</p>\r\n<p><strong>Версія DirectX</strong>&nbsp; 12</p>\r\n<p><strong>Версія OpenGL</strong>&nbsp; 4.5</p>\r\n<p><strong>Країна виробництва&nbsp;</strong> Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 36</p>', 7099, 7, 'U0237943_big.jpg', 2, '2019-06-25 21:57:58', '2019-06-25 21:59:13'),
(21, 'ВІДЕОКАРТА ASUS GEFORCE GTX1060 6144MB DUAL OC', '<p><strong>Виробник&nbsp;</strong> ASUS</p>\r\n<p><strong>Модель&nbsp;</strong> GeForce GTX1060 6144Mb DUAL OC</p>\r\n<p><strong>Сімейство графіки&nbsp;</strong> NVIDIA</p>\r\n<p><strong>Графічний чіп</strong>&nbsp; GeForce GTX 1060</p>\r\n<p><strong>Інтерфейс&nbsp; </strong>PCI-Express x16</p>\r\n<p><strong>Об\'єм вбудованої пам\'яті&nbsp;</strong> 6 ГБ</p>\r\n<p><strong>Тип пам\'яті&nbsp;</strong> GDDR 5</p>\r\n<p><strong>Розрядність шини пам\'яті</strong>&nbsp; 192 Bit</p>\r\n<p><strong>Частота ядра (Base)</strong>&nbsp; 1594 MHz</p>\r\n<p><strong>Частота ядра (Boost)&nbsp;</strong> 1809 MHz</p>\r\n<p><strong>Частота пам\'яті&nbsp;</strong> 8008 MHz</p>\r\n<p><strong>Техпроцес&nbsp;</strong> 16 нм</p>\r\n<p><strong>Максимальне число дисплеїв</strong>&nbsp; 4</p>\r\n<p><strong>Максимальна роздільна здатність</strong>&nbsp; 7680 x 4320</p>\r\n<p><strong>Сумісність з HDCP</strong>&nbsp; так</p>\r\n<p><strong>Роз\'єми&nbsp;</strong> 2 x DisplayPort, DVI, 2 х HDMI</p>\r\n<p><strong>Тип системи охолодження&nbsp;</strong> активний</p>\r\n<p><strong>Вид охолодження</strong>&nbsp; кулер, радіатор</p>\r\n<p><strong>Кількість вентиляторів&nbsp;</strong> 2 шт</p>\r\n<p><strong>Мінімальна рекомендована потужність блоку живлення</strong>&nbsp; 500 Вт</p>\r\n<p><strong>Версія DirectX</strong>&nbsp; 12</p>\r\n<p><strong>Версія OpenGL</strong>&nbsp; 4.5</p>\r\n<p><strong>Розміри (мм)&nbsp;</strong> 242 x 130 x 43 мм</p>\r\n<p><strong>Країна виробництва&nbsp;</strong> Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 36</p>', 6999, 7, 'U0189920_big.jpg', 2, '2019-06-25 22:04:53', '2019-06-25 22:05:31'),
(22, 'ЖОРСТКИЙ ДИСК 3.5\" 3TB SEAGATE', '<p><strong>Виробник&nbsp;</strong> Seagate</p>\r\n<p><strong>Модель&nbsp;</strong> 3.5\" 3TB</p>\r\n<p><strong>Об&rsquo;єм&nbsp;</strong> 3 TB</p>\r\n<p><strong>Швидкість обертання шпинделя</strong>&nbsp; 5400 об/хв</p>\r\n<p><strong>Розмір буферу&nbsp;</strong> 256 MB</p>\r\n<p><strong>Інтерфейс&nbsp;</strong> SATA III</p>\r\n<p><strong>Інше&nbsp;</strong> Refurbished(вІдновлений)</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>', 1558, 10, 'U0354232_big.jpg', 4, '2019-06-25 22:09:53', '2019-06-25 22:10:21'),
(23, 'КОРПУС VINGA GAIA', '<p><strong>Класс корпусу</strong>&nbsp; Геймерські</p>\r\n<p><strong>Типорозмір</strong>&nbsp; Minitower</p>\r\n<p><strong>Спосіб установки</strong>&nbsp; вертикальний</p>\r\n<p><strong>Підтримувані материнські плати&nbsp;</strong> Micro - ATX, Mini - ITX</p>\r\n<p><strong>Наявність блоку живлення</strong>&nbsp; без блоку живлення</p>\r\n<p><strong>Розташування блоку живлення</strong>&nbsp; нижнє</p>\r\n<p><strong>Зовнішні роз\'єми</strong>&nbsp; 1 x USB 3.1, 1 x USB 2.0, Audio</p>\r\n<p><strong>Особливості&nbsp; отвори</strong> для укладання кабелів, вікно на бічній панелі</p>\r\n<p><strong>Встановлення довгих відеокарт</strong>&nbsp; до 393 мм</p>\r\n<p><strong>Максимальна висота процесорного кулера</strong>&nbsp; 16 см</p>\r\n<p><strong>Матеріал корпусу</strong>&nbsp; метал, пластик</p>\r\n<p><strong>Виробник&nbsp;</strong> Vinga</p>\r\n<p><strong>Модель&nbsp;</strong> Gaia</p>\r\n<p><strong>Країна виробництва</strong>&nbsp; Китай</p>\r\n<p><strong>Гарантія, міс&nbsp;</strong> 12</p>\r\n<p>&nbsp;</p>', 942, 15, 'U0300245_big.jpg', 5, '2019-06-25 22:15:09', '2019-06-25 22:15:24'),
(24, 'ПРОЦЕСОР INTEL CORE™ I5 9600K', '<p>Виробник&nbsp; INTEL</p>\r\n<p>Модель&nbsp; Core&trade; i5 9600K</p>\r\n<p>Тип сокету&nbsp; s1151</p>\r\n<p>Сімейство процесора&nbsp; Intel Core &trade; i5</p>\r\n<p>Кількість ядер&nbsp; 6 ядер</p>\r\n<p>Кількість потоків&nbsp; 6 потоків</p>\r\n<p>Частота ядра в Boost режимі&nbsp; 4.6GHz</p>\r\n<p>Тактова частота ядра&nbsp; 3.7GHz</p>\r\n<p>Графічне ядро&nbsp; Intel UHD 630</p>\r\n<p>Об\'єм кеш-пам\'яті 3-го рівня&nbsp; L3: 9MB</p>\r\n<p>Теплопакет&nbsp; 95W</p>\r\n<p>Особливості&nbsp; розблокований множитель</p>\r\n<p>Тип поставки&nbsp; BOX</p>\r\n<p>Країна виробництва Гонконг</p>\r\n<p>Гарантія, міс 36</p>', 8924, 10, 'U0320236_big.jpg', 1, '2019-06-26 11:23:13', '2019-06-26 11:23:13');

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
(1, 'Admin', 'Admin', 'admin@gmail.com', '380987777777', '$2y$10$nUivBUTIYhdKJbPkFv0KyuuCB.m9jVisjLregNooLjEF9Vfp.TI.y', '98TlRfZl76xV3PfTJbO8SrprbCWUR5gXMBF0yOwouctNLGIjy9yv6NMqVinq', '2019-06-24 12:27:26', '2019-06-24 12:27:26'),
(2, 'Vasya', 'Shumskyy', 'vasya@gmail.com', '380980757076', '$2y$10$RLWMZJz0zdnFnaRXZmDmWu5bqKqjDIGdeMuODSqrx3tD1I3/ATzIS', 'Td2KCl2eLk9CIEJa5st0DzBqhlqSEftSXFPzVOqiPgxXdK5My4LrLzUWaSAX', '2019-06-24 12:30:28', '2019-06-24 12:30:28'),
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
