Después de eliminar el contenido, los probes de liveness y readiness fallarán.

Verificamos el estado de los probes:

```bash
kubectl describe pod <nombre-del-pod>
```{{exec}}

Buscamos las secciones relacionadas con Liveness y Readiness y observa cómo Kubernetes maneja el fallo. El probe de readiness probablemente falle primero, evitando que se enrute el tráfico hacia el pod. Después, el livenessProbe fallará y Kubernetes reiniciará el contenedor.

Ahora, seguimos verificando los eventos que muestran cómo Kubernetes intenta gestionar el fallo:

```bash
kubectl get events
```{{exec}}