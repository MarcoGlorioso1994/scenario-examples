Vamos a desplegar nuestro primer servicio de tipo ClusterIP. 

Dentro del directorio `project`, crea el fichero llamado `service.yaml`.

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

Ahora podemos desplegar el service para los tres pods creados con el deployment.

```
kubectl apply -f service.yaml
```{{exec}}