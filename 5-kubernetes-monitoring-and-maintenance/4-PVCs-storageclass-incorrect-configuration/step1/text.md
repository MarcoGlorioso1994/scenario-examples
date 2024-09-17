Como primer paso, crearemos un archivo YAML para desplegar un PersistentVolumeClaim (PVC) y un pod que lo utilice. El PVC intentará solicitar almacenamiento, pero especificaremos una StorageClass que aún no existe para provocar un error.

Para ello, creamos el archivo `pvc-pod.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  storageClassName: wrong-name-storageclass
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
---
apiVersion: v1
kind: Pod
metadata:
  name: my-pvc-pod
spec:
  containers:
  - name: my-container
    image: nginx
    volumeMounts:
    - mountPath: "/usr/share/nginx/html"
      name: my-storage
  volumes:
  - name: my-storage
    persistentVolumeClaim:
      claimName: my-pvc
```{{copy}}

El PersistentVolumeClaim (PVC) solicita 1Gi de almacenamiento con acceso ReadWriteOnce. Hemos especificado el nombre de una StorageClass que no existe en nuestro clúster, lo que genera un fallo en la configuración de nuestra aplicación. El pod utiliza la imagen de nginx y monta el PVC en el directorio /usr/share/nginx/html.

Aplicamos los archivos para crear el PVC y el Pod:

```bash
kubectl apply -f pvc-pod.yaml
```{{exec}}

Verifica que el PVC y el pod se hayan creado:

```bash
kubectl get pvc
```{{exec}}

Vemos que el PVC se encuentra en un estado de Pending porque no puede encontrar una StorageClass llamada "wrong-name-storageclass".

```bash
kubectl get pods
```{{exec}}

De igual manera, el pod permanece en un estado de Pending porque no puede obtener el volumen persistente solicitado a través del PVC.