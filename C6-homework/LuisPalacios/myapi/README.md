# Creación de una API REST con Express usando Arrays en Memoria

Express: Utilizamos Express para crear la API REST. Es un marco minimalista que nos permite definir rutas y manejar solicitudes HTTP de forma sencilla.

Array en Memoria: Se usan dos arrays (movies  y directors ) para almacenar temporalmente los datos. Estos arrays se reinician cada vez que se reinicia el servidor

## Rutas de la API

## CRUD para Películas:

GET /movies: Devuelve todas las películas.
![Consulta 1](img/Consulta1.png)
GET /movies/1
![Consulta 2](img/Consulta2.png)
Devuelve una película específica por ID.

POST /movies: Crea una nueva película.
![Consulta 3](img/Consulta3.png)
PUT /movies/
: Actualiza una película existente.
![Consulta 4](img/Consulta4.png)
DELETE /movies/
: Elimina una película.
![Consulta 5](img/Consulta5.png)    
## CRUD para Directores:
GET /directors: Devuelve todos los directores.
GET /directors/
![Consulta 6](img/Consulta6.png) 
: Devuelve un director específico por ID.
![Consulta 7](img/Consulta7.png) 
POST /directors: Crea un nuevo director.
![Consulta 8](img/Consulta8.png) 
PUT /directors/
: Actualiza un director existente.
![Consulta 9](img/Consulta9.png) 
DELETE /directors/
: Elimina un director.
![Consulta 10](img/Consulta10.png)

Middleware: Se utiliza express.json() para permitir que el servidor procese JSON en las solicitudes POST y PUT

![Consulta 11](img/Consulta11.png)

![Consulta 12](img/Consulta12.png)
