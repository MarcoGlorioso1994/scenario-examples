Primero, recopilamos información sobre nuestro clúster de Kubernetes.

```bash
kubectl cluster-info
```{{exec}}

La salida se verá algo como esto:

```bash
Kubernetes control plane is running at https://<api-server-ip>:<port>
CoreDNS is running at https://<coredns-ip>:<port>
```
Copia y guarda la URL HTTP del plano de control de Kubernetes, ya que la utilizaremos en el siguiente paso.

Hemos creado un archivo de configuración llamado `rbac.kubeconfig` para este laboratorio, con el fin de crear usuarios y realizar pruebas durante la sesión.

A continuación, modificaremos el archivo `rbac.kubeconfig` sustituyendo el valor del campo `server` por la URL del clúster que hemos guardado en el paso anterior.

```bash
vi rbac.kubeconfig
```{{exec}}

Verificamos que los cambios se han guardado correctamente:

```bash
kubectl config --kubeconfig=rbac.kubeconfig view
```{{exec}}

Podemos observar que hay dos usuarios: `pod-manager` y `secret-reader`, cada uno con sus respectivos contextos.
Selecionamos el contexto pod-manager-kubernetes con el siguiente comando:

```bash
kubectl config --kubeconfig=rbac.kubeconfig use-context pod-manager-kubernetes
```{{exec}}

Verificamos, como último paso inicial, que el usuario `pod-manager` carece de los permisos necesarios para listar los pods.

```bash
kubectl --kubeconfig=rbac.kubeconfig get pods
```{{exec}}

Deberías recibir un mensaje de error que contenga la palabra **Forbidden** y una explicación de que el usuario no puede ver los pods debido a la falta de permisos.