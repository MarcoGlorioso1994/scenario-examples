Como primer paso, crearemos una `Secret`. 

Para ello, creamos el archivo `secret.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
type: Opaque
data:
  usuario: YWRtaW4= # "admin" codificado en Base64
  password: cm9vdA== # "root" codificado en Base64
```{{copy}}

Ahora podemos desplegar el Secret ejecutando el siguiente comando:

```bash
kubectl apply -f secret.yaml
```{{exec}}

Para comprobar que el secret se ha creado correctamente, podemos ejecutar el siguiente comando:

```bash
kubectl get secret
```{{exec}}

Tendrías que ver el Secret con nombre `my-secrect` y en la columna **DATA** el valor `2`, que seria el numero de keys definidas abajo de la property `data` en el fichero `secret.yaml`