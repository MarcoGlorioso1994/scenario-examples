Ejecuta el comando `kubectl get pods -o wide` para ver las direcciones IP de los pods que hemos creado. 
```
kubectl get pods -o wide
```{{exec}}

Lee y toma notas de las IPs en la columna IP. Los pods de un deployment son efímeros, por lo que cuando eliminamos un pod y Kubernetes lo crea automáticamente para garantizar el deployment, este nuevo pod tendrá una IP diferente.

```
kubectl delete pods {nombre_de_un_pod_del_deployment}
```{{copy}}

Ejecuta el comando `kubectl get pods -o wide` para verificar que las direcciones IP de los pods se han modificado después de la operación de eliminación.

```
kubectl get pods -o wide
```{{exec}}

Entonces, los servicios solucionan este problema creando una abstracción sobre la parte de red, ya que nos permiten conectar a los pods de un deployment sin conocer la dirección IP de los pods.