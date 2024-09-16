Como primer paso, crearemos un ConfigMap y un Secret que se utilizarán dentro de nuestra aplicación.

Para ello, creamos el archivo `configmap.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config
data:
  APP_MODE: "production"
  LOG_LEVEL: "debug"
```{{copy}}

Creamos tambien el archivo `secret.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
type: Opaque
data:
  DB_PASSWORD: c2VjcmV0cGFzcw==  # "secretpass" en base64
```{{copy}}


Por ultimo creamos el archivo `pod.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-config-secret-pod
spec:
  containers:
  - name: my-app
    image: busybox
    command: ['sh', '-c', 'while true; do echo APP_MODE=$APP_MODE; echo LOG_LEVEL=$LOG_LEVEL; echo DB_PASSWORD=$DB_PASSWORD; sleep 10; done']
    env:
    - name: APP_MODE
      valueFrom:
        configMapKeyRef:
          name: my-config
          key: APP_MODE
    - name: LOG_LEVEL
      valueFrom:
        configMapKeyRef:
          name: my-config
          key: LOG_LEVEL
    - name: DB_PASSWORD
      valueFrom:
        secretKeyRef:
          name: my-secret
          key: DB_PASSWORD
```{{copy}}

En este fichero del pod, applicacion leerà los valores APP_MODE y LOG_LEVEL del ConfigMap y valor DB_PASSWORD que se extrae del Secret.
El contenedor busybox ejecuta un bucle que imprime los valores de estas variables de entorno.

Aplicamos los archivos para crear el ConfigMap, Secret y Pod:

```bash
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
kubectl apply -f pod.yaml
```{{exec}}

Verificamos que el pod esté en ejecución:

```bash
kubectl get pods
```{{exec}}