USE Ventas_Tech_DB;
GO

-- Consulta 1: Vista base enriquecida del proyecto
SELECT
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.ciudad,
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos p
    ON v.id_producto = p.id_producto
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;

-- Consulta 2: Clientes sin ventas
SELECT
    c.nombre AS nombre_cliente,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

-- Consulta 3: Productos sin ventas
SELECT
    p.nombre_producto,
    c.nombre_categoria,
    p.precio
FROM productos p
LEFT JOIN ventas v
    ON p.id_producto = v.id_producto
LEFT JOIN categorias c
    ON p.id_categoria = c.id_categoria
WHERE v.id_venta IS NULL;

-- Consulta 4: Consolidado por período con UNION ALL

WITH ventas_por_periodo AS (

    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        '05 al 10 de marzo' AS origen
    FROM ventas
    WHERE fecha_venta BETWEEN '2024-03-05' AND '2024-03-10'

    UNION ALL

    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        '11 al 15 de marzo' AS origen
    FROM ventas
    WHERE fecha_venta BETWEEN '2024-03-11' AND '2024-03-15'
)

SELECT
    origen,
    SUM(total) AS total_facturado
FROM ventas_por_periodo
GROUP BY origen
ORDER BY origen;
