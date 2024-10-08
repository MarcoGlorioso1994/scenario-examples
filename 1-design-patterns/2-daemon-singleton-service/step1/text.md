En este paso, crearás un DaemonSet que garantiza que un Pod esté ejecutándose en cada nodo del clúster de Kubernetes.

Para ello, creamos el archivo `nginx-daemonset.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
aapiVersion: apps/v1
kind: DaemonSet
metadata:
  name: configurator
  labels:
    k8s-app: configurator
spec:
  selector:
    matchLabels:
      name: configurator
  template:
    metadata:
      labels:
        name: configurator
    spec:
      containers:
      - name: configurator
        image: bash
        command:
          - sh
          - -c
          - 'echo aba997ac-1c89-4d64 > /mount/config && sleep 1d'
        volumeMounts:
        - name: vol
          mountPath: /mount
      volumes:
      - name: vol
        hostPath:
          path: /configurator
```{{copy}}

Ahora podemos desplegar el Daemonset ejecutando el siguiente comando:

```bash
kubectl apply -f nginx-daemonset.yaml
```{{exec}}

Comprobamos que el Daemonset garantiza que un Pod esté ejecutándose en cada nodo del clúster de Kubernetes: 

```bash
kubectl get pods -o wide
```{{exec}}

Podrás ver en la columna **NODE** un nombre diferente para cada pod desplegado, ya que un DaemonSet asegura que haya un pod en ejecución en cada nodo del clúster. Esto permite que cada nodo ejecute una copia del pod, garantizando que los recursos o servicios necesarios estén disponibles en todos los nodos del clúster.