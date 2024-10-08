Crea un **RoleBinding** para vincular el **Role** `configmap-pod-manager` con la ServiceAccount en el namespace `rbac-lab`.

Crea un archivo llamado `rolebinding-sa-manager.yaml` con el siguiente contenido:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: configmap-pod-binding
  namespace: rbac-lab
subjects:
- kind: ServiceAccount
  name: sa-manager
  namespace: rbac-lab
roleRef:
  kind: Role
  name: configmap-pod-manager
  apiGroup: rbac.authorization.k8s.io
```{{copy}}

Aplica el RoleBinding:

```bash
kubectl apply -f rolebinding-sa-manager.yaml
```{{exec}}

Esto enlaza el Role `configmap-pod-manager` con la ServiceAccount `sa-manager`.