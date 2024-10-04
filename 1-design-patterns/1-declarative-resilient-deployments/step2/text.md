Modificamos el Deployment para escalar a 5 réplicas:

```bash
kubectl scale deployment nginx-deployment --replicas=5
```{{exec}}

Verificamos que se ha escalado correctamente:

```bash
kubectl get deployments
kubectl get pods
```{{exec}}

Deberías ver que Kubernetes ha iniciado el proceso de escalado, y en la columna **UP-TO-DATE** debería aparecer el valor `5`. En la columna **READY**, observarás un valor incremental a medida que se añaden las réplicas al Deployment. Al ejecutar el segundo comando, deberías ver que ahora hay 5 pods desplegados correctamente.