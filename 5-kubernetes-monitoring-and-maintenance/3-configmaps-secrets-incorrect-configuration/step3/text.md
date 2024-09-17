Para corregir el problema, necesitamos anadir la pareja clave/valor que esta faltando en la ConfigMap. 

Anadimos el siguiente codigo en la seccion data en el archivo configmap.yaml:

```yaml
APP_MODE: "production"
```{{copy}}

Actualizamos la ConfigMap:

```bash
kubectl apply -f configmap.yaml
```{{exec}}