Ahora queremos verificar que los datos contenidos en el Secret se hayan inyectado correctamente dentro de los pods del deployment. Para ello, nos conectamos a la shell de uno de los pods del deployment y ejecutamos el siguiente comando:

```bash
k exec -it deployment/secret-deployment -- //bin/bash
```{{exec}}

Revisamos las variables de entorno con el siguiente comando (ejecutado dentro del pod):

```bash
env
```{{exec}}

Deberíamos ver las dos variables de entorno:

```bash
USUARIO=admin
PASSWORD=root
```

Notamos que los datos están cargados sin codificación en base64.

Ahora vamos a comprobar que el volumen se ha montado correctamente y que se han creado dos archivos por cada llave definida en el Secret.

Dentro del pod, debemos desplazarnos al directorio especificado en la siguiente sección del archivo de deployment:

```yaml
volumeMounts:
  - name: secret-volumen
    mountPath: "/etc/secret"
```
Dicho esto, leemos el contenido de uno de los dos archivos ejecutando el siguiente comando:

```bash
cat /etc/secret/usuario
```{{exec}}

Deberíamos visualizar el valor de la llave `usuario`

```bash
admin
```

Entonces, el Secret nos ha permitido de inyectar datos sensibles codificados en base64 dentro de los pods. 