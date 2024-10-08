Crea un ClusterRoleBinding para vincular el ClusterRole, que otorga acceso de lectura de Secrets a nivel de clúster, al usuario `secret-reader`.

Crea un archivo llamado `clusterrolebinding-secret-reader.yaml` con el siguiente contenido:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: secret-reader-binding
subjects:
- kind: User
  name: secret-reader
  namespace: rbac-lab
roleRef:
  kind: ClusterRole
  name: secret-reader
  apiGroup: rbac.authorization.k8s.io
```{{copy}}

Aplica el ClusterRoleBinding:

```bash
kubectl apply -f clusterrolebinding-secret-reader.yaml
```{{exec}}

Esto vincula el ClusterRole `secret-reader` con el usuario `secret-reader`.