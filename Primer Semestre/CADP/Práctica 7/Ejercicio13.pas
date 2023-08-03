program Hello;
type
    libro = record
        titulo: string[20];
        editorial: string[20];
        paginas: integer;
        ano_edicion: integer;
        ventas: integer;
        codigo_area: integer;
    end;
    areas = array [1..35] of integer;
procedure leerLibro(var l: libro);
    begin
        write('Título del libro: '); readln(l.titulo);
        write('Nombre de la editorial: '); readln(l.editorial);
        write('Cantidad de páginas: '); readln(l.paginas);
        write('Año de edición: '); readln(l.ano_edicion);
        write('Cantidad de veces que fue vendido: '); readln(l.ventas);
        write('Código del área temática: '); readln(l.codigo_area);
    end;
begin
  writeln ('Hello World')
end.

//WIP, falta hacer el punto A y B
