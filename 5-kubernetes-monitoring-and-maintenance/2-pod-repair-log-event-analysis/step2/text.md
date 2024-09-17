Para entender mejor qué está ocurriendo dentro de los contenedores, usaremos `kubectl logs` para revisar los logs de cada uno.

Para ver los logs del contenedor nginx (que está funcionando):

```bash
kubectl logs <nombre-del-pod> -c nginx
```{{copy}}

Deberíamos ver los logs de nginx, lo que indicará que este contenedor está funcionando correctamente.

Para ver los logs del contenedor faulty-container (que está fallando):

```bash
kubectl logs <nombre-del-pod> -c faulty-container
```{{copy}}

Aquí Deberíamos ver un mensaje que dice "Simulating a crash" . Este mensaje indica que el contenedor está programado para fallar intencionalmente después de 5 segundos.