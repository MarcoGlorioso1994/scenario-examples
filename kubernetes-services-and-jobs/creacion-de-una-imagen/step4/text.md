En este paso vamos a contenerizar una aplicación web de ejemplo. Para ello, vamos a utilizar una imagen base de `node` y vamos a:

1. Copiar el código fuente de la aplicación.
2. Instalar las dependencias.
4. Ejecutar la aplicación.

Vamos a empezar. Hemos configurado un nuevo proyecto y la linea de comandos ya esta situada en el mismo directorio. `/filesystem/project`

Crea un nuevo fichare `Docerfile` y escribe el siguiente contenido:

```Dockerfile
FROM node:20

WORKDIR /app

COPY . .

RUN npm install

CMD ["node", "index.js"]
```

Crea el contenedor con el siguiente comando:

```bash
docker build -t my-node-app .
```{{exec}}

Una vez tengamos la imagen, vamos a ejecutar el contenedor:

```bash
docker run -d --name my-node-app my-node-app
```{{exec}}

Vamos a comprobar si está todo bien, dale a "Next" a ver si todo esta bien y podemos pasar al siguiente paso.


