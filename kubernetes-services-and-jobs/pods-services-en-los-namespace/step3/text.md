En este paso, vamos a desplegar el deployment y el servicio ClusterIP del paso anterior en el namespace `test`.

Seleccionamos el namespace `test`.

```
kubectl config set-context --current --namespace=test
```{{exec}}

Ahora podemos desplegar el deployment para crear los pods en el namespace test

Creamos el archivo `deployment.yaml` y añadimos el siguiente código dentro del archivo:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      name: frontend
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
```{{copy}}

Ahora podemos desplegar el deployment para los pods.

```
kubectl apply -f deployment.yaml
```{{exec}}

Para comprobar que los pods se han levantado correctamente, podemos ejecutar el siguiente comando y ver la lista de los pods en el entorno `test`:

```
kubectl get pods -o wide
```{{exec}}

Continuamos desplegando un servicio de tipo ClusterIP en el namespace `test`.

Creamos el archivo `service.yaml` y añadimos el siguiente código dentro del archivo:

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

Para comprobar que todo se ha ejeutado correctamente podemos utilizar el siguente comando:

```
kubectl get svc
```{{exec}}

Es interesante ver cómo, al utilizar los namespaces, fue posible desplegar el mismo deployment y el mismo servicio dos veces sin problemas en nuestro clúster. Además, con los comandos `kubectl get pods` y `kubectl get svc` vemos únicamente las instancias desplegadas en el namespace actual. Ahora avanzamos al siguiente paso, donde vamos a verificar cómo es posible llamar al servicio y los pods de otro namespace sin restricciones.