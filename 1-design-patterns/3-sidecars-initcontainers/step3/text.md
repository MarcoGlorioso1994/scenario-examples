En este paso, Vamos a simular una falla en un InitContainer para observar cómo Kubernetes lo maneja.

Para ello, creamos el archivo `pod-initcontainer-failure.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: initcontainer-failure-demo
spec:
  initContainers:
    - name: init-fail
      image: busybox
      command: ['sh', '-c', 'exit 1']
  containers:
    - name: main-container
      image: nginx
```{{copy}}

Aplicamos el manifiesto para observar el comportamiento de Kubernetes en este escenario:

```bash
kubectl apply -f pod-initcontainer-failure.yaml
```{{exec}}

Analizamos cómo el InitContainer falla y el Pod no se inicia. Revisamos los eventos del Pod:

```bash
kubectl get pods
```{{exec}}

```bash
kubectl describe pod initcontainer-failure-demo
```{{exec}}