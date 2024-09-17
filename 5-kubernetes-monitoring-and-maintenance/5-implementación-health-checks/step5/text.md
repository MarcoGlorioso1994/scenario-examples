Para simular un fallo y observar como Kubenetes gestiona el problema en presenza de un livenessProbe, podemos ejecutar un comando que corrompa el servidor web dentro del pod.

Accedemos al contenedor y vamos a eliminar el archivo de configuración de nginx para simular un fallo:

```bash
kubectl exec -it my-app -- //bin/bash -c "rm -rf \/usr\/share\/nginx\/html\/*"
```{{exec}}

Esto simula un fallo en el servidor nginx, ya que no tendrá contenido para servir en el endpoint /.