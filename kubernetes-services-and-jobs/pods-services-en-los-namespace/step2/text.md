Ahora podemos crear un deployment para crear dos réplicas del mismo pod.
Creamos el archivo `deployment.yaml` y añadimos el siguiente código dentro del archivo:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend
spec:
  replicas: 2
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

Ahora podemos desplegar el deployment para los pods.

```
kubectl apply -f deployment.yaml
```{{exec}}

Para comprobar que los pods se han levantado correctamente, podemos ejecutar el siguiente comando y ver la lista de los pods en el entorno `dev`:

```
kubectl get pods -o wide
```{{exec}}

Continuamos desplegando un servicio de tipo ClusterIP en el namespace `dev`.

Creamos el archivo `service.yaml` y añadimos el siguiente código dentro del archivo:

```
apiVersion: v1
kind: Service
metadata:
  name: frontend-svc
spec:
  selector:
    app: nginx
  ports:
  - port: 80
    targetPort: 80
```{{copy}}

Ahora podemos desplegar el servicio para los pods creados con el deployment.

```
kubectl apply -f service.yaml
```{{exec}}