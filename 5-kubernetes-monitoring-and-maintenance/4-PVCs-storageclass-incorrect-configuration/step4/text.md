Ahora todo debería estar bien configurado y el pod debería ser capaz de utilizar un PV dentro de nuestro clúster.
Verificamos el estado del PVC:

```bash
kubectl get pvc
```{{exec}}

El PVC debería estar en estado `Bound`, lo que indica que ahora tiene un volumen asignado.

Seguimos, verificando el estado del pod:

```bash
kubectl get pod
```{{exec}}

El pod debería estar en estado Running, lo que significa que pudo montar el volumen correctamente.