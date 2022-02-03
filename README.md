# Odessos
Atonomous sailboat



Панаир на науката и иновациите 2022



ТЕМА НА ПРОЕКТА

Одесос – Платноходка с автопилот

Автори:

Иван Мирославов Димитров МГ„Д-р Петър Берон“ Варна 12 клас
Цветослав Валентинов Мавродиев МГ„Д-р Петър Берон“ Варна 12 клас
(трите имена, училище, град, клас)
Научен ръководител (консултант):
Атанас Атанасов, Ментор
Елеонора Павлова, Зам. Директор, МГ„Д-р Петър Берон“
 (име, фамилия, длъжност, месторабота)




Съдържание

Резюме                                                                                                             3
Изложение										      4
	Увод                                                                                                                 4
	 Цели на “Одесос“		  						      4
	Описание на проекта                                                                    	      5
	 Хардуерно описание							                5
	 Софтуерно описание				         			                9
	ML (Machine Learning)							      9
	Симулация									    10
	3D модел									    14
	Уеб сайт									    15
	Партньори и спонсори								    17
	Заключение										    18
	 Използвани технологии							    18
	 Бъдещо развитие                                                                                  19				
 
Резюме
	Проектът „Одесос“ представлява IoT (Internet of Things) платноходка с автопилот. Той е предназначен за пренасяне на товари и изследване на водата. “Одесос“ ще даде възмозможност за изцяло автоматизирано дистанционно пренасяне на стоки по вода по напълно екологичен начин. Чрез автопилота на платноходката няма да има нужда от екипаж. Така „Одесос“ има възможността да пренася стоки евтино и лесно от една точка до друга, като единственото изискване е наличието на вятър. Платноходката ще се движи чрез няколко автоматизирани ситеми. Има специална карта, чрез която лесно да се следи маршрута й. “Одесос” ще може да бъде използван от много от компаниите изпълняващи доставки по вода.


Summary
“Odessos” is an IoT (Internet of Things) sailboat with autopilot. It is designed to carry loads and research and test the water. “Odessos” will enable fully automated remote transport of goods by water in a completely environmentally friendly way. There will be no need of a crew on the sailboat's autopilot. Thus, “Odessos” has the ability to transport goods cheaply and easily from one point to another, with the only requirement being the presence of wind. The sailboat will sail with the help of several automated systems. There is a special map with which will be easy follow its route. Many of the companies performing transport of goods by water can use „Odessos“. 
Изложение

	Увод

	 Цели на „Одесос“
Автономната платноходка „Одесос“ е IoT (Internet of Things). Тя има за цел да превозва стоки и товари по вода по евтин и екологичен начин. Тя би била полезна за куриерски, транспортни и логистични компании, изследване на водата, както и за пренос на малки товари до кораби, които са заседнали или нямат възможност да акустират.  „Одесос“ е умален вариант на състезателния клас 420, който е автоматизиран чрез няколко системи и ML(Machine Learning) и не се нуждае от човек на борда. Проектът ще има проследяваща система на платноходките във всяко едно време. „Одесос“ цели да се намали употребата на двигатели и отделянето на вредни емисии, както и да популяризира еко транспорта. Употребата на нашия проект ще даде нов поглед върху транспорта по вода.
 
	Описание на проекта
	 Хардуерно описание

 

За да реализираме „Одесос“, използваме умалена версия на платноходка клас 420 с дължина 1 метър. Тя се състои от няколко основни части:
• Корпус на лодка;
• Рул;
• Шверт/Кил;
• Гик;
• Мачта;
• Платна;
Движението на тези части е необходимо, за да се придвижва платноходката. Ние автоматизираме движението им чрез няколко системи.

	Захранване на прототипа

Захранването на „Одесос“ се осъществава от батерия 3 Ah и 4 соларни панела. При постоянната работа на всяка една от системите по платнодката захранването ще и стигне за 1 час.





	SIM-card & GPS Module
За постоянната геолокализация и връзка с лодката използваме SIM7600G-H – DONGLE за SIM-card и GPS модул. Това ни дава възможност да знаем къде се намира платнодката във всеки един момент.





	Жироскоп и акселерометър

Жироскопа позволява да изчисляването на наклона на платноходката, а акселерометъра, за да разберем нейнотото ускорение.




	Система за управление на руля

За задвижването на руля използваме сервомотор закрепен за кармата на корпуса на платноходката. При завъртането на сервомотора се завърта и руля в необходимата посока.








	Система за определяне на положението на гика
Измерването на ъгъла на гика се определя чрез сервомотор, който е прикрепен към мачтата и към гика. Когато гикът се завърта, сервомоторът също се завърта. Това ще ни позволява да отчитаме какво е неговото положение и това на платната.


	Система за балансиране


За системата за контрол на баланса използваме релса, по която ще се движи тежест.  Тежестта ще бъде задвижвана чрез стъпков мотор. При промяна на наклона на платноходката отчитана от жироскопа, тежестта се предвижва по такъв начин, че да уравновеси платноходката. 



	Система за движение на гика

За да преместим платната, трябва да преместим гика. Това става чрез система от макари и електрически мотор, който навива и развива въжето, което го натяга. По този начин гикът може да поставя платната в оптимално положение спрямо вятъра.





	Система за измерване на вятъра
За измерване на скоростта на вятъра ще използваме анемометър и индикатор за посоката на вятъра. Системата ще бъде позиционирана в горната част на мачтата. Данните, получени от нея, е много важно да бъдат точни, защото те са най-важните за определяне на движението на платноходката.
Към момента сме разработили наш ветропоказател с магнит и сензор на Хол закрепен за ветропоказателя, чрез които лесно намираме посоката на вятъра.

	Платна, гик и мачта


Платната са ушити по наш дизайн и мерки за нашите нужди, а гикът и мачтата са направени от куха карбонова пръчка с диаметър 8 мм.
 
	 Софтуерно описание
	ML (Machine Learning)
„Одесос“ няма да бъде единственото превозно средство във водата. За тази цел трябва да се вземат предвид всички други плавателни съдове от моторни лодки до танкери, както и други препядствия.
За целта направихме ML (Machine Learning) по модела YOLO, който няма да пренатоварва платката, която ще се намира на „Одесос“ (към момента използваме raspberry pi4). Не се нуждаем от модел, който открива много обекти на frame, защото броят им в морето е малък и YOLO отговаря на нашите изисквания.
В момента моделът е обучен с  dataset от 25 000 снимки с различни плавателни съдове. Точността му в момента не е достатъчна за да поркие изискванията ни, но ще се подобри след повече тренировки.
За подобряване на засичането на обекти във водата може да бъде използван също така и LiDAR по препоръка на капитан І ранг професор доктор Мирослав Йорданов Цветков при една от нашите консултации. Това ще позволява по-лесното им откриване в условия, в които камерата няма да бъде напълно функционална (като например: вечерно време, високо вълнение или силна мъгла).
Тук можете да видите два от резултатите след изпробване на модела.


 
	Симулация

Първа симулация
 
За да покажем, че движението на лодката е осъществимо в условия близки до реалните, направихме симулация. С произволно генерирани островни зони, крайбрежие и преминаващи кораби създаваме препятствия, които лодката трябва да заобиколи.
Целта е лодката да може да пътува по персонализиран маршрут от брега до други точки на генерираната карта.
Как се движи платноходката:
	В случай на попътен вятър, платноходката намира директния път до точката, до която трябва да достигне, като заобикаля евентуални препятствия по най-краткия път, по преференция подветрено;
	В случай на насрещен вятър, платноходката трябва да прави повороти, т.е. да прави завои, движейки се на зигзаг срещу вятъра;
	Платноходката избягва сушата и движещи се обекти, като преправя  маршрута си;
Основните фактори за движението на лодката са:
	Посока и скоростта на вятъра и на движение на лодката;
	Посока и скоростта на течението;
	Местоположението на препятствията спрямо платноходката;

Формули за изчисляване на движението, използвани в симулацията:
	Максимална товаримост;
W_MAX=ρ.V_MAX-M
M = собствена маса на платноходката [kg]
V = обем на водоизместване на лодката [m3]
ρ = 1025, плъстност на морката вода [kg/m3]
WMAX = максимална маса на товар [kg]
	Относителна посока на вятъра
(V_A ) ⃗=(V_T ) ⃗-(V_B ) ⃗
VA = вектор на относителната посока на вятъра
VT = вектор на истинската посока на вятъра
VB = вектор на движението на лодката
	Хидро- и аеродинамично съпротивление;
F_H=1/2*C_H*ρ*V_B^2
F_A=1/2*C_A*ρ*V_A^2
	Ускорение;
F-R=a.(M+W)
F = движеща сила (образувана от подемната сила на платната) [N]
R = сила на съпротивление (FH + FA) [N]

Алгоритъм за заобикаляне на препятствията:
	Проверява се от коя страна на препятствието може да се заобиколи по най-краткия път;
	Ако е възможно да се заобиколи подветрено, се избира тази опция;
	Повороти се правят, за да се избегнат близки препятствия пред лодката или при изчакване на възможност за изчисляване на безопасен маршрут;

При стартиране на симулацията, се генерира произволен терен и начална точка на платноходката близо до брега. Избираме чрез десен бутон на мишката точки от картата, през които да премине платноходката в реда на избирането им.
След избиране на маршрута даваме начало на хода на лодката чрез бутона „Start“. В горната част на екрана се намира панел съдържащ информация за посоката и скоростта на вятъра и течението, които са генерирани отново на произволен принцип. Симулацията може да работи и със събрани данни от сайта на дирекция „Ръководство на корабния трафик – Черно море“. В панела също имаме възможност да променим тежестта на товара, както и да видим скоростта на платноходката. Освен всички тези данни се изобразява и ъгъла на платната във всеки един момент.
Остава само да изчакаме лодката да премине успешно през посочения маршрут.



Втора симулация

След събрания опит и резултати от първата симулация, направихме втора, която да постави прототипа в доста по реалистични условия.
Този път вече използваме карта на варненския залив и езеро, където ще се осъществяват и реалните тестове на платноходката. Бяха ни предоставени данните за вятъра и течението за региона от  директора на Института по океанология към БАН доц. д-р Николай Николаев Вълчев, при консултация с него. Данните вкарахме в грид, но бяха на големи разстояния затова направихме интерпулация. Това позволи за много точно илюстриране на движението на платноходката и да се разбере какво растояние би изминала тя в реалност.
За пресмятане на маршрута, по който да се движи използваме алгоритъма „а звезда“ с изменена евристика. Принципът на съобразяване с посоката на вятъра и движещи се обекти е частично взаимстван от първата симулация.
Самата платноходка е изобразена чрез иконка, а нейната посока, както и тази на платната са изнесени в долния десен ъгъл. При нейното движение тя оставя след себе си пунктир показващ траекторията, която е използвала за да достигне до всяка една от точките поставени по маршрута.
Настоящата подобрена симулация може да бъде видоизменена и да се превърне в основен модул в наземния контрол на платноходката.




 
	3D модел на „Одесос“
Направихме прототипен 3D модел на платноходката (в ляво), който след дълга обработка се превърна в моделът за 3D принтиране (в дясно).

Моделът беше 3D принтиран боядисан и покрит с фибростъкло и смола. По-долу можете да видите негова снимка. 


	Уеб сайт
„Одесос“ има и собствен сайт. Сайтът на проекта е информативен, като неговата цел е да покаже на кратко какво представлява. Към сайта има и тракинг система, чрез която ще могат да бъдат проследявани в реално време всички платноходки. Това би олеснило много внедряването на проекта в различни сфери. При поставяне на мишката върху иконата на платноходката могат на бъдат видени данни за нея (към момента нейната локация, а след поставянето на нужните сензори и екипировка за изледване на водите и дъното ще бъдат добавени и други).
Tracking системата може да бъде достъпена със следния тест акаунт:
Username: innofair	Password: PanairNaNaukata2022
Към момента сайтът е без responsive design и може да бъде намерен на адрес:
https://odessos.ml

 
 
 
	Партньори и спонсори

Проектът „Одесос“ се развива благодарение на:
	Нашите партньори
	Висше военоморско училище „Никола Йонков Вапцаров“
 
	Институтът по океанология към БАН
 


	Нашите спонсори
	Ardes.bg
 
	KINETIK Automotive
 


 
	Заключение

	 Използвани технологии
	Python и TensorFlow – за ML (Machine learning) моделът YOLO и неговото трениране;
	Blender и Autodesk Fusion 360– за изграждане на 3D моделът на „Одесос“;
	Godot и GDScript – за направата на симулацията;
	RaspberryPi4 – платка за тестове;
	Unreal Engine – за симулиран терен на вода с вълненине и тестове на 3D модела;
	MapBox – за напрана на картата;
	HTML5, CSS3, JavaScript и jQuery – за frontend на сайта;
	PHP – за backend на сайта;
	SQL – за бази от данни;
	KiCad и LTspice XVII – за проектиране и анализ на печатна платка;
 
	 Бъдещо развитие
	Подобряване на съвместната работа на системите;
	Оптимизация на ML (Machine Learning);
	Моделиране и печат на платка;
	Поставяне на сензори с цел изледвания съвместно с Институт по океанология към БАН;
	Автономно първо плаване; 
	Изготвяне на responsive design;

„Одесос” се разработва, за да е един от най-добрите начини за транспортиране на товари с малко тегло по икономичен и ефективен начин. Проектът ще намери употреба и в изследователска дейност в сферите на океанологията, екологията, метеорологията и много други. „Одесос“ има пълен потенциал да бъде не само екологичен логистичен проект, но и водещ начин за провеждане на изследвания на водата и дъното на водни басейни, инспектиране на трудно достъпни зони и транспортирането на малки товари и апаратура. Иновативния и нестандартен подход към подобни задачи ще хвърли нова светлина върху възможностите на водния транспорт и ще популяризира ветроходния спорт в България.
