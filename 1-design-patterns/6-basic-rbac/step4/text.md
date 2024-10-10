Crea un ClusterRoleBinding para vincular el ClusterRole que otorga acceso de lectura a los Secrets a nivel de clúster al ServiceAccount `default` del namespace `rbac-qa`.

Crea un archivo llamado `clusterrolebinding-secret.yaml` con el siguiente contenido:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: secret-reader-binding
subjects:
- kind: ServiceAccount
  name: default
  namespace: rbac-qa
roleRef:
  kind: ClusterRole
  name: secret-reader
  apiGroup: rbac.authorization.k8s.io
```{{copy}}

Aplica el ClusterRoleBinding:

```bash
kubectl apply -f clusterrolebinding-secret.yaml
```{{exec}}

Esto vincula el ClusterRole `secret-reader` con el ServiceAccount `default` del namespace `rbac-qa`.