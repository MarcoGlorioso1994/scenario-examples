Como primer paso, crearemos una `ConfigMap`. 

Para ello, creamos el archivo `configmap.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-confimap
data:
  # property-like keys; each key maps to a simple value
  player_initial_lives: "10"
  ui_properties_file_name: "user-interface.properties"
  # file-like keys
  game.properties: |
    enemy.types=aliens,monsters
    player.maximum-lives=5 
  user-interface.properties: |
    color.good=purple
    color.bad=yellow
    allow.textmode=true
```{{copy}}

Ahora podemos desplegar la ConfigMap ejecutando el siguiente comando:

```bash
kubectl apply -f configmap.yaml
```{{exec}}

Para comprobar que la configmap se ha creado correctamente, podemos ejecutar el siguiente comando:

```bash
kubectl get configmap
```{{exec}}

Tendrías que ver la ConfigMap con nombre `my-confimap` y en la columna **DATA** el valor `4`, que seria el numero de keys definidas abajo de la property `data` en el fichero `configmap.yaml`