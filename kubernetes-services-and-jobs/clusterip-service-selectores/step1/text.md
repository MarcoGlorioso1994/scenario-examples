Creamos el archivo `deployment.yaml` y añadimos el siguiente código dentro del archivo:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend
spec:
  replicas: 3
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

Ahora podemos desplegar el Deployment para crear los tres pods ejecutando el siguiente comando:

```
kubectl apply -f deployment.yaml
```{{exec}}

Para comprobar que los pods se han iniciado correctamente, podemos ejecutar un comando `curl` hacia la IP del pod.

```
kubectl get pods -o wide
```{{exec}}

Tomas nota de la IP de uno de los pods creados y ejecutamos el comando `curl` de la siguiente manera:

```
curl http://{direccionIP_pod}:80
```{{copy}}

Tendrías que recibir la página HTML del servidor web Nginx.