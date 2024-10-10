Como primer paso, creamos el namespace `rbac-dev` con el siguiente contenido:

```bash
kubectl create namespace rbac-dev
```{{exec}}

Al crear un nuevo namespace, automáticamente se genera una ServiceAccount por defecto. Verificamos que la ServiceAccount esté presente en el namespace `rbac-dev`:

```bash
kubectl get serviceaccount -n rbac-dev
```{{exec}}

Continuamos creando un Role que otorgue permisos para gestionar los Pods y los ConfigMaps dentro del namespace `rbac-dev`.

Creamos un archivo YAML llamado `role-configmap-pod.yaml` con el siguiente contenido:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: rbac-dev
  name: configmap-pod-manager
rules:
- apiGroups: [""]
  resources: ["pods", "configmaps"]
  verbs: ["create", "get", "list"]
```{{copy}}

Aplicamos el Role al clúster:

```bash
kubectl apply -f role-configmap-pod.yaml
```{{exec}}

Este Role otorga permisos para gestionar Pods y ConfigMaps en el namespace `rbac-dev`.