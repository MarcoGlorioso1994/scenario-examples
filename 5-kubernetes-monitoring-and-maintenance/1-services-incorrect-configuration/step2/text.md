Para verifica la conectividad interna entre aplicación y servicio, necesitamos ejecutar una solicitud curl desde dentro del pod. 

Come primer paso necesitamos obténer el nombre del pod:

```bash
kubectl get pods
```{{exec}}

Accedemos al contenedor:

```bash
kubectl exec -it <nombre-del-pod> -- //bin/bash
```{{exec}}

Dentro del contenedor, intentamos a hacer una solicitud curl al servicio a través del nombre DNS del servicio:

```bash
curl http://my-wrong-app-service:8080
```{{exec}}

Debido a la configuración incorrecta del servicio, la solicitud fallará porque el contenedor nginx está escuchando en el puerto 80, pero el servicio está redirigiendo el tráfico al puerto 8080.