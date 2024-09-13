Como primer paso, crearemos un `StorageClass`. 

Para ello, creamos el archivo `storageclass.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: local-storage
volumeBindingMode: WaitForFirstConsumer
provisioner: rancher.io/local-path
```{{copy}}

Para crear una `StorageClass` con almacenamiento local, se ha utilizado un `provisioner` externo llamado `rancher.io/local-path`. Sin embargo, esto no resulta relevante para los fines de este laboratorio.

Ahora podemos crear la StorageClass ejecutando el siguiente comando:

```bash
kubectl apply -f storageclass.yaml
```{{exec}}

Para comprobar que la StorageClass se han inicializado correctamente, podemos ejecutar un comando `kubectl get storageclass`,

```bash
kubectl get storageclass
```{{exec}}

Deberías ver la **StorageClass** con el nombre `local-storage`, y en la columna **VOLUMEBINDINGMODE** el valor `WaitForFirstConsumer`, lo que significa que el **Persistent Volume** solo se creará cuando haya un recurso que lo necesite para ser consumido.