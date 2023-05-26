﻿#language: ru



Функционал: создание документа Поступление товаров		

Как Менеджер по закупкам я хочу
создание документа постепление товаров
чтобы поставить товар на учет

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий:создание документа поступление товаров
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И  В командном интерфейсе я выбираю "Покупка" "Поступления ТМЗ и услуг"
	Тогда открылось окно 'Поступления ТМЗ и услуг'
	И я нажимаю на кнопку с именем 'СоздатьПоступлениеТовары'
	Тогда открылось окно 'Поступление ТМЗ и услуг: Товары. Новый'
	И я нажимаю кнопку выбора у поля с именем "СтруктурноеПодразделениеОрганизация"
	Тогда открылось окно 'Структурные подразделения'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ТОО "ITOUR"'
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Поступление ТМЗ и услуг: Товары. Новый *'
	И из выпадающего списка с именем "Контрагент" я выбираю точное значение 'Жексенбекова Алмагул Кайсаровна'
	И из выпадающего списка "Склад" я выбираю точное значение "Основной склад"
* Заполнение товарной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыНоменклатура" я выбираю точное значение 'Сумка для ноутбука Continent CC-100, 15.6", Black'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1,000'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10,000'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '2 500,00'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка заполения табличной части
	Тогда таблица "Товары" содержит строки
		| 'N' | '% НДС'   | 'Счет НДС' | 'Номенклатура'                                      | 'Количество' | 'Всего'  | 'Источник происхождения' | 'Цена'     | 'Сумма'     | 'Счет учета (БУ)' | 'Сумма НДС' | 'Счет учета (НУ)' | 'Вид оборота'  | 'Вид поступления'             |
		| '1' | '*' | ''         | 'Сумка для ноутбука Continent CC-100, 15.6", Black' | '10,000'     | '25 000' | ''                       | '2 500,00' | '25 000,00' | '1330'            | ''          | '1330Н'           | 'Общий оборот' | 'Товары, приобретенные с НДС' |
	 
	И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа
	И из выпадающего списка с именем "ВидУчетаНУ" я выбираю точное значение 'НУ'
	И я нажимаю на кнопку с именем 'ФормаПровести'
	И я жду закрытия формы "Поступления ТМЗ и услуг(создание)" в течение 20 секунд

Сценарий: проверка наличия номенклатуры
И В командном интерфейсе я выбираю 'Номенклатура и склад' 'Номенклатура'
Тогда открылось окно 'Номенклатура'
И в таблице "Список" я перехожу к строке:
	| '% НДС'   | 'Ед. изм.' | 'Код'         | 'Наименование' | 'Полное наименование' |
	| 'без НДС' | 'шт'       | '10000030789' | 'AVBK0122C2'   | 'AVBK0122C2'          |
И в таблице "Список" я активизирую поле с именем "Наименование"
И в таблице "Список" я выбираю текущую строку
И я закрываю все окна клиентского приложения
