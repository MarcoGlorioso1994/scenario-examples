Como primer paso, crearemos un `Deployment`. 

Para ello, creamos el archivo `nginx-deployment.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```{{copy}}

Ahora podemos desplegar el deployment ejecutando el siguiente comando:

```bash
kubectl apply -f nginx-deployment.yaml
```{{exec}}

Para comprobar que el Deployment se desplegado correctamente, podemos ejecutar los siguientes comandos

```bash
kubectl get deployments
```{{exec}}

```bash
kubectl get pods
```{{exec}}

Tendrías que ver el **Deployment** con el nombre `nginx-deployment` y en la columna **READY** el valor `3/3`, lo que significa que el Deployment ha desplegado correctamente 3 réplicas del pod definido en el archivo `nginx-deployment.yaml`. Además, al ejecutar el segundo comando, deberías ver los tres pods desplegados correctamente.