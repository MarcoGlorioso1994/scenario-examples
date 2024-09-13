Ahora podemos desplegar el deployment por segunda vez ejecutando el siguiente comando:

```bash
kubectl apply -f deployment.yaml
```{{exec}}

Los pods se han conectado nuevamente al `PersistentVolume` (PV) creado en los pasos anteriores.

Podemos comprobar que el contenido del volumen se ha mantenido inalterado, comenzando por ejecutar el siguiente comando:

```bash
kubectl exec deployment/my-dp -- //bin/bash -c "cat /mnt/data/test.txt" 
```{{exec}}

Si todo se ha ejecutado correctamente, deberíamos ver el texto "Hola, soy el Persistent Volume" en la línea de comandos.