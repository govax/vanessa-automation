# language: ru
# encoding: utf-8
#parent uf:
@UF11_Прочее
#parent ua:
@UA44_Прочая_активность_по_проверке

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnWeb

@IgnoreOn837
//т.к. в 8.3.7 исключение формируется другое

@tree


Функциональность: Проверка формирования файла json с ошибкой


	
Сценарий: Проверка формирования файла json с ошибкой
	Дано Я закрыл все окна клиентского приложения
	И я закрываю сеанс TESTCLIENT
	Когда я запускаю служебный сеанс TestClient с ключом TestManager в той же базе
	Дано    Я закрыл все окна клиентского приложения

	Когда Я открываю VanessaAutomation в режиме TestClient со стандартной библиотекой
	
	И я перехожу к закладке с именем "ГруппаНастройки"
	И я перехожу к закладке с именем "СтраницаОтчетыОЗапуске"
	
	И я устанавливаю флаг 'Формировать скриншот при ошибке'
	И в поле каталог скриншотов я указываю путь к относительному каталогу "tools\ScreenShotsTest"
	
	И я устанавливаю флаг 'Создавать JSON для каждой ошибки'
	И в поле 'Имя каталога для лога ошибок' я ввожу текст 'C:\Temp\ЛогОшибокVA'
	И я перехожу к следующему реквизиту
	И я запоминаю значение поля с именем "ИмяКаталогаЛогОшибок" как "КаталогОшибок"
	
	И я перехожу к закладке с именем "СтраницаСервисОсновные"
	И я перехожу к закладке с именем "СтраницаСкриншоты"
	И В открытой форме в поле "Команда создания скриншотов" я ввожу команду для IrfanView 
	И я перехожу к закладке "Автоинструкции"
	
	И я перехожу к закладке с именем "СтраницаСервисОсновные"
	И я перехожу к закладке "Запуск сценариев"
	
	И я загружаю служебную фичу и устанавливаю настройки
			И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ФичаДляПроверкиФормированияФайлаСОшибкой"
			И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Automation TestClient
			И Я нажимаю на кнопку выполнить сценарии в Vanessa-Automation TestClient
			
	И в каталоге файлов ошибок в json формате появился 1 файл json
	
	Если Версия платформы ">=" "8.3.15" Тогда
		И файл "$НайденноеИмяОшибкиJson$" содержит строки
			| 'Выполнить(ТекстВыражения)' |
	Иначе
		И файл "$НайденноеИмяОшибкиJson$" содержит строки
			| 'Ошибка компиляции при вычислении выражения или выполнении фрагмента кода' |
	
	

	
Сценарий: Закрыть TestClient, который был открыт из второго TestManager. Проверка формирования файла json с ошибкой
	Когда я запускаю служебный сеанс TestClient с ключом TestManager в той же базе
	Дано Я закрыл все окна клиентского приложения кроме "*Vanessa Automation"
	И я загружаю служебную фичу и устанавливаю настройки
			И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ЗакрытьПодключенныйTestClient/ЗакрытьПодключенныйTestClient"
			И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Automation TestClient
			И Я нажимаю на кнопку выполнить сценарии в Vanessa-Automation TestClient
			И у элемента "Сценарии выполнены" я жду значения "Да" в течение 20 секунд
	И я закрываю TestClient "TM"	
	И в таблице клиентов тестирования я активизирую строку 'Этот клиент'