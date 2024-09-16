Terminemos este laboratorio solucionando el fallo en el despliegue.

En este caso, el contenedor está fallando intencionalmente, por lo que podríamos "solucionar" el problema actualizando el comando del contenedor para que no falle. Para corregir esto, modificamos el archivo `deployment.yaml` eliminando el comando que causa el fallo en el contenedor busybox. 

Actualizamos el archivo `deployment.yaml` de la siguiente manera:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: multi-container-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: multi-container-app
  template:
    metadata:
      labels:
        app: multi-container-app
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
      - name: healthy-container
        image: busybox
        command: ['sh', '-c', 'echo "This is now a healthy container"; sleep 3600']
```{{copy}}

Desplugas los cambios ejecutando el siguiente comando:

```bash
kubectl apply -f deployment.yaml
```{{exec}}

Ahora, podemos verificar que el problema se haya resuelto, vamos a interrogar kubectl sobre nuestro pods: 

```bash
kubectl get pods
```{{exec}}

El pod debería estar en estado "Running", lo que indica que ambos contenedores están funcionando correctamente.

Como ultimo paso, revisamos nuevamente los logs del segundo contenedor para confirmar que ya no está fallando:

```bash
kubectl logs <nombre-del-pod> -c healthy-container
```{{exec}}

deberíamos ver el mensaje "This is now a healthy container" y no más fallos.