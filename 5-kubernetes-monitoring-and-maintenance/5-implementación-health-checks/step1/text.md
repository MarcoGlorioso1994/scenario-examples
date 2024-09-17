Come primer paso, analizeremos una aplicación que incluya readinessProbe.

Para ello, creamos el archivo `pod.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-app
spec:
  containers:
  - name: my-app
    image: nginx
    ports:
      - containerPort: 80
    readinessProbe:
      httpGet:
        path: /
        port: 80
      initialDelaySeconds: 5
      periodSeconds: 5
```{{copy}}

El `readinessProbe` verifica si la aplicación está lista para recibir tráfico. Si falla, Kubernetes deja de enviar tráfico al contenedor, pero no lo reinicia.
El probe hace una solicitud HTTP GET a la raíz / del servidor web nginx en el puerto 80.

Ahora podemos desplegar nuestra aplicación ejecutando el siguiente comando:

```bash
kubectl apply -f pod.yaml
```{{exec}}

Para comprobar que el pod se ha creado correctamente, podemos ejecutar el siguiente comando:

```bash
kubectl get pods
```{{exec}}