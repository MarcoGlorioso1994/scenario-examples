Terminemos este laboratorio comprobando que el problema de conectividad interna entre la aplicación y el servicio ha sido solucionado. Para ello, necesitamos ejecutar una nueva solicitud curl desde dentro del pod.

Accedemos al contenedor:

```bash
kubectl get pods
```{{exec}}

```bash
kubectl exec -it <nombre-del-pod> -- //bin/bash
```{{copy}}

Dentro del contenedor, ejecutamos una segunda solicitud curl al servicio a través del nombre DNS del servicio:

```bash
curl http://my-wrong-app-service:8080
```{{exec}}

Esta vez, deberíamos ver la respuesta del servidor nginx, lo que indica que el problema de conectividad se ha resuelto.