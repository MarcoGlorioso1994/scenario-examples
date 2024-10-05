En este paso, configuraremos un Sidecar que recoja los logs del contenedor principal y los envíe a un servicio central (simulado con un busybox que envía a un archivo en un volumen compartido).

Creamos un archivo `pod-sidecar-logging.yaml` con el siguiente contenido:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: sidecar-logging-demo
spec:
  volumes:
    - name: shared-logs
      emptyDir: {}
  containers:
    - name: main-container
      image: nginx
      volumeMounts:
        - name: shared-logs
          mountPath: /var/log
    - name: sidecar-logging
      image: busybox
      command: ['sh', '-c', 'while true; do cat /var/log/nginx/access.log > /data/logs.txt; sleep 5; done']
      volumeMounts:
        - name: shared-logs
          mountPath: /var/log
        - name: shared-logs
          mountPath: /data
```{{copy}}

Ahora podemos aplicar el manifiesto para crear el Pod principal y el Pod Sidecar:

```bash
kubectl apply -f pod-sidecar-logging.yaml
```{{exec}}

Verificamos el estado del Pod. Al verificar el estado del Pod, podemos observar que tanto el sidecar como el contenedor principal se están ejecutando simultáneamente.

```bash
kubectl get pods
```{{exec}}

Para revisar los logs generados por el contenedor principal y recopilados por el Sidecar, ejecuta el siguiente comando:

```bash
kubectl logs sidecar-logging-demo -c main-container
```{{exec}}

Para revisar los logs del Sidecar, puedes utilizar:

```bash
kubectl logs sidecar-logging-demo -c sidecar-logging
```{{exec}}

Esto te dará una visión completa de la interacción entre ambos contenedores.