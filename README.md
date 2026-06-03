# Entrega-Parcial-2-Desafio20-Web-y-movil

## Instrucciones de uso

Clonamos el repositorio

```bash
git clone https://github.com/vichoRobles/Entrega-Parcial-2-Desafio20-Web-y-movil
cd <tu-carpeta-backend>
```
Instalamos las dependencias
```bash
npm install
```
Configuramos las variables del entorno

```
PORT=3000
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=tu_contraseña
DB_HOST=localhost
DB_NAME=nombre_de_la_db
JWT_SECRET=jwt_secret
```

Corremos la aplicación, en este caso utilizamos el script 'npm run dev' debido a que permite prototipado rápido para las entregas.
```bash
npm run dev
```

## EP 2.1: Creación del servidor en Node.js con Express o Flask

El servidor es la base para implementar un backend de una aplicación, y esto permite procesar inicialmente los datos además de comunicarse con la base de datos posterior u otros servicios externos.

Para la creación de Node.js utilizamos Express y también implementamos Cors para la seguridad, la creación del servidor está en el directorio "index.js".

## EP 2.2: Configuración y modelado de la base de datos relacional.

Se configuraron y modelaron las bases de datos en PostgreSql, a continuación se explica la utilidad de la base de datos :

**(1)** La utilidad principal de la base de datos está en definir una estructura sólida gracias al modelo entidad-relación, permitiendo así contar con un almacenamiento seguro de los datos. 

**(2)** La base de datos es indispensable en el backend para validar identidades (ID) usando tanto llaves primarias (Primary key) como llaves foráneas (Foreign key).

**(3)** La base de datos permite gestionar los datos a través de el uso de múltiples comandos, los más importantes se detallan a continuación :

a) SELECT : Herramienta principal para extraer datos

b) ORDER BY : Ordenar los datos para poder visualizarlos con mayor claridad

c) JOIN : Para juntar datos relacionados entre sí

d) GROUPBY : Para organizar los datos dividiendo grandes conjuntos de datos en grupos más simples y específicos.

e) CRUD (CREATE, READ, UPDATE, DELETE) : Permiten un control total de los datos.

## EP 2.3:  Desarrollo de API REST con endpoints básicos, manejo adecuado de códigos HTTP y respuestas en formato JSON estructurado.

Una API REST (interfaz de programación de aplicaciones de transferencia de estado representacional) es un estilo de arquitectura considerado el estándar para diseñar y crear aplicaciones Web, su principal utilidad radica en proporcionar un conjunto de reglas y restricciones que permiten tener servicios web sencillos, escalables y fáciles de integrar, a continuación se detallan sus 3 principales características :

### Uso de endpoints básicos (GET, POST, PUT/PATCH y DELETE)

Los endpoints básicos son los principales puntos de acceso o rutas definidas en la API REST, los cuales permiten interactuar con los recursos del sistema mediante las solicitudes HTTP. Cada endpoint posee una operación específica utilizando los métodos HTTP para indicar la operación que se desea realizar sobre los datos.

**GET :** Operación utilizada para obtener información

**POST :** Operación utilizada para crear nuevos recursos

**PUT/PATCH :** Operaciones que sirven para actualizar información

**DELETE :** Operación utilizada para eliminar recursos

**Nota :** Su equivalente en base de datos son los comandos CRUD (CREATE, READ, UPDATE, DELETE)

### Manejo adecuado de códigos HTTP

Consiste en usar correctamente los códigos de estado que son definidos por el protocolo HTTP para indicar un resultado de una solicitud de un cliente al servidor, a continuación se muestran los principales códigos HTTP y cómo debe ser su uso adecuado :

**Ejemplos principales de códigos HTTP utilizados :**

**200 OK :**  Solicitud exitosa
 
**201 Created :** Recurso creado 

**204 No Content :** Código exitoso sin cuerpo 

**400 Bad Request :** Datos inválidos 

**401 Unauthorized :** Falta autenticación 

**403 Forbidden :** Sin permisos autenticado

**404 Not Found :** No encontrado 

**500 Internal Server Error :** Error del servidor 


### Respuestas en formato JSON estructurado 

El objetivo de las respuestas en formato JSON estructurado es devolver la información de una API usando la sintaxis de JSON(JavaScript Object Notation) adecuadamente.

Es de gran utilidad ya que JSON es actualmente el estándar más usado para la comunicación entre cliente-servidor, y esto se debe a su simplicidad y compatibilidad con muchos lenguajes de programación.

**Ejemplo de la estructura de la respuesta JSON :**

```

  "items": [
    {
      "id": 1
      "valor": "valor1"
      "valor" : "valor2"
      "activo" : true
    },

    {
      "id": 2
      "valor": "valor3"
      "valor" : "valor4"
      "activo" : false
    },

    {
      "id": 3
      "valor": "valor5"
      "valor" : "valor6"
      "activo" : true
    }
  ]

```
    

## EP 2.4: Consumo de la API REST desde Ionic con React utilizando fetch o Axios, implementando manejo de errores, interceptores y gestión de tokens JWT 

 En esta etapa, se debe integrar el frontend que desarrollamos con Ionic junto a una API REST, esto permite que la aplicación móvil se comunique con el servidor para enviar o recibir información relevante. El objetivo de esto es hacer que la interfaz de usuario pueda consumir los servicios expuestos por la API de forma segura.

 **Esta etapa involucra 5 acciones clave :** Consumo de la API REST, uso de fetch (en nuestro caso utilizamos fetch) , manejo de errores, interceptores y gestión de tokens JWT.

 **1) Consumo de la API REST :** Realizar solicitudes HTTP desde la app hasta el servidor para obtener datos.

 **2) Uso de Fetch :** Se usa una función de JavaScript para hacer las solicitudes HTTP.

 Ejemplo del uso de fetch :

 ```

fetch("http://localhost:3000/libros")
  .then(response => response.json())
  .then(data => console.log(data));

 ```

 **3) Manejo de errores :** Pueden ocurrer diferentes errores durante las comunicaciones que se deben manejar, estos errores principalmente se manejan en los códigos HTTP del 400 al 500 donde los más comunes son : Error 404 Recurso no encontrado, error 400 datos inválidos y error 500 ocurrió un error en el servidor.

 **4) El uso de interceptores :** Es el uso de funciones que se ejecutan automáticamente antes de mandar la solicitud (req) o después de recibir la respuesta (res).

 **5) Gestión de tokens JWT :** El JWT (JSON WEB TOKEN) es un mecanismo de autenticación basado en un token, cuando se inicia sesión, todo usuario recibe un token secreto y seguro que autentica que es él quien inició sesión.  


## EP 2.5: Implementación de autenticación con JWT con formulario de registro e inicio de sesión, rutas protegias en frontend, generación y validación de JWT, diferenciación por roles

## EP 2.6: Validación de usuarios y manejo de sesiones con validación de inputs, Hash de contraseñas con bcrypt, Manejo seguro de credenciales, Protección básica contra inyección SQL.

## EP 2.7: Pruebas funcionales siendo en Postman o Insomnia, Documentación de endpoints, Evidencia de pruebas.




