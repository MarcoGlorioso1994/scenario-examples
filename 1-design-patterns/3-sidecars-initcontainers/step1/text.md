Un InitContainer es un contenedor especial que se ejecuta antes de que el contenedor principal lo haga. Puede ser usado para tareas de inicialización, como preparar un volumen, inicializar datos o realizar chequeos previos.

En este paso, el InitContainer creará un archivo en un volumen compartido, y el contenedor principal leerá de ese volumen.

Para ello, creamos el archivo `pod-initcontainer-volume.yaml` con el siguiente contenido:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: initcontainer-volume-demo
spec:
  volumes:
    - name: shared-data
      emptyDir: {}
  initContainers:
    - name: init-write
      image: busybox
      command: ['sh', '-c', 'echo "Datos preparados por InitContainer" > /data/init-data']
      volumeMounts:
        - name: shared-data
          mountPath: /data
  containers:
    - name: main-container
      image: busybox
      command: ['sh', '-c', 'cat /data/init-data && sleep 3600']
      volumeMounts:
        - name: shared-data
          mountPath: /data
```{{copy}}

Ahora podemos aplicar el manifiesto para crear el Pod y su InitContainer:

```bash
kubectl apply -f pod-initcontainer-volume.yaml
```{{exec}}

Comprobamos que el Pod está en ejecución: 

```bash
kubectl get pods
```{{exec}}

Ahora podemos ver que el Pod solo se iniciará después de que el InitContainer finalice correctamente. Si falla, el Pod no continuará hasta que el InitContainer se complete con éxito.

Podemos observar cómo el InitContainer escribe en el volumen compartido y el contenedor principal lo consume. Ejecutamos el siguiente comando:

```bash
kubectl logs initcontainer-volume-demo
```{{exec}}