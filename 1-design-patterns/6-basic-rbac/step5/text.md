En este paso, verificaremos los permisos de las dos cuentas ServiceAccounts. Debes saber que cuando creamos un pod, Kubernetes asocia automáticamente la ServiceAccount `default` al pod.

Además, para verificar los permisos, utilizaremos la imagen de Docker `luksa/kubectl-proxy`. Esta imagen nos permitirá llamar a las API server de Kubernetes desde dentro del contenedor. Imagina que es un cliente `kubectl` dentro del contenedor.

Para ello, ejecuta los siguientes comandos para crear un pod con la imagen de Docker `luksa/kubectl-proxy` en el namespace `rbac-dev`:

```bash
kubectl run test --image=luksa/kubectl-proxy -n rbac-dev
```{{exec}}

Verificamos que el pod está correctamente desplegado:

```bash
kubectl get pods -n rbac-dev
```{{exec}}

Ahora nos podemos conectar al pod:

```bash
kubectl exec -it test -n rbac-dev -- sh
```{{exec}}

Para verificar los permisos asociados con el Role `configmap-pod-manager`, comenzamos a interrogar las API de Kubernetes sobre los pods. Ejecutamos la primera solicitud HTTP:

```bash
curl localhost:8001/api/v1/namespaces/rbac-dev/pods
```{{exec}}

Deberías recibir los detalles de los pods en el namespace `rbac-dev`.

Ahora probamos a crear un nuevo pod en el namespace. Para hacerlo, crea un archivo `pod.yaml` con la definición de un pod básico de Nginx, con el nombre `nginx-basic`. Una vez hecho esto, ejecutamos una solicitud POST HTTP hacia las API Server de Kubernetes:

```bash
curl -X POST --data-binary "@pod.yaml" -H 'Content-Type: application/yaml' localhost:8001/api/v1/namespaces/rbac-dev/pods
```{{exec}}

Tendrías que ver que la operación de creación del pod nginx-basic se ha completado con éxito.

Ahora podemos comprobar que el ServiceAccount no tiene permisos para eliminar el pod nginx-basic. Para ello, ejecutamos una solicitud DELETE HTTP hacia las API Server de Kubernetes:

```bash
curl -X DELETE localhost:8001/api/v1/namespaces/rbac-dev/pods/nginx-basic
```{{exec}}

Deberías recibir un error 403 "Forbidden". Esto significa que la cuenta de servicio en el namespace rbac-dev no tiene los permisos suficientes para eliminar un pod.

A continuación, salimos del pod y comprobamos que realmente existe el pod nginx-basic en el namespace rbac-dev:

```bash
kubectl get pods -n rbac-dev
```{{exec}}
 
Continuamos verificando los permisos de la segunda cuenta de servicio definida en el namespace rbac-qa. Para ello, crearemos un pod en el namespace rbac-qa.

```bash
kubectl run test --image=luksa/kubectl-proxy -n rbac-qa
```{{exec}}

Verificamos que el pod está correctamente desplegado:

```bash
kubectl get pods -n rbac-qa
```{{exec}}

Y podemos conectarnos al pod:

```bash
kubectl exec -it test -n rbac-qa -- sh
```{{exec}}

Para verificar los permisos asociados con el ClusterRole secret-reader, interrogamos las API de Kubernetes para obtener los secrets a nivel de clúster. Ejecutamos la siguiente solicitud HTTP:

```bash
curl localhost:8001/api/v1/secrets
```{{exec}}

Deberías recibir la lista de los secrets definidos en el clúster de Kubernetes. Es importante notar que en la URL HTTP hemos omitido la parte de la ruta que indicaba el namespace. Esto es correcto porque queremos enviar la solicitud a nivel de clúster. Hemos definido un ClusterRole para otorgar permisos a nivel global en el clúster.