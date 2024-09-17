Después de eliminar el contenido del directorio /html, el probe de readiness seguramente ha fallado.

Verificamos los eventos del pod:

```bash
kubectl describe pod my-app
```{{copy}}

Bajo la sección de Events, deberíamos encontrar mensajes como "Readiness probe failed: HTTP probe failed with status code: 403" o Error, que indican que el probe de readiness está fallando al ejecutar una solicitud HTTP GET a la raíz / del servidor web nginx. Como se mencionó anteriormente, Kubernetes deja de enviar tráfico al contenedor, pero no lo reinicia.

Podemos comprobar que el contenedor no se ha reiniciado con el siguiente comando:

```bash
kubectl get pods
```{{exec}}

Podemos ver cómo el pod está en estado **Running**, pero en la columna **READY** el valor es `0/1`, lo que significa que 0 de los contenedores están listos.