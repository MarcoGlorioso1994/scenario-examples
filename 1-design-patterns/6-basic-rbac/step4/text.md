Crea un ClusterRoleBinding para vincular el ClusterRole, con acceso de lectura de Secrets a nivel de clúster, a la ServiceAccount `sa-reader`.

Crea un archivo llamado `clusterrolebinding-sa-reader.yaml` con el siguiente contenido:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: secret-reader-binding
subjects:
- kind: ServiceAccount
  name: sa-reader
  namespace: rbac-lab
roleRef:
  kind: ClusterRole
  name: secret-reader
  apiGroup: rbac.authorization.k8s.io
```{{copy}}

Aplica el ClusterRoleBinding:

```bash
kubectl apply -f clusterrolebinding-sa-reader.yaml
```{{exec}}

Esto vincula el ClusterRole secret-reader con la ServiceAccount sa-reader.