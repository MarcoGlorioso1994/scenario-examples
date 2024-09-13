Como primer paso, crearemos un `Persistent Volume`. 

Para ello, creamos el archivo `pv.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-pv
spec:
  capacity:
    storage: 1Gi
  volumeMode: Filesystem
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mnt/data"
```{{copy}}

Ahora podemos desplegar el Persistent Volume ejecutando el siguiente comando:

```bash
kubectl apply -f pv.yaml
```{{exec}}

Para comprobar que el Persistent Volume se han inicializado correctamente, podemos ejecutar el siguiente comando

```bash
kubectl get pv
```{{exec}}

Tendrías que ver el volume persistente (PV) con nombre `my-pv` y en la columna **STATUS** el valor `Available`, que significa que el volume se ha creado correctamente y esta disponible para ser utilizado da un Persistent Volume Claim. 