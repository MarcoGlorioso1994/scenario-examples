Ahora queremos verificar que los datos de la ConfigMap se hayan inyectado correctamente dentro de los pods del deployment. Para ello, nos conectamos a la shell de uno de los pods del deployment y ejecutamos el siguiente comando:

```bash
k exec -it deployment/my-dp -- //bin/bash
```{{exec}}

Revisamos las variables de entorno con el siguiente comando (ejecutado dentro del pod):

```bash
env
```{{exec}}

Deberíamos ver las dos variables de entorno:

```bash
UI_PROPERTIES_FILE_NAME=user-interface.properties
PLAYER_INITIAL_LIVES=10
```

Ahora vamos a comprobar que el volumen se ha montado correctamente y que se han cargado los dos archivos definidos en la ConfigMap.

Dentro del pod, debemos desplazarnos al directorio especificado en la siguiente sección del archivo de deployment:

```yaml
volumeMounts:
  - name: config
    mountPath: /mnt
```
Dicho esto, leemos el contenido de uno de los dos archivos ejecutando el siguiente comando:

```bash
cat /mnt/game.properties
```{{exec}}

Deberíamos visualizar el contenido del archivo tal como está definido en la ConfigMap:

```bash
enemy.types=aliens,monsters
player.maximum-lives=5
```

Entonces, el ConfigMap nos ha permitido definir datos de configuración que se pueden utilizar dentro de los pods en el deployment. 