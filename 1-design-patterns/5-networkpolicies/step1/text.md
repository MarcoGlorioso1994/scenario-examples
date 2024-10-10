En este paso, vamos a desplegar un Pod Nginx simple para pruebas. 

Crea un archivo YAML llamado `nginx-deployment.yaml` con el siguiente contenido:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
spec:
  replicas: 2
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
        image: nginx
        ports:
        - containerPort: 80
```{{copy}}

Ahora podemos aplicar el manifiesto para crear el Pod:

```bash
kubectl apply -f nginx-deployment.yaml
```{{exec}}

Comprobamos que el Pod está en ejecución: 

```bash
kubectl get pods
```{{exec}}