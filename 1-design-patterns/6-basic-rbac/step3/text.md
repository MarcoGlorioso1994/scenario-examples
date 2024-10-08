Crea un **RoleBinding** para vincular el **Role** `configmap-pod-manager` con usuario `pod-manager` en el namespace `rbac-lab`.

Crea un archivo llamado `rolebinding-pod-manager.yaml` con el siguiente contenido:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: configmap-pod-binding
  namespace: rbac-lab
subjects:
- kind: user
  name: pod-manager
  namespace: rbac-lab
roleRef:
  kind: Role
  name: configmap-pod-manager
  apiGroup: rbac.authorization.k8s.io
```{{copy}}

Aplica el RoleBinding:

```bash
kubectl apply -f rolebinding-pod-manager.yaml
```{{exec}}

Esto enlaza el Role `configmap-pod-manager` con usuario `pod-manager`.