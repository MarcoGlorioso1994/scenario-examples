Cuando un pod o contenedor falla, Kubernetes genera eventos que pueden ser útiles para diagnosticar el problema.

Seguimos visualizando los eventos relacionados con el pod:

```bash
kubectl describe pod <nombre-del-pod>
```{{exec}}

Bajo la sección de `Events`, verás detalles sobre el fallo del contenedor. Deberías encontrar mensajes como `Back-off restarting failed container` o `Error` que indican que el contenedor ha estado fallando y Kubernetes está tratando de reiniciarlo repetidamente.

Además, podemos listar todos los eventos recientes en el clúster con el siguiente comando:

```bash
kubectl get events --sort-by='.metadata.creationTimestamp'
```{{exec}}

El comando nos mostrará una lista cronológica de eventos recientes, lo que nos ayudará a identificar cuándo comenzó el fallo y cómo Kubernetes lo ha manejado.