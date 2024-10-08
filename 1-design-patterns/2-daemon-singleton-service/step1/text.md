Un ejemplo común de uso de un **DaemonSet** es la implementación de **Fluentd** junto con **Elasticsearch** para la recolección y almacenamiento de logs. **Fluentd** se encarga de recopilar los logs generados en cada nodo del clúster, los procesa y los envía a **Elasticsearch** para su indexación y búsqueda. Al desplegar Fluentd mediante un DaemonSet, nos aseguramos de que los logs de todos los nodos del clúster sean capturados de manera eficiente y centralizada.

Crearemos un DaemonSet que garantizará que haya un Pod en ejecución en cada nodo del clúster de Kubernetes. Para ello, creamos el archivo `fluentd-elasticsearch-daemonset.yaml` y añadimos el siguiente código en su interior:

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: fluentd-elasticsearch
  labels:
    k8s-app: fluentd-logging
spec:
  selector:
    matchLabels:
      name: fluentd-elasticsearch
  updateStrategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
  template:
    metadata:
      labels:
        name: fluentd-elasticsearch
    spec:
      tolerations:
      # these tolerations are to have the daemonset runnable on control plane nodes
      # remove them if your control plane nodes should not run pods
      - key: node-role.kubernetes.io/control-plane
        operator: Exists
        effect: NoSchedule
      - key: node-role.kubernetes.io/master
        operator: Exists
        effect: NoSchedule
      containers:
      - name: fluentd-elasticsearch
        image: quay.io/fluentd_elasticsearch/fluentd:v2.5.2
        volumeMounts:
        - name: varlog
          mountPath: /var/log
        - name: varlibdockercontainers
          mountPath: /var/lib/docker/containers
          readOnly: true
      terminationGracePeriodSeconds: 30
      volumes:
      - name: varlog
        hostPath:
          path: /var/log
      - name: varlibdockercontainers
        hostPath:
          path: /var/lib/docker/containers
```{{copy}}

Ahora podemos desplegar el Daemonset ejecutando el siguiente comando:

```bash
kubectl apply -f fluentd-elasticsearch-daemonset.yaml
```{{exec}}

Comprobamos que el Daemonset garantiza que un Pod esté ejecutándose en cada nodo del clúster de Kubernetes: 

```bash
kubectl get pods -o wide
```{{exec}}

Podrás ver en la columna **NODE** un nombre diferente para cada pod desplegado, ya que un **DaemonSet** asegura que haya un pod en ejecución en cada nodo del clúster. Esto permite que cada nodo ejecute una copia del pod, garantizando que los recursos o servicios necesarios estén disponibles en todos los nodos del clúster.