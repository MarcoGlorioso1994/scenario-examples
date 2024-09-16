Ahora, vamos a simular un error en la configuración. Modificaremos el ConfigMap o el Secret de forma que el pod no pueda obtener la configuración correctamente. Por ejemplo, cambiaremos el nombre del ConfigMap en el archivo del pod o eliminaremos la clave del Secret.

Ejecutaremos los siguientes pasos:

- Modificar el ConfigMap: cambiaremos el nombre del ConfigMap o eliminaremos una de las claves dentro del archivo configmap.yaml.
- Actualizaremos el ConfigMap.

Vamos a modificar el nombre de nuestro ConfigMap; reemplazaremos el código dentro del archivo `configmap.yaml` con el siguiente código:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-wrong-config  # Cambiado el nombre
data:
  APP_MODE: "production"
  LOG_LEVEL: "debug"
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