Creamos el archivo `pvc-local.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: local-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
  storageClassName: local-storage
```{{copy}}

El campo `storageClassName` con el valor `local-storage` obliga al PVC a utilizar el aprovisionamiento dinámico. Esto significa que el PVC creará un PV basándose en las especificaciones definidas en la **StorageClass** llamada `local-storage`.

Ahora podemos desplegamos el Persistent Volume Claim ejecutando el siguiente comando:

```bash
kubectl apply -f pvc.yaml
```{{exec}}

Revisamos en estado del PVC creado, ejecutando el siguiente comando:

```bash
kubectl get pvc
```{{exec}}

Deberías ver el Persistent Volume Claim (PVC) con el nombre `local-pvc`, donde en la columna **STATUS** aparece el valor `Pending`. Esta salida indica que la solicitud del PVC ha leído los detalles desde la StorageClass `local-storage` y está a la espera de un consumidor para proceder con la creación de un Persistent Volume.