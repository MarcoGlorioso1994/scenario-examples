Ahora, necesitamos de un `Persistent Volume Claim`. 

Creamos el archivo `pvc.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  storageClassName: ""
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```{{copy}}

El campo `storageClassName` con valor `""` forza el PVC a utilizar el provisioning statico, que signica que el PVC busca un volume con lo requisitos definidos entre lo PV ya existentes.

```bash
kubectl get storageclass
```{{exec}}

Ahora podemos desplegar el Persistent Volume Claim ejecutando el siguiente comando:

```bash
kubectl apply -f pvc.yaml
```{{exec}}

Para comprobar que el PVC se han inicializado correctamente, podemos ejecutar el comando `kubectl get pvc`,

```bash
kubectl get pvc
```{{exec}}

Deberías ver el Persistent Volume Claim (PVC) con el nombre `my-pvc`, donde en la columna **STATUS** aparece el valor `Bound`, y en la columna **VOLUMES** el valor `my-pv` (nombre del PV creado en el paso anterior). Esta salida indica que la solicitud de un volumen persistente (PVC) ha encontrado un volumen que cumple con los requisitos de la solicitud y se ha vinculado con él. Ahora, el PVC está listo para ser utilizado por un Pod o un Deployment.