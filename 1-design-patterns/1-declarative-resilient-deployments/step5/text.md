Como último paso, queremos comprobar la resiliencia de un Deployment en Kubernetes. Para ello, vamos a eliminar uno de los pods del deployment. Esto nos permitirá observar cómo Kubernetes se encarga de recrear el pod eliminado automáticamente, asegurando que el número deseado de réplicas se mantenga en ejecución.

Ejecuta el siguiente comando para eliminar uno de los pods:

```yaml
kubectl delete pod <nginx-pod-name>
```{{copy}}

Reemplaza <nombre-del-pod> con el nombre del pod que deseas eliminar. Después de ejecutar este comando, puedes observar el estado del deployment y de los pods usando:

```bash
kubectl get deployments
kubectl get pods
```{{exec}}

Esto nos enseña cómo Kubernetes monitoriza el número de réplicas de los **Deployments**. Si uno de los pods deja de funcionar o es eliminado, Kubernetes se encarga automáticamente de crear un nuevo pod para ese mismo deployment. De esta manera, asegura que siempre se mantenga el número correcto de réplicas activas para nuestra aplicación, garantizando su disponibilidad y resiliencia.