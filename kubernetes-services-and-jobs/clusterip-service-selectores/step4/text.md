Para comprobar el correcto funcionamento del Service ClusterIP vamos a ejecutar una llamada http con utilizo de la herramienta Curl, desde dentro de uno de los Pods creados con el Deployment.

```
kubectl exec deployment/frontend -- curl -s http://frontend-svc
```{{exec}}

Tendrias que recibir la pagina html del web server nginx. 

Podemos ejecutar la llamda http anterior pero utilizando esta vez el nombre completo del service

```
k exec deploy/frontend -- curl frontend-svc.default.svc.cluster.local
```{{exec}}

En el nombre completo es la combinacion del nombre del servicio, mas el namespace, mas el tipo de recurso y por fin el cluster.local que seria el dominio.