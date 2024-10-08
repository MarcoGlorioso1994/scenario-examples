En este paso de este laboratorio, queremos analizar el concepto de `release`.

Para crear diferentes releases de una aplicación en Helm, **es fundamental que sepas que cada release en Helm se identifica de manera única por su nombre**. Esto significa que puedes tener múltiples instancias de la misma aplicación instaladas en el mismo clúster, siempre y cuando les des diferentes nombres. 

Vamos a suponer que estamos utilizando un chart llamado `apache`, que ya hemos instalado en el clúster. Crearemos varias releases de la aplicacion con diferentes configuraciones o nombres.

Primero, instalemos la primera instancia del aplicacion. Llamaremos a esta release `mi-aplicacion-v1`.

```bash
helm install mi-aplicacion-v1 bitnami/apache --version 10.0.4
```{{exec}}

Ahora, instalaremos una segunda instancia del aplicacion. Esta vez la llamaremos `mi-aplicacion-v2`. Podemos también personalizar algunos valores para esta release.

```bash
helm install mi-aplicacion-v2 bitnami/apache --version 10.0.4 --set service.type=NodePort
```{{exec}}

A continuación, crearemos una tercera release llamada `mi-aplicacion-v3`, esta vez configurando un recurso de límites de CPU.

```bash
helm install mi-aplicacion-v3 bitnami/apache --version 10.0.4 --set resources.limits.cpu=500m
```{{exec}}

Verificamos que las releases se haya instalado correctamente:

```bash
helm list
```{{exec}}

Para verificar cada release individualmente, puedes usar el siguiente comando:

```bash
helm status mi-aplicacion-v1
```{{exec}}

Entonces una release es una instancia de un chart que ha sido instalada en un clúster de Kubernetes utilizando Helm. Representa una implementación concreta de una aplicación en el clúster, basada en un chart (paquete de Helm) y configurada con valores específicos.

Un release se gestiona a través de comandos como `helm install`, `helm upgrade`, y `helm uninstall`.

Resulta interesante observar el paralelismo en el clúster ejecutando el siguiente comando:

```bash
kubectl get pods
```{{exec}}

Deberías ver tres pods desplegados que siguen la nomenclatura de las releases.