Vamos a ejecutar el comando `describe` para el servicio ClusterIP para analizar la lista de los endpoints.

```
kubectl describe svc frontend-svc
```{{exec}}

Podemos ver que el campo `Endpoints` está poblado con una lista de direcciones IP, que son las IPs de los pods que hemos creado ejecutando el deployment en el primer paso de este laboratorio. Esta lista está poblada porque Kubernetes busca todos los pods con labels iguales a `app: nginx`.

En la definición del servicio, en la sección `spec`, se utilizó la palabra clave `selector` para configurar el servicio de manera que seleccione todos los pods con labels iguales a `app: nginx`.

Ahora vamos a modificar esta sección en el archivo `service.yaml` para ver cómo cambia la lista de endpoints según las labels.

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

Hemos cambiado el valor de la label en el campo `selector`.

Ahora podemos desplegar el servicio para los tres pods creados con el deployment.

```
kubectl apply -f service.yaml
```{{exec}}

Vamos a ejecutar el siguiente comando para obtener solo el campo Endpoints del servicio.

```
k get endpoints simple-svc
```{{exec}}

Esta vez podemos ver que el campo `Endpoints` está vacío.