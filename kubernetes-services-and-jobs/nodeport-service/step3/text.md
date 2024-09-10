Vamos a analizar el servicio creado ejecutando el siguiente comando:"

```
kubectl get svc frontend-svc
```{{exec}}

Podemos ver que en la columna PORT(S) se ha creado el mapeo del puerto 80 en los pods al puerto del servicio 30123.

Para llamar al servicio NodePort, desde fuera del cluster kubernetes, necesitamos conocer la dirección IP física de uno de los nodos del clúster. Ejecuta el comando `kubectl get nodes` para visualizar esta información.

```
kubectl get nodes -o wide
```{{exec}}

Guarda las direcciones de los nodos que están en la columna INTERNAL-IP.