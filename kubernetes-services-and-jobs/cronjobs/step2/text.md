Vamos a comprobar que nuestro CronJob está funcionando correctamente con el siguiente comando:

```
kubectl get jobs --watch
```{{exec}}

Con este comando, podemos observar cómo el CronJob se está ejecutando cada dos minutos.

Además, si revisamos los pods con el siguiente comando:

```
kubectl get pods
```{{exec}}

Es posible ver un pod con principio de nombre igual al nombre del CronJob 'simple-cronjob', con un valor de 0/1 en la columna READY. Esto significa que hay un pod con cero contenedores activos. Esto es normal porque el contenedor solo se activa cuando se debe ejecutar la tarea del CronJob y luego se apaga hasta su próxima iteración. 