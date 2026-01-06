# Resumen HTTP/2

---

### Características claves

- Protocolo binario
- Multiplexación de solicitudes/requerimientos en una misma conexión
- Push Promise (del lado del servidor)
- Compresión de headers

### ALPN

- Es una extensión del TLS (otro protocolo) que le permite a la capa de aplicación negociar qué protocolo se va a utilizar para establecer la conexión, sin tener que viajar de nuevo al origen para confirmar el protocolo a utilizar.
- Esta negociación de protocolos se realiza luego del handshake de TLS inicial
- Si una de las dos partes no soporta APLN, entonces la negociación no se realiza y se utiliza HTTP/1.1 en su lugar

### Formato de las interacciones

- Todos los datos enviados son partes de un frame
- Cada frame contiene un **frame header** (encabezado del frame), y algunos frames de datos (su formato depende del tipo de frame)
    - El encabezado contiene la siguiente información: **Largo del frame**, **tipo de frame**, **flags**, e **identificador del stream**
    - Tipos de Frame —> DATA, HEADERS, PRIORITY, RST_STREAM, SETTINGS, PUSH_PROMISE, PING, GOAWAY, WINDOW_UPDATE, CONTINUATION
- El tamaño máximo de un frame es de 2^23 octetos (approx. 16 megabytes)
