Ahora podemos anadir un `livenessProbe` a nuestro pod para ver como Kubernetes reaciona a un fallo en precensa de un livenessProbe.

Para modificar nuestro pod, es necesario eliminar ultimo desplgue del mismo, porque estos cambios no estan includos en las possible modificas de un pod ya deplegado. Eliminamos el pod con el siguiente comando:

```bash
kubectl delete pods my-app
```{{exec}}

Ahora, al fin de anadir el livenessProbe, reemplazamos el contenido del archivo `pod.yaml` de la siguiente manera:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-app
spec:
  containers:
  - name: my-app
    image: nginx
    ports:
      - containerPort: 80
    livenessProbe:
      httpGet:
        path: /
        port: 80
      initialDelaySeconds: 10
      periodSeconds: 5
    readinessProbe:
      httpGet:
        path: /
        port: 80
      initialDelaySeconds: 5
      periodSeconds: 5
```{{copy}}

Ahora podemos desplegar nuestra aplicación ejecutando el siguiente comando:

```bash
kubectl apply -f pod.yaml
```{{exec}}