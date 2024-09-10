Vamos a desplegar nuestro primer servicio de tipo ClusterIP. 

Creamos el fichero `service.yaml` y añadimos el siguiente código dentro del archivo:

```
apiVersion: v1
kind: Service
metadata:
  name: frontend-svc
spec:
  selector:
    app: nginx
  ports:
  - port: 80
    targetPort: 80
```{{copy}}

Ahora podemos desplegar el servicio para los pods creados con el deployment.

```
kubectl apply -f service.yaml
```{{exec}}