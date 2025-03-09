# Teoría/Clase 5

---

## Búsqueda de información en un archivo de registros de longitud variable

---

*Tenemos tres formas:*

- **Recorrido secuencial →** Es poco eficiente
- **Búsqueda binaria →** Es muy costosa
- **Utilizar estructuras auxiliares**

## Índice

---

*Estructura auxiliar que le impone un orden lógico al archivo.*

- Cada elemento va a tener la clave primaria de un registro, junto a un puntero apuntando a su posición física dentro del archivo (**clave** / **referencia**)
- Es una estructura de longitud fija
- Necesita estar en un archivo aparte ya que tiene que persistir en memoria
- Permite la búsqueda por clave primaria

### Ventajas

---

- Se almacena en memoria principal
- El mantenimiento es menos costoso

### Desventajas

---

- Reescritura del archivo de índices
- ¿Y si el espacio en la RAM no alcanzara? → **Soluciones →** Uso de *árboles* o *Hashing*

### Índice secundario

---

- No es natural solicitar un dato por *clave primaria* (por ejemplo, nadie pregunta una canción por su ID numérica en Spotify, si no por el nombre de la canción)
- Sirve para acortar la búsqueda
- **Problema →** la repetición de información → **Solución →** Lista de punteros de ocurrencias

Usar una lista invertida (como con los espacios libres en el archivo de registros de longitud variable)

**Claves secundarias**

| **NRR** | **Banda (clave secundaria)** | **Nodo conectado** |
| --- | --- | --- |
| 0 | Soda Stereo | 4 |
| 1 | Tan Bionica | 1 |
| 2 | Rata Blanca | 6 |

| **NRR** | **Claves primarias** | **Nodo conectado** |
| --- | --- | --- |
| 0 | SDST123 | -1 |
| 1 | TB654 | -1 |
| 2 | RTB122 | 3 |
| 3 | RTB123 | 5 |
| 4 | SDST423 | 0 |
| 5 | RTB124 | -1 |
| 6 | RTB111 | 2 |
