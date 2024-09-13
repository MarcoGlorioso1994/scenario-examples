El StatefulSet ha creado para nosotros también tres `Persistent Volume Claims` y tres `Persistent Volumes`.

Para comprobar existencia de los tres PVC y que se han inicializado correctamente, podemos ejecutar el siguiente comando:

```bash
kubectl get pvc
```{{exec}}

Analizamos los nombres de los PVC, por ejemplo, `state-volume-my-statefulset-0`. Este nombre está compuesto por `<nombre-volumen>-<nombre-statefulset>-<índice-incremental>`.Entonces, podemos ver cómo los PVC también tienen un índice único creciente, de 0 a 2.

Como siguente paso, comprobamos tambien que el statefulset ha creado para nosotros tambien tres PV, ejecutando el siguiente comando:

```bash
kubectl get pv
```{{exec}}

Podemos ver cómo la columna `STATUS` tiene el valor `Bound` para cada PV y que la columna `CLAIM` está poblada con los nombres de los PVC que hemos visualizado con el comando anterior.

En este paso, hemos visto una característica muy importante del StatefulSet, es decir, que el StatefulSet crea un volumen persistente por cada pod, el cual está unívocamente asociado a un solo pod con un índice específico.