Al fin de solucionar nuestra applicacion, eliminamos nuestra applicacion y la vamos a actualizar de vulta:

Eliminamos el pod:

```bash
kubectl delete -f pod.yaml
```{{exec}}

Desplegamos el pod ejecutando el siguiente comando:

```bash
kubectl apply -f pod.yaml
```{{exec}}

Verificamos el estado del nuevo pod:

```bash
kubectl get pods
```{{exec}}

Deberías ver que el pod está desplegado correctamente.