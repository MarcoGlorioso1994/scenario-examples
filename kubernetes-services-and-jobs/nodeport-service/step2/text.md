Vamos a desplegar nuestro primer servicio de tipo NodePort. Creamos el archivo `service.yaml` y añadimos el siguiente código dentro del archivo:

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

Ahora podemos desplegar el servicio para los pods creados con el deployment.

```
kubectl apply -f service.yaml
```{{exec}}