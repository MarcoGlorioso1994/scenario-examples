Ejecutar el comando `kubectl get pods -o wide` para ver las direciones ip de los pods que hemos creado

```
kubectl get pods -o wide
```{{exec}}

Leer y coger notas de los ips en la columna IP. Los pods de un deployments son efimeros, entonces cuando eliminamos un pod y kubernetes lo crea en automatico para garantizar el deployment, este nuevo pod tendrà una ip diferente.

```
kubectl delete pods {nombre_de_un_pod_del_deployment}
```{{copy}}

Ejecutar el comando `kubectl get pods -o wide` para ver que las direciones ip de los pods se han modificado despues de la operacion delete.

```
kubectl get pods -o wide
```{{exec}}

Entonces los servicios solucionan este problema, crean un abstarcion sobre la parte de networking, porque nos permite de conectar a los pods de un deployment sin conocer la direccion IP de los Pods. 