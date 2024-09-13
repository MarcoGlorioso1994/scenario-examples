Y hasta aquí el laboratorio de **StorageClass**.

Como hemos podido observar, las **StorageClass** nos permiten habilitar el aprovisionamiento dinámico de los PVs, reduciendo la carga de trabajo de los administradores de Kubernetes. Las **StorageClass** nos permiten definir el tipo de volumen que deseamos y luego Kubernetes se encarga de crear esos volúmenes por nosotros.

En el siguiente laboratorio, veremos cómo podemos crear un recurso de tipo **StatefulSet**.