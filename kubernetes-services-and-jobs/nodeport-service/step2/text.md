Vamos a desplegar nuestro primero servicio de tipo NodePort. 

Crea el fichero llamado `service.yaml`.

```
apiVersion: v1
kind: Service
metadata:
  name: frontend-svc
spec:
  type: NodePort
  selector:
    app: nginx
  ports:
  - port: 80
    nodePort: 30123
```{{copy}}

Ahora podemos desplegar el service para los tres pods creados con el deployment.

```
kubectl apply -f service.yaml
```{{exec}}