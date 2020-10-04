-- Создание таблиц
-- Создание таблицы `lesson`
CREATE TABLE `lesson` (
  `ID` int(11) NOT NULL,
  `DATETIME_START` datetime NOT NULL,
  `DATETIME_END` datetime NOT NULL,
  `STUDENT_GROUP_ID` int(11) NOT NULL,
  `SUBJECT_ID` int(11) NOT NULL,
  `ROOM_ID` int(11) NOT NULL,
  `STUDY_PERIOD_ID` int(11) NOT NULL,
  `LESSON_TYPE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Создание таблицы `lesson_type`
CREATE TABLE `lesson_type` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(31) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Создание таблицы `room`
CREATE TABLE `room` (
  `ID` int(11) NOT NULL,
  `NUMBER` varchar(31) COLLATE utf8_bin NOT NULL,
  `ADDRES` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Создание таблицы `strudent_group`
CREATE TABLE `strudent_group` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(63) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Создание таблицы `study_period`
CREATE TABLE `study_period` (
  `ID` int(11) NOT NULL,
  `DATE_START` date NOT NULL,
  `DATE_END` date NOT NULL,
  `IS_HOLYDAYS` tinyint(1) NOT NULL,
  `NAME` varchar(31) COLLATE utf8_bin NOT NULL,
  `GROUP_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Создание таблицы `study_period_group`
CREATE TABLE `study_period_group` (
  `ID` int(11) NOT NULL,
  `NAME` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Создание таблицы `subject`
CREATE TABLE `subject` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `IS_NESSESARY` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Добавление индексов таблиц
-- Индексы таблицы `lesson`
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `STUDENT_GROUP_ID` (`STUDENT_GROUP_ID`),
  ADD KEY `SUBJECT_ID` (`SUBJECT_ID`),
  ADD KEY `ROOM_ID` (`ROOM_ID`),
  ADD KEY `STUDY_PERIOD_ID` (`STUDY_PERIOD_ID`),
  ADD KEY `LESSON_TYPE_ID` (`LESSON_TYPE_ID`);

-- Индексы таблицы `lesson_type`
ALTER TABLE `lesson_type`
  ADD PRIMARY KEY (`ID`);

-- Индексы таблицы `room`
ALTER TABLE `room`
  ADD PRIMARY KEY (`ID`);

-- Индексы таблицы `strudent_group`
ALTER TABLE `strudent_group`
  ADD PRIMARY KEY (`ID`);

-- Индексы таблицы `study_period`
ALTER TABLE `study_period`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GROUP_ID` (`GROUP_ID`);

-- Индексы таблицы `study_period_group`
ALTER TABLE `study_period_group`
  ADD PRIMARY KEY (`ID`);

-- Индексы таблицы `subject`
ALTER TABLE `subject`
  ADD PRIMARY KEY (`ID`);

-- AUTO_INCREMENT для таблиц
-- AUTO_INCREMENT для таблицы `lesson`
ALTER TABLE `lesson`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT для таблицы `lesson_type`
ALTER TABLE `lesson_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT для таблицы `room`
ALTER TABLE `room`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT для таблицы `strudent_group`
ALTER TABLE `strudent_group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT для таблицы `study_period`
ALTER TABLE `study_period`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT для таблицы `study_period_group`
ALTER TABLE `study_period_group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT для таблицы `subject`
ALTER TABLE `subject`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

-- Задание ограничений внешнених ключей для таблиц
-- Ограничения внешнего ключа таблицы `lesson`
ALTER TABLE `lesson`
  ADD CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`ROOM_ID`) REFERENCES `room` (`ID`),
  ADD CONSTRAINT `lesson_ibfk_2` FOREIGN KEY (`STUDENT_GROUP_ID`) REFERENCES `strudent_group` (`ID`),
  ADD CONSTRAINT `lesson_ibfk_3` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subject` (`ID`),
  ADD CONSTRAINT `lesson_ibfk_5` FOREIGN KEY (`STUDY_PERIOD_ID`) REFERENCES `study_period` (`ID`),
  ADD CONSTRAINT `lesson_ibfk_6` FOREIGN KEY (`LESSON_TYPE_ID`) REFERENCES `lesson_type` (`ID`);

-- Ограничения внешнего ключа таблицы `study_period`
ALTER TABLE `study_period`
  ADD CONSTRAINT `study_period_ibfk_1` FOREIGN KEY (`GROUP_ID`) REFERENCES `study_period_group` (`ID`);
