Vamos a instalar Apache desde el repositorio de Bitnami con la siguiente instrucción:

```bash
helm install apache bitnami/apache --version 10.0.4
```{{exec}}

Verifica que la aplicación ha sido instalada correctamente:

```bash
helm list
```{{exec}}

Ahora queremos descargar un chart con Helm: 

```bash
helm pull bitnami/wordpress
```{{exec}}

Este comando se utiliza para descargar un chart específico desde un repositorio a tu sistema local. Al usar helm pull, puedes obtener el código fuente del chart, que puedes modificar o inspeccionar antes de instalarlo en tu clúster.