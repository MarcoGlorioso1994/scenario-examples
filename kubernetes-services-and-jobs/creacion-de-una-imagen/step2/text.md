Vamos a escribir el contenido del archivo `Dockerfile`.

Empezaremos por una imagen base de `ubuntu:20.04`.

```Dockerfile
FROM ubuntu:20.04
```

Despues de esto, tenemos que imaginar que estamos en un entorno ubuntu. En ese caso, antes que nada deberíamos actualizar los paquetes del sistema. Para ello, usamos el comando `apt-get update` y `apt-get upgrade`.

```Dockerfile
RUN apt-get update && apt-get upgrade -y
```

Observa cómo utilizamos el flag `-y`, esto es para que no nos pregunte si queremos actualizar los paquetes, ya que estamos en un entorno no interactivo.

Por último, vamos a instalar un paquete de software. En este caso, vamos a instalar `node`.

```Dockerfile
RUN apt-get install -y nodejs
```

Finalmente, nuestro comando por defecto será `node`.

```Dockerfile
CMD ["node"]
```

Vamos al siguiente paso, donde vamos a construir la imagen.
