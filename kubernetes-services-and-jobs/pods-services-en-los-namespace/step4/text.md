Para finalizar el análisis sobre el funcionamiento de los namespaces, intentaremos ejecutar una llamada HTTP, utilizando la herramienta `curl`, desde uno de los pods creados en el namespace `test` hacia el servicio `frontend-svc` en el namespace `dev`.

El siguiente comando `kubectl` selecciona uno de los pods creados con el deployment `frontend` y, desde el pod, ejecuta una llamada HTTP hacia el servicio del namespace `dev`.

```
kubectl exec deployment/frontend -- curl -s frontend-svc.dev.svc.cluster.local
```{{exec}}

Deberías recibir la página HTML del servidor web Nginx.

Podemos ejecutar la llamada HTTP anterior, pero esta vez utilizando el servicio desplegado en el entorno `test`.

```
k exec deploy/frontend -- curl -s frontend-svc.test.svc.cluster.local
```{{exec}}

Deberías recibir la misma página HTML del servidor web Nginx que recibiste con el comando anterior.

También podrías llamar a los servicios de cada namespace utilizando su IP virtual de la siguiente manera:

```
k exec deploy/frontend -- curl -s http://{ip_virtual_service}:80
```{{exec}}