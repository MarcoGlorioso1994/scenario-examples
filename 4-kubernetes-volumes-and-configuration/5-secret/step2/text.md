Creamos el archivo `deployment.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: secret-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx-secret
  template:
    metadata:
      labels:
        app: nginx-secret
    spec:
      containers:
        - name: nginx
          image: nginx
          env:
            - name: USUARIO
              valueFrom:
                secretKeyRef:
                  name: my-secret
                  key: usuario
            - name: PASSWORD
              valueFrom:
                secretKeyRef:
                  name: my-secret
                  key: password
          volumeMounts:
            - name: secret-volumen
              mountPath: "/etc/secret"
      volumes:
        - name: secret-volumen
          secret:
            secretName: my-secret
```{{copy}}

En la definición del deployment, estamos accediendo a los datos almacenados en Secret de dos maneras diferentes. Primero, estamos extrayendo el Secret para crear dos variables de entorno: `USUARIO` y `PASSWORD`. En segundo lugar, estamos utilizando un volumen que se monta en los pods en el directorio `/etc/secret`, donde se crearán dos archivos: `usuario` y `password`, que están definidos en el Secret.

Ahora podemos desplegar el deployment ejecutando el siguiente comando:

```bash
kubectl apply -f deployment.yaml
```{{exec}}

Para comprobar que los pods se han iniciado correctamente, podemos ejecutar el siguiente comando:

```bash
kubectl get pods -o wide
```{{exec}}