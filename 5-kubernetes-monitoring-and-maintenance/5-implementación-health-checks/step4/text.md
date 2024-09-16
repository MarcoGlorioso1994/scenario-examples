Para solucionar el fallo y volver a un estado normal, simplemente podemos eliminar el pod y dejar que Kubernetes lo recree con una versión funcional:

```bash
kubectl delete pod <nombre-del-pod>
```{{exec}}