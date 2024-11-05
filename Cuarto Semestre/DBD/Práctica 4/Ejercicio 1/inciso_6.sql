SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM cliente c INNER JOIN factura f ON (c.idCliente = f.idCliente)
INNER JOIN detalle d ON (f.nroTicket = d.nroTicket)
INNER JOIN producto p ON (d.idProducto = p.idProducto)
WHERE (p.nombreP='prod1') AND (c.idCliente IN (SELECT c.idCliente
  FROM cliente c INNER JOIN factura f ON (c.idCliente = f.idCliente)
  INNER JOIN detalle d ON (f.nroTicket = d.nroTicket)
  INNER JOIN producto p ON (d.idProducto = p.idProducto)
  WHERE (p.nombreP='prod2')))
EXCEPT
( SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
  FROM cliente c INNER JOIN factura f ON (c.idCliente = f.idCliente)
  INNER JOIN detalle d ON (f.nroTicket = d.nroTicket)
  INNER JOIN producto p ON (d.idProducto = p.idProducto)
  WHERE (p.nombreP='prod3')
)
