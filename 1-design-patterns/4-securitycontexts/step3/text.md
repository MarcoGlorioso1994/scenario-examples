En este paso, forzaremos el uso de un sistema de archivos de solo lectura, impidiendo que el contenedor modifique el sistema de archivos raíz.

Para ello, creamos el archivo `readonly-filesystem.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: readonly-pod
spec:
  containers:
  - name: my-app
    image: istio/examples-bookinfo-details-v2
    securityContext:
      readOnlyRootFilesystem: true   # Forzar el sistema de archivos de solo lectura
    ports:
    - containerPort: 80
```{{copy}}

Ahora podemos aplicar el manifiesto para crear el Pod con el contenedor con su SecurityContext:

```bash
kubectl apply -f readonly-filesystem.yaml
```{{exec}}

Comprobamos que el Pod está en ejecución: 

```bash
kubectl get pods
```{{exec}}

Como primer paso, nos conectamos al contenedor dentro del pod ejecutando el siguiente comando para abrir una sesión interactiva con el contenedor:

```bash
kubectl exec -it readonly-pod  -- //bin/bash
```{{exec}}

Ahora que estamos conectados al contenedor, intentamos crear un archivo en su sistema de archivos ejecutando el siguiente comando:

```bash
touch /tmp/testfile.txt
```{{exec}}

Este comando debería fallar, con el mensaje "touch: cannot touch '/tmp/testfile.txt': Read-only file system". Esto pasa porque hemos configurado el sistema de archivos del contenedor para que sea de solo lectura. Al intentar crear un archivo, recibirás un mensaje de error que indicará que no tienes permisos suficientes para realizar esa operación. Esto es parte del comportamiento esperado cuando se implementa un sistema de archivos de solo lectura, ya que previene cualquier modificación o escritura en el sistema de archivos del contenedor.