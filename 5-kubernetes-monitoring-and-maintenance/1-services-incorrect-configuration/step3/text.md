Para corregir el problema, resulta necesario ajustar el archivo YAML deployment.yaml para que el servicio exponga correctamente el puerto 80, coincidiendo con el puerto que está usando el contenedor.

Actualizamos el archivo `deployment.yaml` para corregir el puerto del servicio. Reemplazamos el contenido del fichero con el siguiente código que contiene la configuración correcta:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-wrong-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: my-wrong-app
  template:
    metadata:
      labels:
        app: my-wrong-app
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: my-wrong-app-service
spec:
  selector:
    app: my-wrong-app
  ports:
  - protocol: TCP
    port: 8080       
    targetPort: 80 # Anadimos el campo targetPort con puerta 80
```{{copy}}

Ahora podemos desplegar el deployment ejecutando el siguiente comando:

```bash
kubectl apply -f deployment.yaml
```{{exec}}