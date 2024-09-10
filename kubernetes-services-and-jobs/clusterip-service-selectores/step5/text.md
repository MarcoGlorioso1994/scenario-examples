Vamos a ejecutar el comando Describe por el service ClusterIp para analizar la lista de los endpoints. 

```
kubectl describe svc frontend-svc
```{{exec}}

Podemos ver que dentro del campo Endpoints esta populado con una lista de direcciones IP que serian los IPs que Pods que hemos creado ejecutando el deployment en el primer paso de este lab. Esta lista esta popolada porque Kubernetes busca todos los pods con labels equal a `app: ngnix`. 

El la definicion del servicio en la secion spec se utilizo la keyword selector configurando el servicio para selcionar todos los pods con labels igual a `app: ngnix`

Ahora vamos a modificar esta secion en el fichero service.yaml para ver como esta lista de endpoints cambia sobre las labels

```
apiVersion: v1
kind: Service
metadata:
  name: frontend-svc
spec:
  selector:
    app: nginxv2
  ports:
  - port: 80
    targetPort: 80
```{{copy}}

Ahora podemos desplegar el service para los tres pods creados con el deployment.

```
kubectl apply -f service.yaml
```{{exec}}

Vamos a ejecutar una segunda vez el comando Describe por el service ClusterIp para analizar la lista de los endpoints. 

```
kubectl describe svc frontend-svc
```{{exec}}

Esta vez podemos ver que el campo EndPoints esta vacio. 