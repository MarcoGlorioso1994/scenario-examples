

### Objetivos:
1. Crear y asignar un **Role** dentro de un namespace.
2. Crear y asignar un **ClusterRole** a nivel de clúster.
3. Validar los permisos utilizando usuarios o cuentas de servicio.

Primero, crea un namespace llamado `rbac-lab` donde se realizarán las configuraciones de RBAC.

Ejecutamos el siguiente comando:

```bash
kubectl create namespace rbac-lab
```{{exec}}

Empecemos creando un Role que otorgue permisos para gestionar los Pods y los ConfigMaps dentro del namespace rbac-lab.

Crea un archivo YAML llamado `role-configmap-pod-manager.yaml` con el siguiente contenido:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: rbac-lab
  name: configmap-pod-manager
rules:
- apiGroups: [""]
  resources: ["pods", "configmaps"]
  verbs: ["create", "get", "list", "delete"]
```{{copy}}

Aplicamos el Role al clúster:

```bash
kubectl apply -f role-configmap-pod-manager.yaml
```{{exec}}

Este rol concede permisos completos sobre los Pods y ConfigMaps en el espacio de nombres "rbac-lab".