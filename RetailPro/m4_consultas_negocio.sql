USE Ventas_Tech_DB;
GO

-- Consulta 1: Resumen ejecutivo mensual
SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;


-- Consulta 2: Ranking de productos
SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;


-- Consulta 3: Clientes recurrentes
SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;


-- Consulta 4: Meses por encima o por debajo del promedio
WITH ventas_mensuales AS (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)
SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado >= (
            SELECT AVG(total_facturado)
            FROM ventas_mensuales
        )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM ventas_mensuales
ORDER BY mes;


-- ============================================
-- HALLAZGOS
-- ============================================

-- 1. En marzo se facturaron $6.444 en 10 pedidos,
--    con un ticket promedio de $644,40.

-- 2. El producto ID 1 lideró la facturación con $3.600, siendo el producto más rentable,
--    mientras que el producto ID 2 fue el de mayor volumen,
--    con 13 unidades vendidas.

-- 3. Todos los clientes realizaron más de un pedido.
--    El cliente ID 1 registró el mayor gasto total, con $2.640.
