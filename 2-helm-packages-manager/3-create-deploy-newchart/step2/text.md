En este paso vamos a instalar el chart en el clúster Kubernetes.

Despliega la aplicación usando Helm con el siguiente comando:

```bash
helm install nginx ./my-chart
```{{exec}}

Comprueba que los recursos se han desplegado correctamente en Kubernetes con el siguiente comando:

```bash
kubectl get pods
```{{exec}}

Podemos notar que los recursos se han desplegado en nuestro clúster de Kubernetes. Deberías ver tantos Pods como el valor que configuraste en el campo `replicaCount` durante el paso anterior.