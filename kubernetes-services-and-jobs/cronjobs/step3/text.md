Ahora vamos a comprobar que el CronJob está ejecutando los comandos que hemos definido en el primer paso de este laboratorio.

Comandos: 

```
command:
    - /bin/sh
    - -c
    - date; echo Hello from the Kubernetes CronJob
```

En los logs, el output debería mostrar una fecha y un texto. Para comprobar esto, vamos a ejecutar nuevamente el comando:

```
kubectl get jobs --watch
```{{exec}}

Vamos a copiar el valor del campo `NAME` de nuestro CronJob y crearemos una variable `pods` de la siguiente manera:

```
pods=$(kubectl get pods --selector=job-name={NAME_VALUE} --output=jsonpath={.items[*].metadata.name})
```{{copy}}

Ahora que tenemos el nombre del pod que ejecuta el CronJob, podemos revisar sus logs con el siguiente comando:

```
kubectl logs $pods
```{{exec}}

El resultado en el terminal debería ser en dos líneas:

- primera linea, la fecha
- segunda linea, el texto "Hello from the Kubernetes CronJob"