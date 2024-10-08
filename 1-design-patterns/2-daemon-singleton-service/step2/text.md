En este paso, crearás un Pod Singleton utilizando un Deployment con una sola réplica.

Para ello, creamos el archivo `nginx-singleton.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-singleton
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx-singleton
  template:
    metadata:
      labels:
        app: nginx-singleton
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```{{copy}}

Ahora podemos desplegar nuestra aplicación **Singleton** ejecutando el siguiente comando:

```bash
kubectl apply -f nginx-singleton.yaml 
```{{exec}}

Verificamos que el Pod Singleton esté corriendo listando los Pods:

```bash
kubectl get deployments
kubectl get pods
```{{exec}}

Deberías ver un solo Pod nginx ejecutándose.