Ahora, aplicaremos un `SecurityContext` a nivel de contenedor para asegurarnos de que el contenedor no se ejecute como root y restringiremos algunas capacidades del kernel.

Creamos un archivo `container-securitycontext.yaml` con el siguiente contenido:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: secure-container
spec:
  containers:
  - name: nginx
    image: nginx:latest
    securityContext:
      allowPrivilegeEscalation: false # Bloquear la escalada de privilegios
      capabilities:
        drop:                        # Eliminar capacidades adicionales
        - NET_ADMIN
        - SYS_TIME
    ports:
    - containerPort: 80
```{{copy}}

Ahora podemos aplicar el manifiesto para crear el Pod con el contenedor con su SecurityContext:

```bash
kubectl apply -f container-securitycontext.yaml
```{{exec}}

Comprobamos que el Pod está en ejecución: 

```bash
kubectl get pods
```{{exec}}

Inspecciona el Pod para ver su SecurityContext:

```bash
kubectl describe pod secure-container
```{{exec}}