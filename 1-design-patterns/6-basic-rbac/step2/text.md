Seguimos creando un Role que otorgue permisos para gestionar los Pods y los ConfigMaps dentro del namespace rbac-lab.
Creamos un archivo YAML llamado `role-configmap-pod-manager.yaml` con el siguiente contenido:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: rbac-lab
  name: configmap-pod-manager
rules:
- apiGroups: [""]
  resources: ["pods", "configmaps"]
  verbs: ["create", "get", "list"]
```{{copy}}

Aplicamos el Role al clúster:

```bash
kubectl apply -f role-configmap-pod-manager.yaml
```{{exec}}

Este Role otorga permisos para gestionar pods y configmaps en el namespace rbac-lab por los usuarios.