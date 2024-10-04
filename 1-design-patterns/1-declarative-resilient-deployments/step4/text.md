Ahora podemos queremos realizar un rollback en caso de fallos durante una actualización. Simulamos un fallo actualizando la imagen a una versión errónea, como `nginx:invalid`:

```yaml
image: nginx:invalid
```{{copy}}

Aplicamos los cambios ejecutando el siguiente comando:

```bash
kubectl apply -f nginx-deployment.yaml
```{{exec}}

Observamos el fallo:

```bash
kubectl get pods
```{{exec}}

El Docker engine no puede encontrar la imagen debido a un **tag inválido**, lo que provocará que uno de los pods presente el error `"ErrImagePull"`, seguido de `"ImagePullBackOff"`. Esto es interesante porque Kubernetes detiene el proceso de **Rolling Update** al detectar un error durante la actualización del primer pod, evitando que otros pods se actualicen con la imagen incorrecta o inalcanzable. De esta forma, Kubernetes protege la disponibilidad de la aplicación al no proceder con la actualización fallida.

Ahora, podemos realiza un rollback para volver a la versión anterior:

```bash
kubectl rollout undo deployment/nginx-deployment
```{{exec}}

Verificamos el estado el proceso de actualizacion:

```bash
kubectl rollout status deployment/nginx-deployment
```{{exec}}

Deberías ver que Kubernetes ha iniciado el proceso de actualización, y al ejecutar el comando, deberías recibir el siguiente mensaje: `deployment "nginx-deployment" successfully rolled out`. Esto indicaría que el despliegue se ha actualizado correctamente y que todas las réplicas volverán a estar en funcionamiento, asegurando que la aplicación esté disponible sin interrupciones mientras Kubernetes realiza la actualización.