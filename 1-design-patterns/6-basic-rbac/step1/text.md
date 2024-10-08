Primero, analizamos el fichero de configuracion de nustro cluster Kuberntes para leer la ip de nuestro API server:

```bash
kubectl cluster-info
```{{exec}}

La salida se verá algo como esto:

```bash
Kubernetes control plane is running at https://<api-server-ip>:<port>
CoreDNS is running at https://<coredns-ip>:<port>
```
Copia y guarda la url http del Kubernetes control plane porque la utilizaremos en el sigunete paso. 

Hemos creado un archivo de configuracion llamado rbac.kubeconfig cluster por este laboratorio, al fin de crear unos usuarios y poder ejeutar unas pruebas durante este lab. 

Vamos a modificar el fichero rbac.kubeconfig sostituiendo el valor del campo server por el cluster con el valor que hemos guardado desde el paso anterior.

```bash
vi rbac.kubeconfig
```{{exec}}

kubectl create serviceaccount pod-amanger

Comprobamos que los cambios se han guardado correctamente:

```bash
kubectl config --kubeconfig=rbac.kubeconfig view
```{{exec}}

Podemos ver que hay dos usuarios `pod-manager` y `secret-reader` con dos respectivos contextos. 

Selecionamos el contexto pod-manager-kubernetes con el siguiente comando:

```bash
kubectl config --kubeconfig=rbac.kubeconfig use-context pod-manager-kubernetes
```{{exec}}

Verificamos como ultimo paso inicial que usuario `pod-manager` falta de los permisos necesarios para listar los pods

```bash
kubectl --kubeconfig=rbac.kubeconfig get pods
```{{exec}}

Deberias recibir un mensaje de error contenente la palabra **Forbidden** y una explicacion que usuario non puede ver los pods por una falta de permisos. 