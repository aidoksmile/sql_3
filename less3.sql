CREATE DATABASE IF NOT EXISTS less3;
USE less3;

CREATE TABLE IF NOT EXISTS `staff`
(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `firs_tname` VARCHAR(45),
    `last_name` VARCHAR(45),
    `post`  VARCHAR(45),
    `senioriity` INT,
    `salary` INT,
    `age` INT
);

INSERT INTO `staff` (`firs_tname`, `last_name`, `post`, `senioriity`, `salary`,`age`)
VALUES
	('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
	('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
	('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
	('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);	
    
SELECT * FROM `staff`;
    
SELECT post, salary
FROM staff
ORDER BY salary;
    
SELECT firs_tname, age
FROM staff
ORDER BY firs_tname DESC;

SELECT firs_tname, last_name, age
FROM staff
ORDER BY firs_tname DESC, last_name DESC;

SELECT DISTINCT last_name
FROM staff;

SELECT *
FROM staff
ORDER BY id DESC
LIMIT 2;

SELECT *
FROM staff
LIMIT 4, 3;

SELECT *
FROM staff
ORDER BY id DESC
LIMIT 2;

SELECT *
FROM (SELECT *
FROM staff
ORDER BY id DESC
LIMIT 2, 3) t
ORDER BY id;

SELECT 
	post,
	SUM(salary) AS "Суммарная ЗП сотрудников",
    AVG(salary) AS "Средняя ЗП сотрудников",
    MAX(salary) AS "Макс ЗП среди сотрудников",
    MIN(salary) AS  "Мин ЗП среди сотрудников",
    COUNT(salary) AS "Количество сотрудников"
FROM staff
GROUP BY post;

SELECT
	CASE
		WHEN age < 20 THEN "Младше 20 лет"
        WHEN age BETWEEN 20 AND 40 THEN "От 20 до 40 лет"
        ELSE "Старше 40 лет"
	END AS name_age,
    SUM(salary)
FROM staff
GROUP BY name_age;

SELECT 
	post, 
	SUM(salary) AS "Суммарная ЗП сотрудников"
FROM staff
GROUP BY post
HAVING SUM(salary) > 150000;

SELECT 
	post, 
	SUM(salary) AS "Суммарная ЗП сотрудников"
FROM staff
WHERE post != "Начальник" 
GROUP BY post
HAVING SUM(salary) > 150000;

SELECT 
	post, 
	SUM(salary) AS "Суммарная ЗП сотрудников"
FROM staff
WHERE post NOT IN ("Начальник", "Рабочий")
GROUP BY post
HAVING SUM(salary) > 150000;

-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
SELECT *
FROM staff
ORDER BY salary;

SELECT *
FROM staff
ORDER BY salary DESC;
 
-- 2. Выведите 5 максимальных заработных плат (saraly)
SELECT *
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT 
	post,
	SUM(salary) AS "Суммарная ЗП сотрудников"
FROM staff
GROUP BY post;

-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT
	post,
    COUNT(*) AS "Количество сотрудников"
FROM staff
WHERE post = "Рабочий" AND age BETWEEN 24 AND 49;

-- 5. Найдите количество специальностей
SELECT 
	COUNT(post) AS "Количество специальностей"
FROM (SELECT DISTINCT post 
FROM staff) t;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
SELECT 
	post
FROM staff
GROUP BY post
HAVING AVG(age) < 30;

SELECT 
	post,
    AVG(age)
FROM staff
GROUP BY post; -- проверка