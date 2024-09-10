Creamos el fichero llamado `deployment.yaml`.

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
        image: nginx:1.24
```{{copy}}

Ahora podemos desplegar el deployment para crear los tres pods

```
kubectl apply -f deployment.yaml
```{{exec}}

Para comprobar que los pods se han levantado correctamente podemos ejecutar un comando curl hacia la ip del pod.

```
kubectl get pods -o wide
```{{exec}}

Coges nota de una ip de uno de los pods creados y ejecutamos el curl

```
curl http://{direccionIP_pod}:80
```{{exec}}

Tendrias que recibir la pagina html del web server nginx. 