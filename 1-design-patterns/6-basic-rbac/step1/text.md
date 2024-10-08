Primero, crea un namespace llamado `rbac-lab` donde se realizarán las configuraciones de RBAC.

Ejecutamos el siguiente comando:

```bash
kubectl create namespace rbac-lab
```{{exec}}

Ahora, en lugar de asignar permisos a un usuario, vamos a trabajar con ServiceAccounts. Comenzaremos creando un Role que permita a una ServiceAccount gestionar pods y configmaps en el namespace rbac-lab.

Creamos un ServiceAccount ejecutando el siguiente comando:

```bash
kubectl create serviceaccount sa-manager --namespace rbac-lab
```{{exec}}

Esto creará una ServiceAccount llamada `sa-manager` en el namespace `rbac-lab`.

Seguimos creando un Role que otorgue permisos para gestionar los Pods y los ConfigMaps dentro del namespace rbac-lab.
Creamos un archivo YAML llamado `role-configmap-pod-manager.yaml` con el siguiente contenido:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: rbac-lab
  name: configmap-pod-manager
rules:
- apiGroups: [""]
  resources: ["pods", "configmaps"]
  verbs: ["create", "get", "list", "delete"]
```{{copy}}

Aplicamos el Role al clúster:

```bash
kubectl apply -f role-configmap-pod-manager.yaml
```{{exec}}

Este Role otorga permisos para gestionar pods y configmaps en el namespace rbac-lab para la ServiceAccount.