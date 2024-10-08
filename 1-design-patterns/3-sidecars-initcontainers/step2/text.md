En este paso, configuraremos un Sidecar que recoja los logs del contenedor principal y los envíe a un servicio central (simulado con un busybox que envía a un archivo en un volumen compartido).

Creamos un archivo `pod-sidecar-logging.yaml` con el siguiente contenido:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: sidecar-logging-demo
spec:
  containers:
    - name: main-container
      image: nginx
      volumeMounts:
        - name: shared-logs
          mountPath: /var/log
      command: ["sh", "-c", "mkdir -p /var/log/nginx && touch /var/log/nginx/access.log /var/log/nginx/error.log && nginx -g 'daemon off;'"]
    - name: sidecar-logging
      image: busybox
      command: ['sh', '-c', 'while true; do cat /var/log/nginx/access.log > /data/logs_access.txt; cat /var/log/nginx/error.log > /data/logs_error.txt; sleep 5; done']
      volumeMounts:
        - name: shared-logs
          mountPath: /var/log
        - name: collected-logs
          mountPath: /data
  volumes:
    - name: shared-logs
      emptyDir: {}
    - name: collected-logs
      emptyDir: {}
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
k exec -it sidecar-logging-demo -c main-container -- //bin/bash
```{{exec}}

Dentro del contenedor principal, puedes acceder a los archivos en el directorio `/var/log/nginx`:
 
```bash
cd /var/log/nginx; ls
```{{exec}}

Encontrarás dos archivos de log: `access.log` y `error.log`. Estos son los archivos que Nginx utiliza para guardar sus registros.

Sal del contenedor principal y revisa los logs del Sidecar conectándote al contenedor Sidecar:

```bash
k exec -it sidecar-logging-demo -c sidecar-logging -- //bin/sh
```{{exec}}

Luego, analiza los archivos en el directorio `/data`:

```bash
cd /data; ls
```{{exec}}

Aquí encontrarás los archivos `logs_access.txt` y `logs_error.txt`, que son la recopilación de los logs generados por Nginx en el directorio `/var/log/nginx`.