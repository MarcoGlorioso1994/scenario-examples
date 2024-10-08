Ahora, aplicaremos un `SecurityContext` a nivel de contenedor para asegurarnos de que el contenedor no se ejecute como root y restringiremos algunas capacidades del kernel.

Creamos un archivo `container-securitycontext.yaml` con el siguiente contenido:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: secure-container
spec:
  securityContext:
    runAsUser: 1000
  containers:
  - name: sec-ctx-demo-2
    image: gcr.io/google-samples/hello-app:2.0
    securityContext:
      runAsUser: 2000
      allowPrivilegeEscalation: false
```{{copy}}

Ahora podemos aplicar el manifiesto para crear el Pod con el contenedor con su SecurityContext:

```bash
kubectl apply -f container-securitycontext.yaml
```{{exec}}

Comprobamos que el Pod está en ejecución: 

```bash
kubectl get pods
```{{exec}}

Nos conectamos el container para la configuracion que hemos aplicado:

```bash
kubectl exec -it secure-container -- //bin/sh -c "ps aux"
```{{exec}}

La salida muestra que los procesos se están ejecutando como el usuario 2000. Este es el valor de `runAsUser` especificado para el Contenedor. Sobrescribe el valor 1000 que está especificado para el Pod.