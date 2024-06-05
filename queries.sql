--  1
/*
Используем агрегирующую функцию COUNT() для расчета
числа покупателей. Дополнительно прописал DISTINCT
на случай, если в справочнике будут дублирующие значения,
но результат для COUNT() и COUNT(DISTINCT) в данном случае
не отличается
*/

SELECT COUNT(DISTINCT customer_id) AS "customers_count"
FROM customers

--  2
/*
Джоиним два необходимых справочника employees и products по ключам
employee_id и product_id соответственно на "таблицу фактов" sales, после чего
создаем три поля: конкатинированное поле с именем и фамилией, число операций
и сумму выручки (округляем значения до целых через FLOOR()) как произведение
цены конкретного продукта на его количество. Группируем информацию по
продавцам через GROUP BY, отображаем по убыванию выручки.
*/

-- 3
/*
Аналогично предыдущему запросу делаем джоины, но на этот раз делаем агрегацию
по средней выручке продавца. Пишем "условие" того, что средняя выручка
конкретного продавца меньше средней выручки по всем продавцам через подзапрос
в HAVING, так как "работаем" с агрегированной функцией AVG().
Округляем значения до целых через FLOOR().
*/

--4
/*
Аналогично собираем таблицу из справочников и таблицы-факта, конвертируем дату в
имена дней недели, группируем по имени продавца и дню недели, сортируем
по тем же полям в прямом порядке.
UPD: сортировка была некорректна, т.к. приводила к сортировке
в алфавитном порядке. Изменено на to_char(s.sale_date, 'ID')
- конвертация даты в дни недели в ISO-формате.
*/

--5
/*
Через CASE прописываем условие для дифференциации покупателей по возрастным
группам (с учетом того, что BETWEEN включает в себя оба "края"),
считаем количество строк при группироке по возрастной
группе.
*/

--6
/*
Через джоины собираем таблицу из таблицы фактов и двух справочников,
а после SELECT'ом выбираем три поля: 1) дату в формате YYYY-MM,
2) число уникальных покупателей через COUNT(DISTINCT),
3) выручка как цена за единицу товара на количество проданных штук
с округлением до целых.
*/

--7
/*
Оконными функциями ищем "первые вхождения" промоционных товаров и соотв. дату.
Обертка в CTE для удобства написания запроса :)
*/
