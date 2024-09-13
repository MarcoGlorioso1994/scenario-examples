Creamos el archivo `deployment.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-dp
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx
          env:
            - name: UI_PROPERTIES_FILE_NAME
              valueFrom:
                configMapKeyRef:
                  name: my-confimap
                  key: ui_properties_file_name
            - name: PLAYER_INITIAL_LIVES
              valueFrom:
                configMapKeyRef:
                  name: my-confimap      
                  key: player_initial_lives
          volumeMounts:
            - name: config
              mountPath: /mnt
      volumes:
        - name: config
          configMap:
            name: my-confimap
            items:
              - key: "game.properties"
                path: "game.properties"
              - key: "user-interface.properties"
                path: "user-interface.properties"
```{{copy}}

En la definición del deployment, estamos accediendo a los datos almacenados en la ConfigMap de dos maneras diferentes. Primero, estamos extrayendo la ConfigMap para crear dos variables de entorno: `UI_PROPERTIES_FILE_NAME` y `PLAYER_INITIAL_LIVES`. En segundo lugar, estamos utilizando un volumen que se monta en los pods en el directorio `/mnt`, donde se crearán dos archivos: `game.properties` y `user-interface.properties`, que están definidos en la ConfigMap.

Ahora podemos desplegar el deployment ejecutando el siguiente comando:

```bash
kubectl apply -f deployment.yaml
```{{exec}}

Para comprobar que los pods se han iniciado correctamente, podemos ejecutar el siguiente comando:

```bash
kubectl get pods -o wide
```{{exec}}