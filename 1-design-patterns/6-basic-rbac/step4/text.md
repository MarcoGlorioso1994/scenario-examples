Ahora crearemos un ClusterRole que permita al usuario `secret-reader` leer Secrets en todo el clúster.

A continuación, creamos un ClusterRole que otorgue permisos para leer Secrets a nivel global en el clúster. Creamos un archivo YAML llamado `clusterrole-secret-reader.yaml` con el siguiente contenido:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: secret-reader
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["get", "list"]
```{{copy}}

Aplicamos el ClusterRole al clúster:

```bash
kubectl apply -f clusterrole-secret-reader.yaml
```{{exec}}