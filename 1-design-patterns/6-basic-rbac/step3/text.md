Ahora crearemos un ClusterRole que permita a la ServiceAccount sa-reader leer Secrets en todo el clúster.

Creamos una ServiceAccount ejecutando el siguiente comando:

```bash
kubectl create serviceaccount sa-reader --namespace rbac-lab
```{{exec}}

Esto creará una ServiceAccount llamada `sa-reader` en el namespace `rbac-lab`.

Seguimos creando un ClusterRole que otorgue permisos para leer Secrets a nivel global en el clúster.
Creamos un archivo YAML llamado `clusterrole-secret-reader.yaml` con el siguiente contenido:

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