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
    runAsGroup: 3000
    fsGroup: 2000
    supplementalGroups: [4000]
  volumes:
  - name: sec-ctx-vol
    emptyDir: {}
  containers:
  - name: sec-ctx-demo
    image: busybox:1.28
    command: [ "sh", "-c", "sleep 1h" ]
    volumeMounts:
    - name: sec-ctx-vol
      mountPath: /data/demo
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