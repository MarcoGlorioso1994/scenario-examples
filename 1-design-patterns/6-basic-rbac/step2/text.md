A continuación, vamos a crear un `ClusterRole` para otorgar permisos a nivel de clúster. 

Crea un archivo llamado `clusterrole-secret-reader.yaml` con el siguiente contenido:

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

Aplica el ClusterRole:

```bash
kubectl apply -f clusterrole-secret-reader.yaml
```{{exec}}

Este ClusterRole otorga permisos para leer Secrets a nivel de clúster.