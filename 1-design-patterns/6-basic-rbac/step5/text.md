En este paso, verificaremos los permisos de las dos cuentas de servicio ServiceAccount. 
Ejecutaremos comandos para listar los Pods o leer los Secrets a nivel de clúster en Kubernetes.

Verifiquemos que la cuenta de servicio `sa-manager` puede listar los Pods y los ConfigMaps en el namespace rbac-lab.

Para ello, ejecuta un Pod que utilice la cuenta de servicio sa-manager.

```bash
kubectl run sa-manager-test --rm -i --tty --serviceaccount=sa-manager --namespace=rbac-lab --image=busybox -- sh
```{{exec}}

Desde dentro del pod, intenta listar pods y configmaps:

```bash
kubectl get pods --namespace rbac-lab
kubectl get configmaps --namespace rbac-lab
```{{exec}}

Ahora, intenta eliminar un pod usando usuario-lab (debería fallar): 

```bash
kubectl delete pod <pod-name> --namespace rbac-lab
```{{copy}}

Si todo está configurado correctamente, este comando debería fallar, ya que la ServiceAccount sa-manager no tiene permisos de eliminación.

Verifiquemos que la cuenta de servicio `sa-reader` puede listar Secrets a nivel de clúster.

Para ello, ejecuta un Pod que utilice la cuenta de servicio sa-reader.

```bash
kubectl run sa-reader-test --rm -i --tty --serviceaccount=sa-reader --namespace=rbac-lab --image=busybox -- sh
```{{exec}}

Desde dentro del pod, intenta listar los secrets de todos los namespaces:

```bash
kubectl get secrets --all-namespaces
```{{exec}}