Para resolver el problema, necesitamos agregar una StorageClass o especificar una existente en el PVC.

Vamos a crear una StorageClass que use el aprovisionador `rancher.io/local-path` con eso podemos crear PVs en nuestro entorno local. 

Para ello, creamos el archivo `storageclass.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: standard
provisioner: rancher.io/local-path
volumeBindingMode: WaitForFirstConsumer
```{{copy}}

Ahora podemos desplegar la StorageClass ejecutando el siguiente comando:

```bash
kubectl apply -f storageclass.yaml
```{{exec}}

Modificamos el PVC para usar la nueva StorageClass. Replazamos el `archivo pvc-pod.yaml` con el siguiente código:

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  storageClassName: standard  # Nombre actualizado 
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
      claimName:\ my-pvc
```{{copy}}

Aplicamos los archivos para crear el PVC y el Pod:

```bash
kubectl apply -f pvc-pod.yaml
```{{exec}}