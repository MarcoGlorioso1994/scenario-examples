Ahora vamos a analizar el almacenamiento dentro del PV creado utilizando el aprovisionamiento dinámico.

Creamos un fichero dentro del volume persistente:

```bash
kubectl exec deployment/storageclass-dp -- //bin/bash -c "echo \"Hola soy el Persistent Volume\" > /mnt/data/test.txt" 
```{{exec}}

Ahora eliminamos el deployment, para comprobar que el PV no depende desde el ciclo de vida de los pods donde esta montado.

```bash
kubectl delete deployment storageclass-dp
```{{exec}}

Vamos a comprobar que el PV sigue exitiendo, con el siguente comando:

```bash
kubectl get pv
```{{exec}}

Entonces hemos comprobado que el PV es indipendente desde el ciclo de vida de los pods. 

Ahora podemos desplegar el Deployment por segunda vez ejecutando el siguiente comando:

```bash
kubectl apply -f deployment.yaml
```{{exec}}

Los pods se han conectado nuevamente al PV creado en los pasos anteriores.

Podemos comprobar que el contenido del volumen se ha mantenido inalterado, ejecutando el siguiente comando:

```bash
kubectl exec deployment/storageclass-dp -- //bin/bash -c "cat /mnt/data/test.txt" 
```{{exec}}

Si todo se ha ejecutado correctamente, deberías ver el texto **"Hola soy el Persistent Volume"** en la línea de comandos.