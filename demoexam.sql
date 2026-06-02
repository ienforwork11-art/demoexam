-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.4:3306
-- Время создания: Июн 02 2026 г., 10:37
-- Версия сервера: 8.4.6
-- Версия PHP: 8.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `demoexam`
--

-- --------------------------------------------------------

--
-- Структура таблицы `request`
--

CREATE TABLE `request` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `status` enum('новая','мероприятие назначено','мероприятие завершено') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'новая',
  `venue` enum('аудитория','коворкинг','кинозал','выберите зал') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'выберите зал',
  `payment` enum('выберите тип оплаты','наличные','перевод','карта') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'выберите тип оплаты',
  `review` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `request`
--

INSERT INTO `request` (`id`, `user_id`, `date`, `status`, `venue`, `payment`, `review`) VALUES
(18, 19, '2026-06-04 12:15:00', 'мероприятие завершено', 'коворкинг', 'перевод', '60 человек'),
(19, 19, '2026-06-12 10:20:00', 'мероприятие назначено', 'кинозал', 'наличные', ''),
(20, 19, '2026-06-12 10:20:00', 'новая', 'кинозал', 'наличные', ''),
(21, 19, '2026-06-18 12:25:00', 'новая', 'аудитория', 'наличные', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `fullname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone`, `email`, `login`, `password`, `is_admin`, `created_at`) VALUES
(1, 'admin', '+7(900)-422-85-08', 'admin@gmail.com', 'Admin26', '$2y$12$FoElWYpny0S0/nnT5BITTOTubAIy1ioPYNkluIY6.RwRoAsvnZYCG', 1, '2025-10-09 15:57:44'),
(19, 'Абрамов Илья Витальевич', '+7(979)567-65-76', 'ilya@yandex.ru', 'ilya123', '$2y$12$HkF/YePz4pRq42cBbabVnOqQMG9uWRti/3oPY7s0Q728jWpnq0cF2', 0, '2026-06-02 07:07:11');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `request`
--
ALTER TABLE `request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
