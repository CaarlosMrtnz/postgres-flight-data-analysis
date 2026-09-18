-- 1. Escribe una consulta que recupere los Vuelos (flights) y su identificador que figuren con status On Time.

SELECT FLIGHT_ID, ROUTE_NO, STATUS
FROM FLIGHTS
WHERE STATUS = 'On Time';

-- Ejemplo salida: 11096 | PG0115 | On Time

-- 2. Escribe una consulta que extraiga todas las columnas de la tabla bookings y refleje todas las reservas que han supuesto una cantidad total mayor a 1.000.000 (Unidades monetarias).
-- Nota: las tablas son públicas de Rusia, por tanto son Rublos sus unidades monetarias

SELECT *
FROM BOOKINGS
WHERE TOTAL_AMOUNT > 1000000;

-- Ejemplo salida: 00ERLN | 2025-10-10 21:26:42 (En el caso del archivo 3m no hay ninguno superior a un millón)

-- 3. Escribe una consulta que extraiga todas las columnas de los datos de los modelos de aviones disponibles (aircraft_data). Puede que os aparezca en alguna actualización como "aircrafts_data", revisad las tablas y elegid la que corresponda.

SELECT *
FROM AIRPLANES_DATA;

-- Ejemplo salida: 32N | { "en": "Aerobus A320neo", "ru": "Аэробус A320neo" } | 6500 | 830

-- 4. Con el resultado anterior visualizado previamente, escribe una consulta que extraiga los identificadores de vuelo que han volado con un Boeing 737. (Código Modelo Avión = 733)

SELECT F.FLIGHT_ID
FROM FLIGHTS F
JOIN ROUTES R ON F.ROUTE_NO = R.ROUTE_NO
WHERE R.AIRPLANE_CODE = '7M7';

-- Como el código 733 no devolvía nada, he utilizado el código 7M7 (Boeing 737 MAX 7) para poder verificar la salida.

-- Ejemplo salida: 2

-- 5. Escribe una consulta que te muestre la información detallada de los tickets que han comprado las personas que se llaman Irina.

SELECT *
FROM TICKETS
WHERE PASSENGER_NAME ILIKE 'Irina%';

-- Ejemplo salida: 00054320059... | PIPB7A | RU 79306311590... | Irina Alekseeva | true

-- QUERIES OPCIONALES

-- 6. Mostrar las ciudades con más de un aeropuerto.

SELECT CITY, COUNT(DISTINCT AIRPORT_CODE) AS TOTAL_AEROPUERTOS
FROM AIRPORTS_DATA
GROUP BY CITY
HAVING COUNT(DISTINCT AIRPORT_CODE) > 1;

/* El problema de esta sentencia es que saca las ciudades en formato json:
{
  "en": "Aberdeen",
  "ru": "Абердин"
} 

Para solucionarlo he buscado esta forma de ejecutar la query:
*/

SELECT CITY ->> 'en' AS CITY, COUNT(DISTINCT AIRPORT_CODE) AS TOTAL_AEROPUERTOS
FROM AIRPORTS_DATA
GROUP BY CITY ->> 'en'
HAVING COUNT(DISTINCT AIRPORT_CODE) > 1;

-- Ejemplo salida: Aberdeen | 3

-- 7. Mostrar el número de vuelos por modelo de avión.

SELECT A.MODEL ->> 'en' AS MODELO_AVION, COUNT(F.FLIGHT_ID) AS TOTAL_VUELOS
FROM FLIGHTS F
JOIN ROUTES R ON F.ROUTE_NO = R.ROUTE_NO
JOIN AIRPLANES_DATA A ON R.AIRPLANE_CODE = A.AIRPLANE_CODE
GROUP BY A.MODEL ->> 'en'
ORDER BY TOTAL_VUELOS DESC;

-- Ejemplo salida: Boeing 777-300ER | 19412

-- 8. Reservas con más de un billete (varios pasajeros).

SELECT BOOK_REF, COUNT(DISTINCT TICKET_NO) AS TOTAL_PASAJEROS
FROM TICKETS
GROUP BY BOOK_REF
HAVING COUNT(DISTINCT TICKET_NO) > 1;

-- Ejemplo salida: 0000EG | 2

-- 9. Vuelos con retraso de salida superior a una hora.

SELECT F.FLIGHT_ID, R.DEPARTURE_AIRPORT, R.ARRIVAL_AIRPORT, F.STATUS
FROM FLIGHTS F
JOIN ROUTES R ON F.ROUTE_NO = R.ROUTE_NO
WHERE F.ACTUAL_DEPARTURE - F.SCHEDULED_DEPARTURE > INTERVAL '1 hour';

-- Ejemplo salida: 63 | YYC | YEG | Arrived