Y hasta aquí el laboratorio de **StatefulSet**.

Como hemos podido observar, el recurso **StatefulSet** nos permite crear un conjunto de pods ordenados, con nombres únicos y con volúmenes persistentes (PVs) asociados de manera exclusiva a cada pod.

Este recurso es muy útil cuando deseamos desplegar una base de datos, ya que nos permite crear réplicas de la aplicación, y cada una tiene su propio almacenamiento independiente y único.

En el siguiente laboratorio, veremos cómo inyectar información de configuración utilizando los **ConfigMap** de Kubernetes.