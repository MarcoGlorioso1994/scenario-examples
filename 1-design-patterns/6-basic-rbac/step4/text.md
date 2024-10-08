En este paso, vamos a verificar los permisos de los dos usuarios.

Verifica que el usuario `usuario-lab` puede listar pods y configmaps:

```bash
kubectl get pods --namespace rbac-lab
kubectl get configmaps --namespace rbac-lab
```{{exec}}

Verifica que `usuario-cluster` puede listar Secrets a nivel de clúster:

```bash
kubectl get secrets --all-namespaces
```{{exec}}

Ahora, intenta eliminar un pod usando usuario-lab (debería fallar): 

```bash
kubectl delete pod <pod-name> --namespace rbac-lab
```{{copy}}

Si todo está configurado correctamente, usuario-lab no debería tener permisos de eliminación.