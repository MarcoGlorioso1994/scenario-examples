Para probar la política de red, vamos a crear un Pod de prueba.

Ejecutamos el siguiente comando para crear un Pod de prueba:

```bash
kubectl run test-pod --image=busybox --restart=Never -- sh -c "while true; do echo hello; sleep 5; done"
```{{exec}}

Ahora intentamos acceder al servicio de Nginx desde el Pod de prueba:

```bash
kubectl exec -it test-pod -- wget -qO- <dirección IP de uno de los pods creados>
```{{copy}}

Este comando debería fallar porque la política de red está configurada para bloquear el tráfico desde cualquier pod que no tenga la etiqueta `app: nginx`. Esto garantiza que solo los pods etiquetados con `app: nginx` puedan comunicarse con otros recursos, limitando el acceso para mejorar la seguridad y control de tráfico en el clúster.