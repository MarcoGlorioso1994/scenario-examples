Creamos el fichero `cronjob.yaml`y añadimos el siguiente código dentro del archivo:

```
apiVersion: batch/v1
kind: CronJob
metadata:
  name: simple-cronjob
spec:
  schedule: "*/2 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: hello
            image: busybox:1.28
            imagePullPolicy: IfNotPresent
            command:
            - /bin/sh
            - -c
            - date; echo Hello from the Kubernetes CronJob
          restartPolicy: OnFailure
```{{copy}}

Hemos definido un CronJob que ejecuta unos comandos `sh` cada dos minutos. Ahora podemos desplegar el CronJob en nuestro clúster de Kubernetes.

```
kubectl apply -f cronjob.yaml
```{{exec}}

Para comprobar que el CronJob se ha creado correctamente, podemos ejecutar el siguiente comando:

```
kubectl get cronjobs
```{{exec}}