En este paso de este laboratorio, queremos analizar el concepto de `Revision`. 

**Una revisión es una versión específica de un release**. Cada vez que realizas una actualización o modificación de un release, Helm incrementa el número de revisión, lo que permite llevar un historial de cambios para dicho release.

Cada revisión captura una instancia de la configuración y la versión del chart que se utilizó en esa actualización. De este modo, puedes tener múltiples revisiones de un mismo release. Si algo sale mal en una actualización, puedes hacer un `helm rollback` para volver a una revisión anterior, utilizando su número.

Utilizando la release del paso anterior `mi-aplicacion-v2`, introduciremos un cambio sobre esa. Ejecutamos el comando `helm upgrade` para modificar unos de los valores de configuración:

```bash
helm upgrade mi-aplicacion-v2 bitnami/apache --version 10.0.4 --set service.type=ClusterIp
```{{exec}}

Este comando fallará porque el valor `ClusterIp` no es válido para la propiedad `service.type`.

Solucionamos el error utilizando el valor correcto ClusterIP indicado en el mensaje de error:

```bash
helm upgrade mi-aplicacion-v2 bitnami/apache --version 10.0.4 --set service.type=ClusterIP
```{{exec}}

Ahora deberías recibir un mensaje de éxito como el siguiente: "Release 'mi-aplicacion-v2' has been upgraded. Happy Helming!".

Verificamos que las releases se hayan actualizado correctamente:

```bash
helm list
```{{exec}}

Podemos ver que para la release `mi-aplicacion-v2`, en la columna **REVISION** tenemos el valor 3.

Para visualizar el historial de las distintas actualizaciones de nuestra release, podemos utilizar el comando `helm history`:

```bash
helm history mi-aplicacion-v2
```{{exec}}

Podemos observar que hay tres revisiones diferentes en los siguientes estados: `superseded`, `failed` y `deployed`. La revisión `deployed` es la que actualmente está desplegada en el clúster de Kubernetes.