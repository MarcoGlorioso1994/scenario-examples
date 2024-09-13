Ahora deseamos crear un deployment que puedas consumir el PVC creado en el paso anterior. 

Creamos el archivo `deployment.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: storageclass-dp
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx
          volumeMounts:
            - name: my-pvc-volume
              mountPath: /mnt/data
      volumes:
        - name: my-pvc-volume
          persistentVolumeClaim:
            claimName: local-pvc
```{{copy}}

Ahora podemos desplegar el Deployment ejecutando el siguiente comando:

```bash
kubectl apply -f deployment.yaml
```{{exec}}

Para comprobar que los pods se han iniciado correctamente, podemos ejecutar el siguiente comando:

```bash
kubectl get pods -o wide
```{{exec}}

Revisamos en estado del PVC despues la creacion de unos cosumidor por eso, ejecutando el siguiente comando:

```bash
kubectl get pvc
```{{exec}}

Deberías ver el **Persistent Volume Claim (PVC)** con el nombre `local-pvc`, donde en la columna **STATUS** aparece el valor `Bound` y la columna **VOLUME** está rellenada con el nombre de un PV que se ha creado de forma automática. Aquí es donde finalmente vemos el aprovisionamiento dinámico. El **Persistent Volume** se ha creado automáticamente utilizando la **StorageClass**, y no es necesario que un administrador de Kubernetes proporcione los PVs listos. Basta con definir las StorageClasses, y luego Kubernetes se encargará de crear los PVs cuando sea necesario.

Un aspecto interesante a analizar es que, en el despliegue de dos réplicas, se ha creado solo un PV. Esto significa que el PV se comparte entre los dos pods. 