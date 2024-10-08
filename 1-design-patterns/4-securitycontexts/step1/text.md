En este paso, vamos a desplegar un Pod con un `SecurityContext` que ejecutará el contenedor como un usuario no root y le asignará permisos específicos en el sistema de archivos.

Para ello, creamos el archivo `pod-securitycontext.yaml` con el siguiente contenido:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: secure-pod
spec:
  securityContext:
    runAsUser: 1000           # Ejecutar como usuario no root
    runAsGroup: 3000          # Definir grupo
    fsGroup: 2000             # Grupo con permisos en el sistema de archivos
  containers:
  - name: my-app
    image: istio/examples-bookinfo-details-v2
    ports:
      - containerPort: 9080
```{{copy}}

Ahora podemos aplicar el manifiesto para crear el Pod:

```bash
kubectl apply -f pod-securitycontext.yaml
```{{exec}}

Comprobamos que el Pod está en ejecución: 

```bash
kubectl get pods
```{{exec}}

Inspecciona el Pod para ver su SecurityContext:

```bash
kubectl get pod secure-pod -o yaml
```{{exec}}

Descripción de la configuración:

1. **runAsUser**: 1000 
Descripción: Especifica que el contenedor se ejecutará como el usuario con el UID (User ID) 1000 en lugar del usuario root (UID 0).
Razón para usarlo: Ejecutar contenedores como un usuario no root mejora la seguridad. Si un atacante logra comprometer el contenedor, no tendrá acceso completo al sistema operativo del nodo, ya que estará limitado a los permisos del usuario especificado.

2. **runAsGroup**: 3000
Descripción: Este parámetro define el GID (Group ID) del grupo al que pertenecerá el contenedor, en este caso, el grupo con GID 3000.
Razón para usarlo: Al igual que runAsUser, establecer un grupo no root ayuda a limitar los permisos del contenedor. Permite gestionar el acceso a archivos y recursos del sistema basados en el grupo, brindando un control adicional sobre la seguridad.

3. **fsGroup**: 2000
Descripción: Este parámetro define un GID adicional para los procesos dentro del contenedor. Cuando se establece fsGroup, Kubernetes aplica este GID a todos los volúmenes montados en el pod.
Razón para usarlo: Esto es útil cuando los contenedores necesitan acceder a volúmenes compartidos. Al establecer fsGroup, los archivos en esos volúmenes se asignan al GID especificado, permitiendo que los procesos dentro del contenedor tengan acceso a esos archivos, incluso si no son el dueño directo. Esto es especialmente útil en entornos donde varios contenedores necesitan acceder a los mismos volúmenes con diferentes usuarios.