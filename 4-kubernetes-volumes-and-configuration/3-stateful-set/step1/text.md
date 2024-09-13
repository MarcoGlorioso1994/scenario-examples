Como primer paso, crearemos un `Statefulset`. 

Para ello, creamos el archivo `statefulset.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: my-statefulset
spec:
  selector:
    matchLabels:
      app: nginx
  serviceName: "nginx"
  replicas: 3
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
        volumeMounts:
        - name: state-volume
          mountPath: /mnt/data
  volumeClaimTemplates:
  - metadata:
      name: state-volume
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 1Gi
```{{copy}}

Ahora podemos desplegar el StatefulSet ejecutando el siguiente comando:

```bash
kubectl apply -f statefulset.yaml
```{{exec}}

Para comprobar que los 3 pods se han inicializado correctamente, podemos ejecutar el siguiente comando:

```bash
kubectl get pods
```{{exec}}

Resulta interesante ver cómo los 3 pods tienen un nombre creciente y único, y que el orden de creación es sincrónico y ordenada, el pod con índice 1 se crea después del pod con índice 0.