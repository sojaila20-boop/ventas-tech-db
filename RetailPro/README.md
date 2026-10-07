# RetailPro — Proyecto de Data Analytics

## Descripción

RetailPro es un proyecto académico desarrollado durante el curso de Data Analytics, orientado al análisis de ventas y al seguimiento de indicadores comerciales a partir de una base de datos relacional.

El proyecto incluye el diseño de una base de datos, la realización de consultas SQL para responder preguntas de negocio y la transformación de datos para su posterior análisis y visualización.

## Objetivos

Los principales objetivos del proyecto son:

- Diseñar una base de datos relacional para almacenar información comercial.
- Organizar los datos de clientes, productos, categorías y ventas.
- Realizar consultas SQL orientadas al análisis de ventas.
- Relacionar información proveniente de distintas tablas mediante JOIN.
- Preparar y transformar los datos para su posterior análisis.
- Utilizar herramientas de visualización para facilitar la interpretación de la información.

## Estructura de la base de datos

La base de datos está compuesta por las tablas `clientes`, `productos`, `categorias` y `ventas`.

La tabla `ventas` se relaciona con `clientes` mediante `id_cliente` y con `productos` mediante `id_producto`. A su vez, `productos` se relaciona con `categorias` mediante `id_categoria`.

Esta estructura permite integrar la información comercial y realizar análisis mediante consultas y JOINs.

## Herramientas utilizadas

- **SQL Server:** gestión de la base de datos.
- **SQL Server Management Studio (SSMS):** creación y ejecución de consultas SQL.
- **Power Query:** limpieza y transformación de datos.
- **Power BI:** análisis y visualización de información.
- **GitHub:** almacenamiento y documentación del proyecto.

## Scripts SQL

El proyecto contiene diferentes scripts SQL utilizados durante su desarrollo.

Estos scripts permiten:

- Crear y trabajar con la estructura de la base de datos.
- Consultar información de ventas.
- Analizar clientes y productos.
- Relacionar distintas tablas mediante JOIN.
- Obtener información útil para responder preguntas de negocio.

## Ejecución de los scripts SQL

Para ejecutar los scripts en SQL Server Management Studio:

1. Abrir SQL Server Management Studio (SSMS).
2. Conectarse a la instancia de SQL Server.
3. Abrir el script SQL que se desea ejecutar.
4. Verificar que la consulta utilice la base de datos `Ventas_Tech_DB`.
5. Ejecutar el script mediante la opción **Ejecutar**.
6. Revisar los resultados obtenidos en la pestaña **Resultados**.

## Proyecto académico

Este repositorio forma parte de un proyecto realizado durante una formación en Data Analytics y documenta el proceso de construcción, consulta, transformación y análisis de datos.
