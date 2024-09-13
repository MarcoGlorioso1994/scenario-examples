Ahora deseamos crear un deployment que puedas consumir el PV creado en los pasos anteriores. 

Creamos el archivo `deployment.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-dp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      name: nginx
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        volumeMounts:
          - mountPath: "/mnt/data"
            name: my-volume
      volumes:
      - name: my-volume
        persistentVolumeClaim:
          claimName: my-pvc
```{{copy}}

Ahora podemos desplegar el Deployment ejecutando el siguiente comando:

```bash
kubectl apply -f deployment.yaml
```{{exec}}

Para comprobar que los pods se han iniciado correctamente, podemos ejecutar el siguiente comando:

```bash
kubectl get pods -o wide
```{{exec}}

Creamos un fichero dentro del volume persistente:

```bash
kubectl exec deployment/my-dp -- //bin/bash -c "echo \"Hola soy el Persistent Volume\" > /mnt/data/test.txt" 
```{{exec}}

Ahora eliminamos el deployment para comprobar que el Persistent Volume (PV) no depende del ciclo de vida de los pods donde está montado.

```bash
kubectl delete deployment my-dp
```{{exec}}

Vamos a comprobar que el PV sigue exitiendo, con el siguente comando:

```bash
kubectl get pv
```{{exec}}

Entonces el PV es indipendente desde el ciclo de vida de los pods. 