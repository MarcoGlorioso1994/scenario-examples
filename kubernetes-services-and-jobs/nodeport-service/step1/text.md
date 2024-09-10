Creamos el archivo `deployment.yaml` y añadimos el siguiente código dentro del archivo:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      name: frontend
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
```{{copy}}

Ahora podemos desplegar el deployment para crear los pods.

```
kubectl apply -f deployment.yaml
```{{exec}}

Para comprobar que los pods se han levantado correctamente, podemos ejecutar un comando curl hacia la IP del pod.

```
kubectl get pods -o wide
```{{exec}}

Toma nota de la IP del pod creado y ejecuta el comando `curl`. Además, toma nota de la columna `NODE`, que muestra en qué nodo está desplegado el pod.

```
curl http://{direccionIP_pod}:80
```{{exec}}

Deberías recibir la página HTML del servidor web Nginx.