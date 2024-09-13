Y hasta aquí el laboratorio de **ConfigMap**.

Como hemos visto, hemos creado un **ConfigMap** y lo hemos montado en un deployment, introduciendo datos de configuración almacenados fuera de las imágenes Docker. Además, en la última parte del laboratorio, observamos cómo es posible actualizar rápidamente el `ConfigMap` y reflejar estos cambios en los pods sin tener que modificar los archivos de definición de los recursos.

En el siguiente laboratorio, veremos cómo inyectar datos sensibles dentro de los pods utilizando los **Secrets**.