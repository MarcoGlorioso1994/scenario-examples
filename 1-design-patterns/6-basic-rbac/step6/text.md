En este paso, verificaremos los permisos de los dos usuarios definidos en el fichero de configuracion rbac.kubeconfig . 
Ejecutaremos comandos para listar los Pods o leer los Secrets a nivel de clúster en Kubernetes.

Como primer paso, verifiquemos que usuario `pod-manager` puede listar los Pods y los ConfigMaps en el namespace rbac-lab.

Para ello, ejecuta los siguntes comando para crear un pods:

```bash
kubectl --kubeconfig=rbac.kubeconfig run nginx --image=nginx
```{{exec}}

```bash
kubectl --kubeconfig=rbac.kubeconfig get pods --namespace rbac-lab
kubectl --kubeconfig=rbac.kubeconfig get configmaps --namespace rbac-lab
```{{exec}}

Ahora, intenta eliminar un pod usando usuario-lab (debería fallar): 

```bash
kubectl delete pod <pod-name> --namespace rbac-lab
```{{copy}}

Si todo está configurado correctamente, este comando debería fallar, ya que usuario `pod-manager` no tiene permisos de eliminación.

Verifiquemos que usuario `secreat-reader` puede listar Secrets a nivel de clúster.

Para ello, cambiamos el contexto en nuestro cluster para utilizar usuario `secret-reader`. Ejecuta el sigunte comando:

```bash
kubectl config --kubeconfig=rbac.kubeconfig use-context secret-manager-kubernetes
```{{exec}}

Ahora, intenta a listar los secrets de todos los namespaces:

```bash
kubectl get secrets --all-namespaces
```{{exec}}