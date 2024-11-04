# Introducción a las Bases de Datos/Capítulo 3

---

## Algoritmos esenciales

---

- **Algoritmo para leer registros de un archivo sin preocuparse por saltarse el último**

```pascal
procedure Leer(var arch: file; var reg: register);
	begin
		if not eof(arch) then
			read(arch, reg)
		else
			reg.CODIGO:= VALOR_ALTO;
	end;
```

- **Algoritmo para elegir un archivo de N archivos, devolver el registro de la posición actual del puntero de ese archivo, y avanzar al siguiente en dicho archivo**

```pascal
procedure Minimo(var arr: arregloDetalles; var arrReg: arregloRegistros; var min: reg);
	var
		i: integer;
		codigoMin: integer;
		indiceMin: integer;
	begin
		codigoMin:= 9999;
		for i:=1 to MAX do begin
			if (codigoMin > arrReg[i].codigo) then begin
				codigoMin:= arrReg[i].codigo;
				indiceMin:= i;
			end;
		end;
		min:= arrReg[indiceMin];
		Leer(arr[indiceMin], arrReg[indiceMin]);
	end;
```
