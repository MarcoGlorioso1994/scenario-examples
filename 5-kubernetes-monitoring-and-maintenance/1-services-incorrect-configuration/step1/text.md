Come primer paso, necesitamos desplegar una aplicación y un servicio con una configuración incorrecta (en este caso, el puerto del servicio no coincide con el puerto del contenedor):

Para ello, creamos el archivo `deployment.yaml` y añadimos el siguiente código dentro del archivo:

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
    port: 8080     # Configuración incorrecta: el servicio espera que el contenedor escuche en el puerto 8080
```{{copy}}

El contenedor nginx está configurado para escuchar en el puerto 80 (como lo especifica el campo containerPort). Sin embargo, el servicio está configurado para exponerse en el puerto 8080 (port: 8080), En ausencia del campo `targetPort`, el servicio redirige el tráfico al puerto 8080 utilizando por defecto el valor del campo `port`. Esto creará un problema, ya que el servicio no podrá redirigir correctamente el tráfico al puerto 80 dentro del contenedor. 

Ahora podemos desplegar el deployment ejecutando el siguiente comando:

```bash
kubectl apply -f deployment.yaml
```{{exec}}

Para comprobar que aplicación y el servicio se han creado correctamente, podemos ejecutar los siguiente comandos:

```bash
kubectl get deployments
```{{exec}}

```bash
kubectl get services
```{{exec}}

Ademas, podemos observar el estado del pod con el siguiente comando:

```bash
kubectl describe pod <nombre-del-pod>
```{{exec}}