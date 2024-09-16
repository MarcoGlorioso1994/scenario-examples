Come primer paso, necesitamos desplegar una aplicación que incluya livenessProbe y readinessProbe.

Para ello, creamos el archivo `deployment.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-dp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-app
        image: nginx
        ports:
        - containerPort: 80
        livenessProbe:
          httpGet:
            path: /
            port: 80
          initialDelaySeconds: 10
          periodSeconds: 5
        readinessProbe:
          httpGet:
            path: /
            port: 80
          initialDelaySeconds: 5
          periodSeconds: 5
```{{copy}}

El `livenessProbe` verifica si la aplicación está viva. Si la aplicación no responde correctamente, Kubernetes reiniciará el contenedor. El `readinessProbe` verifica si la aplicación está lista para recibir tráfico. Si falla, Kubernetes deja de enviar tráfico al contenedor, pero no lo reinicia.
Ambos probes hacen una solicitud HTTP GET a la raíz / del servidor web nginx en el puerto 80.

Ahora podemos desplegar el deployment ejecutando el siguiente comando:

```bash
kubectl apply -f deployment.yaml
```{{exec}}

Para comprobar que el pod se ha creado correctamente, podemos ejecutar el siguiente comando:

```bash
kubectl get pods
```{{exec}}

Ademas, podemos observar el estado del pod con el siguiente comando:

```bash
kubectl describe pod <nombre-del-pod>
```{{exec}}