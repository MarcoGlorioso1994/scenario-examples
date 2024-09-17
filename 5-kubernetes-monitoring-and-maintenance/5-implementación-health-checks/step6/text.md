El `livenessProbe` verifica si la aplicación está viva. Si la aplicación no responde correctamente, Kubernetes reiniciará el contenedor. Después de eliminar el contenido del directorio /html, el probe de livenessProbe seguramente ha fallado.

Verificamos los eventos del pod:

```bash
kubectl describe pod my-app
```{{copy}}

Bajo la sección de `Events`, podemos ver detalles sobre el fallo del contenedor. Buscamos las secciones relacionadas con Liveness y Readiness y observamos cómo Kubernetes maneja el fallo. El `readiness probe` probablemente fallará primero, evitando que se enrute el tráfico hacia el pod. Después, el `liveness probe` fallará y Kubernetes reiniciará el contenedor. Exactamente, podemos ver un evento con el siguiente mensaje: "Container my-app failed liveness probe, will be restarted" y, en los eventos posteriores, el proceso de reinicio del contenedor por parte de Kubernetes.

Verificamos el estado del pod:

```bash
kubectl get pods my-app
```{{copy}}

Podemos ver cómo el pod está en estado `Running`, en la columna **READY** el valor es `1/1`, pero en la columna **RESTARTS** el valor es `1`. Esto nos muestra cómo Kubernetes ha reiniciado el contenedor y que ahora está correctamente desplegado y listo para responder a nuestras solicitudes HTTP.