Ahora deseamos reducir el numero de `replicas` dentro del fichero `statefulset.yaml`.

Reducimos a 2 el numero de replicas del Stateful, ejecutando el siguiente comando:

```bash
kubectl scale statefulset my-statefulset --replicas=2
```{{exec}}

Verificar que se han quedado solo dos pods con el siguiente comando:

```bash
kubectl get pods
```{{exec}}

En un StatefulSet, el orden de eliminación de los pods es ordenado; de hecho, se ha eliminado el pod con el índice más alto (2). 

Ahora vamos a verificar que los PVCs y los PVs se han mantenido ejecutando el siguiente comando:

```bash
kubectl get pvc
```{{exec}}

Podemos ver que siguen existiendo 3 PVCs.
Como siguiente paso, comprobamos también los PVs, ejecutando el siguiente comando:

```bash
kubectl get pv
```{{exec}}

Ahora que hemos visto que los PVCs y PVs son independientes de los pods y que se mantienen incluso si algunos de los pods han sido eliminados, podemos continuar aumentando el número de réplicas dentro del StatefulSet.

```bash
kubectl scale statefulset my-statefulset --replicas=5
```{{exec}}

```bash
kubectl get pods
```{{exec}}

Verificamos ahora que tenemos 5 pods desplegados en el clúster. Es probable que también hayas notado que la creación de los pods es ordenada y sincrónica: el pod con el índice más alto solo se puede desplegar cuando el pod con el índice n-1 ha terminado su proceso de despliegue.

```bash
kubectl get pods
```{{exec}}

Podemos ver que cada pod tiene un valor ordenado desde 0 hasta 4.

Ahora vamos a revisar los PVCs y los PVs ejecutando el siguiente comando:

```bash
kubectl get pvc
```{{exec}}

Podemos ver que, con un incremento de 3 pods, se han creado solo dos nuevos PVCs y dos nuevos PVs para los pods con índice 3 y 4. Esto indica que el pod con índice 2 utiliza nuevamente el PVC con índice 2 que se había creado anteriormente.