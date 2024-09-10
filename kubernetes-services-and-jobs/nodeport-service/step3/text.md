Vamos a ejecutar el comando

```
kubectl get svc frontend-svc
```{{exec}}

Podemos ver que en la columna PORT(S) se ha creado el maping puerta 80 en los pods con la porta del servicio 30123.

Para llamar el servicio NodePort, ahora necesitamos de conocer la direccion ip fisica de uno de los nodos del cluster. Ejecutamos el comando get nodes para visualizar estas informaciones.

```
kubectl get nodes -o wide
```{{exec}}

Guarda la direcciones de los nodos que esta en la columna INTERNAL-IP