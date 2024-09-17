Ahora, vamos a simular un error en la configuración. Modificaremos el ConfigMap o el Secret de forma que el pod no pueda obtener la configuración correctamente. Por ejemplo, cambiaremos el nombre del ConfigMap en el archivo del pod.

Vamos a modificar el nombre de nuestro ConfigMap en el fichero del pod; reemplazaremos el código dentro del archivo `pod.yaml` con el siguiente código:

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
          name: new-config-name  # Nombre diferente
          key: APP_MODE
    - name: LOG_LEVEL
      valueFrom:
        configMapKeyRef:
          name: new-config-name  # Nombre diferente
          key: LOG_LEVEL
    - name: DB_PASSWORD
      valueFrom:
        secretKeyRef:
          name: my-secret
          key: DB_PASSWORD
```{{copy}}

Aplicamos los cambios:

```bash
kubectl apply -f configmap.yaml
```{{exec}}

Revisamos los logs del pod para ver cómo se comporta con la configuración incorrecta:

```bash
kubectl logs my-config-secret-pod
```{{exec}}

Deberíamos ver errores o valores vacíos para las variables de entorno que deberían haber sido proporcionadas por el ConfigMap.
Ahora, usamos kubectl describe para obtener más información sobre el pod y verificar si hay eventos relacionados con la configuración.

```bash
kubectl describe pod my-config-secret-pod
```{{exec}}

Revisamos los eventos para ver información sobre errores recientes que puedan estar relacionados con la configuración del pod.

```bash
kubectl get events --sort-by='.metadata.creationTimestamp'
```{{exec}}