-- Создание таблиц
-- Создание таблицы `hub_lesson_type`
CREATE TABLE `hub_lesson_type` (
  `HASH_KEY` binary(64) NOT NULL,
  `LOAD_DATE` datetime NOT NULL,
  `RECORD_SOURCE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Создание таблицы `hub_room`
CREATE TABLE `hub_room` (
  `HASH_KEY` binary(64) NOT NULL,
  `LOAD_DATE` datetime NOT NULL,
  `RECORD_SOURCE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Создание таблицы `hub_student_group`
CREATE TABLE `hub_student_group` (
  `HASH_KEY` binary(64) NOT NULL,
  `LOAD_DATE` datetime NOT NULL,
  `RECORD_SOURCE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Создание таблицы `hub_study_period`
CREATE TABLE `hub_study_period` (
  `HASH_KEY` binary(64) NOT NULL,
  `LOAD_DATE` datetime NOT NULL,
  `RECORD_SOURCE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Создание таблицы `hub_study_period_group`
CREATE TABLE `hub_study_period_group` (
  `HASH_KEY` binary(64) NOT NULL,
  `LOAD_DATE` datetime NOT NULL,
  `RECORD_SOURCE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Создание таблицы `hub_subject`
CREATE TABLE `hub_subject` (
  `HASH_KEY` binary(64) NOT NULL,
  `LOAD_DATE` datetime NOT NULL,
  `RECORD_SOURCE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Создание таблицы `link_lesson`
CREATE TABLE `link_lesson` (
  `HASH_KEY` binary(64) NOT NULL,
  `LOAD_DATE` datetime NOT NULL,
  `RECORD_SOURCE` varchar(255) NOT NULL,
  `HUB_TEACHER_ID` int(11) NOT NULL,
  `HUB_STUDENT_GROUP_ID` int(11) NOT NULL,
  `HUB_SUBJECT_ID` int(11) NOT NULL,
  `HUB_ROOM_ID` int(11) NOT NULL,
  `HUB_STUDY_PERIOD_ID` int(11) NOT NULL,
  `HUB_LESSON_TYPE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Создание таблицы `link_study_period_stricture`
CREATE TABLE `link_study_period_stricture` (
  `HASH_KEY` binary(64) NOT NULL,
  `LOAD_DATE` datetime NOT NULL,
  `RECORD_SOURCE` varchar(255) NOT NULL,
  `HUB_STUDY_PERIOD_ID` int(11) NOT NULL,
  `HUB_STUDY_PERIOD_GROUP_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Создание таблицы `sat_lesson`
CREATE TABLE `sat_lesson` (
  `DATETIME_START` datetime NOT NULL,
  `DATETIME_END` datetime NOT NULL,
  `LINK_LESSON_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Создание таблицы `sat_lesson_type`
CREATE TABLE `sat_lesson_type` (
  `LOAD_DATE` datetime NOT NULL,
  `RECORD_SOURCE` varchar(255) NOT NULL,
  `NAME` varchar(31) NOT NULL,
  `HUB_LESSON_TYPE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Создание таблицы `sat_room`
CREATE TABLE `sat_room` (
  `NUMBER` varchar(31) COLLATE utf8_bin NOT NULL,
  `ADDRES` varchar(255) COLLATE utf8_bin NOT NULL,
  `HUB_ROOM_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- Создание таблицы `sat_student_group`

CREATE TABLE `sat_student_group` (
  `NAME` varchar(63) COLLATE utf8_bin NOT NULL,
  `HUB_GROUP_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Создание таблицы `sat_study_period`
CREATE TABLE `sat_study_period` (
  `LOAD_DATE` datetime NOT NULL,
  `RECORD_SOURCE` varchar(255) NOT NULL,
  `DATE_START` date NOT NULL,
  `DATE_END` date NOT NULL,
  `IS_HOLYDAYS` tinyint(1) NOT NULL,
  `NAME` varchar(31) NOT NULL,
  `HUB_STUDY_PERIOD_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Создание таблицы `sat_study_period_group`
CREATE TABLE `sat_study_period_group` (
  `LOAD_DATE` datetime NOT NULL,
  `RECORD_SOURCE` varchar(255) NOT NULL,
  `NAME` varchar(31) NOT NULL,
  `HUB_STUDY_PERIOD_GROUP_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Создание таблицы `sat_subject`
CREATE TABLE `sat_subject` (
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `HUB_SUBJECT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Добавление индексов таблиц
-- Индексы таблицы `hub_lesson_type`
ALTER TABLE `hub_lesson_type`
  ADD PRIMARY KEY (`HASH_KEY`);

-- Индексы таблицы `hub_room`
ALTER TABLE `hub_room`
  ADD PRIMARY KEY (`HASH_KEY`);

-- Индексы таблицы `hub_student_group`
ALTER TABLE `hub_student_group`
  ADD PRIMARY KEY (`HASH_KEY`);

-- Индексы таблицы `hub_study_period`
ALTER TABLE `hub_study_period`
  ADD PRIMARY KEY (`HASH_KEY`);

-- Индексы таблицы `hub_study_period_group`
ALTER TABLE `hub_study_period_group`
  ADD PRIMARY KEY (`HASH_KEY`);

-- Индексы таблицы `hub_subject`
ALTER TABLE `hub_subject`
  ADD PRIMARY KEY (`HASH_KEY`);

-- Индексы таблицы `link_lesson`
ALTER TABLE `link_lesson`
  ADD PRIMARY KEY (`HASH_KEY`),
  ADD KEY `HUB_STUDENT_GROUP_ID` (`HUB_STUDENT_GROUP_ID`),
  ADD KEY `HUB_SUBJECT_ID` (`HUB_SUBJECT_ID`),
  ADD KEY `HUB_ROOM_ID` (`HUB_ROOM_ID`),
  ADD KEY `HUB_TEACHER_ID` (`HUB_TEACHER_ID`),
  ADD KEY `HUB_STUDY_PERIOD_ID` (`HUB_STUDY_PERIOD_ID`),
  ADD KEY `HUB_LESSON_TYPE_ID` (`HUB_LESSON_TYPE_ID`);

-- Индексы таблицы `link_study_period_stricture`
ALTER TABLE `link_study_period_stricture`
  ADD PRIMARY KEY (`HASH_KEY`),
  ADD KEY `HUB_STUDY_PERIOD_ID` (`HUB_STUDY_PERIOD_ID`),
  ADD KEY `HUB_STUDY_PERIOD_GROUP_ID` (`HUB_STUDY_PERIOD_GROUP_ID`);

-- Индексы таблицы `sat_lesson`
ALTER TABLE `sat_lesson`
  ADD KEY `STUDENT_GROUP_ID` (`LINK_LESSON_ID`);

-- Индексы таблицы `sat_lesson_type`
ALTER TABLE `sat_lesson_type`
  ADD KEY `HUB_LESSON_TYPE_ID` (`HUB_LESSON_TYPE_ID`);

-- Индексы таблицы `sat_room`
ALTER TABLE `sat_room`
  ADD KEY `hub_room` (`HUB_ROOM_ID`);

-- Индексы таблицы `sat_student_group`
ALTER TABLE `sat_student_group`
  ADD KEY `HUB_STUDENT_GROUP_ID` (`HUB_GROUP_ID`);

-- Индексы таблицы `sat_study_period`
ALTER TABLE `sat_study_period`
  ADD KEY `HUB_STUDY_PERIOD_ID` (`HUB_STUDY_PERIOD_ID`);

-- Индексы таблицы `sat_study_period_group`
ALTER TABLE `sat_study_period_group`
  ADD KEY `HUB_STUDY_PERIOD_GROUP_ID` (`HUB_STUDY_PERIOD_GROUP_ID`);

-- Индексы таблицы `sat_subject`
ALTER TABLE `sat_subject`
  ADD KEY `HUB_SUBJECT_ID` (`HUB_SUBJECT_ID`);
COMMIT;

-- ОГРАНИЧЕНИЯ ВНЕШНИХ КЛЮЧЕЙ НЕ ЗАДАНЫ
