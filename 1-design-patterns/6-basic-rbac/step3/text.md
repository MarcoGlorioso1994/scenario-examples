Creamos un nuevo namespace `rbac-qa` con el siguiente contenido:

```bash
kubectl create namespace rbac-qa
```{{exec}}

Al crear un nuevo namespace, automáticamente se genera un ServiceAccount por defecto. Verificamos que exista un ServiceAccount en el namespace `rbac-qa`:

```bash
kubectl get serviceaccount -n rbac-qa
```{{exec}}

Ahora crearemos un ClusterRole que permita al ServiceAccount `default` leer Secrets en todo el clúster.

Para ello, creamos un ClusterRole que otorgue permisos para leer Secrets a nivel global en el clúster. Creamos un archivo YAML llamado `clusterrole-secret.yaml` con el siguiente contenido:

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
kubectl apply -f clusterrole-secret.yaml
```{{exec}}