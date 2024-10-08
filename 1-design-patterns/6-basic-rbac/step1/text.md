Primero, analizamos el fichero de configuracion de nustro cluster Kuberntes para leer la ip de nuestro API server:

```bash
kubectl config view
```{{exec}}

Copia y guarda la url del de API Server dentro en cluster Kubernetes. 

Hemos creado un archivo de configuracion llamado rbac.kubeconfig cluster por este laboratorio, al fin de crear unos usuarios y poder ejeutar unas pruebas durante este lab. 

Vamos a modificar el fichero rbac.kubeconfig sostituiendo el valor del campo server por el cluater con el valor que has guardado desde el paso anterior.

```bash
vi rbac.kubeconfig
```{{exec}}

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
kubectl --kubeconfig=developer.kubeconfig get pods
```{{exec}}

Deberias recibir un mensaje de error contenente la palabra **Forbidden** y una explicacion que usuario non puede ver los pods por una falta de permisos. 