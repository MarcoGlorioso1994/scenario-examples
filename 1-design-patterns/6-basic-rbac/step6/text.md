En este paso, verificaremos los permisos de los dos usuarios definidos en el archivo de configuración `rbac.kubeconfig`.

Ejecutaremos comandos para listar los Pods o leer los Secrets a nivel de clúster en Kubernetes.

Como primer paso, verifiquemos que el usuario `pod-manager` puede listar los Pods y los ConfigMaps en el namespace `rbac-lab`.

Para ello, ejecuta los siguientes comandos para crear un pod:

```bash
kubectl --kubeconfig=rbac.kubeconfig run nginx --image=nginx
```{{exec}}

```bash
kubectl --kubeconfig=rbac.kubeconfig get pods --namespace rbac-lab
kubectl --kubeconfig=rbac.kubeconfig get configmaps --namespace rbac-lab
```{{exec}}

Ahora, intenta eliminar un pod usando el usuario `pod-manager` (debería fallar):

```bash
kubectl delete pod <pod-name> --namespace rbac-lab
```{{copy}}

Si todo está configurado correctamente, este comando debería fallar, ya que el usuario `pod-manager` no tiene permisos de eliminación.

Verifiquemos que el usuario `secret-reader` puede listar Secrets a nivel de clúster.

Para ello, cambiamos el contexto en nuestro clúster para utilizar el usuario `secret-reader`. Ejecuta el siguiente comando:

```bash
kubectl config --kubeconfig=rbac.kubeconfig use-context secret-manager-kubernetes
```{{exec}}

Ahora, intenta listar los Secrets de todos los namespaces:

```bash
kubectl get secrets --all-namespaces
```{{exec}}