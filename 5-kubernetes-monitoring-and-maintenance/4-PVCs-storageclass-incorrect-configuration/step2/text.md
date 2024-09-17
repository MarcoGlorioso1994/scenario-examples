En este paso, vamos a verificar el estado del PVC, usaremos el comando kubectl describe para obtener más detalles sobre el PVC y ver por qué está en estado Pending:

```bash
kubectl describe pvc my-pvc
```{{exec}}

Veremos un mensaje de error similar a "storageclass.storage.k8s.io "wrong-name-storageclass" not found", lo que indica la falta de una StorageClass para el PVC.

Usamos, una vez maz, el comando `kubectl describe` para revisar los eventos asociados con el pod. Esto también nos dará más información sobre por qué el pod no se pudo ejecutar correctamente:

```bash
kubectl describe pod my-pvc-pod
```{{exec}}

En la sección "Events", es probable que veamos mensajes relacionados con el fallo de aprovisionamiento de volúmenes debido a la falta de una StorageClass.