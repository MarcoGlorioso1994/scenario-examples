Crea un **RoleBinding** para vincular el **Role** `configmap-pod-manager` al usuario `usuario-lab` en el namespace `rbac-lab`.

Crea un archivo llamado `rolebinding-configmap-pod-binding.yaml` con el siguiente contenido:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: configmap-pod-binding
  namespace: rbac-lab
subjects:
- kind: User
  name: "usuario-lab"
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: configmap-pod-manager
  apiGroup: rbac.authorization.k8s.io
```{{copy}}

Aplica el RoleBinding:

```bash
kubectl apply -f rolebinding-configmap-pod-binding.yaml
```{{exec}}

Crea un ClusterRoleBinding para otorgar acceso de lectura de Secrets a nivel de clúster al usuario `usuario-cluster`.

Crea un archivo llamado `clusterrolebinding-secret-reader-binding.yaml` con el siguiente contenido:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: secret-reader-binding
subjects:
- kind: User
  name: "usuario-cluster"
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: secret-reader
  apiGroup: rbac.authorization.k8s.io
```{{copy}}

Aplica el ClusterRole:

```bash
kubectl apply -f clusterrolebinding-secret-reader-binding.yaml
```{{exec}}