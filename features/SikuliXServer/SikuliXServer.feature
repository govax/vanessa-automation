# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnWeb
@IgnoreOnFastCheck
@IgnoreOnUFSovm82Builds
@IgnoreOn836
@IgnoreOn837
@IgnoreOn838
@IgnoreOn839


@tree


Функциональность: Проверка работы SikulX сервера (SikulX server)


Сценарий: Вывод ошибки при падении скрипта
	Дано Я закрыл все окна клиентского приложения
	И я закрываю сеанс TESTCLIENT
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	Когда Я открываю VanessaAutomation в режиме TestClient со стандартной библиотекой
	И я устанавливаю настройки SikuliX сервера
	
	И я перехожу к закладке "Сервис"
	И я перехожу к закладке "Отчет о запуске сценариев"
	И я изменяю флаг 'Формировать скриншот при ошибке'
	И я изменяю флаг 'Снимать скриншот каждого окна 1С'
	И В открытой форме в поле "Команда создания скриншотов" я ввожу команду для IrfanView 
	И в поле каталог скриншотов я указываю путь к относительному каталогу "tools\ScreenShotsTest"
	И я перехожу к закладке "Запуск сценариев"
	
	
	И я перехожу к закладке "Основные"
	И я перехожу к закладке "Запуск сценариев"

	И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ФичаДляПроверкиОшибкиSikuliXServer"
	И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Automation TestClient
	И Я нажимаю на кнопку выполнить сценарии в Vanessa-Automation TestClient
	
	И     элемент формы с именем "Статистика" стал равен '1/1/1, 0/1/0'
	И в таблице "ДеревоТестов" я перехожу к строке:
		| 'Наименование'                                                |
		| 'Затем я выполняю скрипт SikuliX "ClickToVspomogatelnayaTab"' |
	И в таблице "ДеревоТестов" я выбираю текущую строку
	Тогда открылось окно 'Детали ошибки'
	Тогда значение поля с именем "ТекстОшибки" содержит текст "FindFailed"
	И Я закрываю окно 'Детали ошибки'
	
Сценарий: Запуск простого скрипта SikulX через SikulX server
	Дано Я закрыл все окна клиентского приложения
	И я закрываю сеанс TESTCLIENT
	Когда я запускаю служебный сеанс TestClient с ключом TestManager в той же базе
	Дано Я закрыл все окна клиентского приложения

	Когда Я открываю VanessaAutomation в режиме TestClient со стандартной библиотекой
	
	И я устанавливаю настройки SikuliX сервера
	
	И я перехожу к закладке "Основные"
	И я перехожу к закладке "Запуск сценариев"
	
	
	
	
	И я загружаю служебную фичу и устанавливаю настройки
			И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ФичаДляПроверкиSikuliXServer"
			И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Automation TestClient
			И Я нажимаю на кнопку выполнить сценарии в Vanessa-Automation TestClient
			
	И в таблице "ДеревоТестов" я разворачиваю строку:
		| 'Наименование'                                                                |
		| 'Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий' |
	И в таблице "ДеревоТестов" я разворачиваю строку:
		| 'Наименование'                              |
		| 'И в таблице "Список" я перехожу к строке:' |
		
	Тогда таблица "ДеревоТестов" стала равной:
		| 'Наименование'                                                                | 'Статус'  |
		| 'ФичаДляПроверкиSikuliXServer.feature'                                        | ''        |
		| 'ФичаДляПроверкиSikuliXServer'                                                | ''        |
		| 'Для ФичаДляПроверкиSikuliXServer'                                            | 'Success' |
		| 'Когда я удаляю все элементы Справочника "Справочник1"'                       | 'Success' |
		| 'Когда я удаляю все элементы Справочника "Справочник2"'                       | 'Success' |
		| 'Когда я создаю fixtures по макету "Макет"'                                   | 'Success' |
		| 'Дано Я закрыл все окна клиентского приложения'                               | 'Success' |
		| 'И я закрываю сеанс TESTCLIENT'                                               | 'Success' |
		| 'Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий' | ''        |
		| 'Дано Я открыл новый сеанс TestClient или подключил уже существующий'         | 'Success' |
		| 'И    Я закрыл все окна клиентского приложения'                               | 'Success' |
		| 'И В командном интерфейсе я выбираю \'Основная\' \'Справочник1\''             | 'Success' |
		| 'Тогда открылось окно \'Справочник1\''                                        | 'Success' |
		| 'И в таблице "Список" я перехожу к строке:'                                   | 'Success' |
		| '\| \'Наименование\'       \|'                                                | ''        |
		| '\| \'Тестовый Элемент 2\' \|'                                                | ''        |
		| 'И в таблице "Список" я выбираю текущую строку'                               | 'Success' |
		| 'Тогда открылось окно \'Тестовый Элемент 2*\''                                | 'Success' |
		| 'Затем клик на картинку "Вспомогательная"'                                    | 'Success' |
		| 'Затем клик на картинку "Основа"'                                             | 'Success' |
		| 'Затем я выполняю скрипт SikuliX "ClickToVspomogatelnayaTab"'                 | 'Success' |
		| 'Затем клик на картинку "Проверка кнопок"'                                    | 'Success' |


	
	

	
Сценарий: Закрыть TestClient, который был открыт из второго TestManager. Запуск простого скрипта SikulX через SikulX server.
	Когда я запускаю служебный сеанс TestClient с ключом TestManager в той же базе
	Дано Я закрыл все окна клиентского приложения кроме "*Vanessa Automation"
	И я загружаю служебную фичу и устанавливаю настройки
			И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ЗакрытьПодключенныйTestClient"
			И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Automation TestClient
			И Я нажимаю на кнопку выполнить сценарии в Vanessa-Automation TestClient
			И у элемента "Сценарии выполнены" я жду значения "Да" в течение 20 секунд
	И я закрываю TestClient "TM"	