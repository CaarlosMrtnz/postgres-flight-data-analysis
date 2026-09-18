# Ejercicios Prácticos de SQL - PostgreSQL

Este proyecto reúne una serie de ejercicios de SQL realizados sobre una base de datos relacionada con la gestión de aeropuertos y vuelos.

## 🚀 Descripción

En el archivo `IntroBBDD.sql` se encuentran las consultas que he utilizado para resolver distintos ejercicios, empezando por búsquedas y filtros sencillos y avanzando hasta consultas más completas.

Podéis encontrar conceptos como:

* **JOIN entre tablas:** para relacionar información de vuelos, rutas, modelos de avión, reservas y tickets.
* **Trabajo con JSON/JSONB:** extracción de datos almacenados en formato JSON utilizando operadores como `->>`.
* **Agrupaciones y funciones de agregación:** uso de `GROUP BY`, `HAVING`, `COUNT` y `COUNT(DISTINCT)` para obtener resultados agrupados y aplicar condiciones sobre ellos.
* **Fechas e intervalos de tiempo:** cálculo de diferencias entre fechas y `timestamps`, por ejemplo para comprobar retrasos en los vuelos.
* **Búsqueda de texto:** utilización de `ILIKE` para buscar coincidencias sin importar si el texto está escrito en mayúsculas o minúsculas.

## 🛠️ Tecnologías utilizadas

* **Base de datos:** PostgreSQL
* **Lenguaje:** SQL

## 🗄️ Origen de los Datos

La base de datos que he utilizado para este proyecto es pública y corresponde a vuelos en Rusia. 

* **Enlace de descarga:** <https://postgrespro.com/docs/postgrespro/current/demodb-bookings-installation.html>
* **Archivo utilizado:** `demo-20250901-3m.sql.gz`
