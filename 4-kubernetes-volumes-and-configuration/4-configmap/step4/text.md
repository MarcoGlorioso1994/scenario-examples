Las `ConfigMaps` nos permiten mantener la configuración fuera de las imágenes de los contenedores, lo que mejora la portabilidad y flexibilidad de las aplicaciones. Un contenedor puede ser reutilizado en diferentes entornos cambiando únicamente la configuración a través de `ConfigMaps`.

Veamos cómo actualizar los datos cargados a través de un `ConfigMap` dentro de los pods cuando necesitamos actualizar nuestro `ConfigMap`.

En primer lugar, vamos a modificar el archivo `configmap.yaml`. Reduciremos el valor de `player_initial_lives` de 10 a 5 y el valor de la propiedad `allow.textmode` a `false`.

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-confimap
data:
  # property-like keys; each key maps to a simple value
  player_initial_lives: "5"
  ui_properties_file_name: "user-interface.properties"
  # file-like keys
  game.properties: |
    enemy.types=aliens,monsters
    player.maximum-lives=5 
  user-interface.properties: |
    color.good=purple
    color.bad=yellow
    allow.textmode=false
```{{copy}}

Ahora podemos actualizar el `ConfigMap` ejecutando el siguiente comando:

```bash
kubectl apply -f configmap.yaml
```{{exec}}

Los cambios no se reflejan inmediatamente en los pods en ejecución, pero podemos forzar una actualización inmediata ejecutando el siguiente comando:

```bash
kubectl rollout restart deployment my-dp
```{{exec}}

Ahora queremos verificar que los datos del `ConfigMap` se hayan actualizado correctamente dentro de los pods del deployment. Para ello, nos conectamos a la shell de uno de los pods del deployment, ejecutando el siguiente comando:

```bash
k exec -it deployment/my-dp -- //bin/bash
```{{exec}}

Revisamos las variables de entorno con el siguiente comando:

```bash
env
```{{exec}}

Deberíamos ver las dos variables de entorno:

```bash
UI_PROPERTIES_FILE_NAME=user-interface.properties
PLAYER_INITIAL_LIVES=5
```

Ahora vamos a comprobar que el valor de la propiedad `allow.textmode` se ha actualizado de `true` a `false`. Para ello, leemos el contenido del archivo `user-interface.properties` ejecutando el siguiente comando:

```bash
cat /mnt/user-interface.properties
```{{exec}}

Deberíamos visualizar el contenido del archivo tal como está definido en el ConfigMap:

```bash
color.good=purple
color.bad=yellow
allow.textmode=false
```

Entonces, el `ConfigMap` nos permite actualizar los valores de configuración sin tener que modificar los archivos de definición de los recursos.