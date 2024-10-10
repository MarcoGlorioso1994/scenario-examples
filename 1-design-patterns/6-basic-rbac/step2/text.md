
Crea un **RoleBinding** para vincular el **Role** `configmap-pod-manager` con la ServiceAccount `default` en el namespace `rbac-dev`.

Crea un archivo llamado `rolebinding-configmap-pod.yaml` con el siguiente contenido:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: configmap-pod-binding
  namespace: rbac-dev
subjects:
- kind: ServiceAccount
  name: default
  namespace: rbac-dev
roleRef:
  kind: Role
  name: configmap-pod-manager
  apiGroup: rbac.authorization.k8s.io
```{{copy}}

Aplica el RoleBinding:

```bash
kubectl apply -f rolebinding-configmap-pod.yaml
```{{exec}}

Esto vincula el Role `configmap-pod-manager` con a cuenta ServiceAccount `default`.