Para comprobar el correcto funcionamiento del Service ClusterIP, vamos a ejecutar una llamada HTTP utilizando la herramienta `curl` desde dentro de uno de los pods creados con el deployment.

```
kubectl exec deployment/frontend -- curl -s http://frontend-svc
```{{exec}}

Tendrías que recibir la página HTML del servidor web Nginx.

Podemos ejecutar la llamada HTTP anterior, pero esta vez utilizando el nombre completo del servicio.

```
k exec deploy/frontend -- curl frontend-svc.default.svc.cluster.local
```{{exec}}

En el nombre completo se combina el nombre del servicio, el namespace, el tipo de recurso y, finalmente, cluster.local, que sería el dominio.