Para simular un fallo y observar cómo los probes gestionan el problema, podemos ejecutar un comando que corrompa temporalmente el servidor web dentro del pod.

Come primer paso necesitamos obténer el nombre del pod:

```bash
kubectl get pods
```{{exec}}

Accedemos al contenedor:

```bash
kubectl exec -it <nombre-del-pod> -- //bin/bash
```{{exec}}

Dentro del contenedor, vamos a eliminar el archivo de configuración de nginx para simular un fallo:

```bash
rm -rf /usr/share/nginx/html/*
```{{exec}}

Esto simula un fallo en el servidor nginx, ya que no tendrá contenido para servir en el endpoint /.