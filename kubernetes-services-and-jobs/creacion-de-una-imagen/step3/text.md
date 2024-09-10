Vamos a construir la imagen que acabamos de definir en el archivo `Dockerfile`.

Para ello, vamos a utilizar el comando `docker build`.

```bash
docker build -t my-node .
```{{exec}}

Una vez tenemos la imagen, vamos a ejecutar el contenedor.

```bash
docker run my-node
```

Verás que no pasa nada, esto es porque el comando por defecto es `node` y no hemos especificado ningún archivo para ejecutar, y no tenemos una consola interactiva.

Vamos a darle un codigo inline para que se ejecute al iniciar el contenedor.

```bash
docker run my-node node -e "console.log(1+1)"
```{{exec}}

Si ves el resultado `2`, entonces todo ha ido bien.
