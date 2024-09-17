
Revisamos los logs del pod para ver cómo se comporta con la configuración incorrecta:

```bash
kubectl logs my-config-secret-pod
```{{exec}}

Podemos ver que el pod está mostrando un error de tipo "CreateContainerConfigError".

Ahora, usamos kubectl describe para obtener más información sobre el pod y ver si hay eventos de errores relacionados con la configuración.

```bash
kubectl describe pod my-config-secret-pod
```{{exec}}

Bajo la sección de Events, podemos ver detalles sobre el fallo del contenedor. Deberíamos encontrar mensajes como "Error: couldn't find key APP_MODE in ConfigMap default/my-config", que es un error muy explícito y nos indica que falta una clave/valor dentro del ConfigMap my-config.

Revisamos los eventos a nivel de clúster para ver información sobre errores recientes que puedan estar relacionados con la configuración del pod.

```bash
kubectl get events --sort-by='.metadata.creationTimestamp'
```{{exec}}

El mismo error aparecerá en este output.