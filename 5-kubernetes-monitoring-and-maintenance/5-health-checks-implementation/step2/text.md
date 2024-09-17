Para simular un fallo y observar el probe de readiness gestiona el problema, podemos ejecutar un comando que corrompa el servidor web dentro del pod.

Accedemos al contenedor:

```bash
kubectl exec -it my-app -- //bin/bash
```{{exec}}

Dentro del contenedor, vamos a eliminar el archivo de configuración de nginx para simular un fallo:

```bash
rm -rf /usr/share/nginx/html/*
```{{exec}}

Esto simula un fallo en el servidor nginx, ya que no tendrá contenido para servir en el endpoint /.