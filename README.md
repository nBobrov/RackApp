# RackApp
 Минималистичное Rack приложение.
 
 URL: GET /time (возвращает время в заданном формате) 
 
 Доступные форматы времени: year, month, day, hour, minute, second
 
 Форматы передаются в параметре строки запроса format в любом порядке, например:
 /time?format=year%2Cmonth%2Cday
 
 Если среди форматов времени присутствует неизвестный формат, то возвращается ответ с кодом статуса 400 и телом "Unknown time format [epoch]".
 Если неизвестных форматов несколько, то все они указываются в теле ответа, например: "Unknown time format [epoch, age]".
 
 При запросе на любой другой URL возвращается ответ с кодом статуса 404
