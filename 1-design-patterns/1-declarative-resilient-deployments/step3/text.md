Ahora deseamos actualizar el Deployment con una nueva versión de la aplicación usando un `Rolling Update`.

Editamos el archivo el archivo `nginx-deployment.yaml` y actualizmos la imagen de nginx a `nginx:1.16.1`:

```yaml
image: nginx:1.16.1
```{{copy}}

Ahora podemos aplicar los cambios ejecutando el siguiente comando:

```bash
kubectl apply -f nginx-deployment.yaml
```{{exec}}

Podemos comprobar que la actualización esté ocurriendo de manera progresiva:

```bash
kubectl rollout status deployment/nginx-deployment
```{{exec}}

Deberías ver que Kubernetes ha iniciado el proceso de actualización, y al ejecutar el comando, deberías recibir el siguiente mensaje: `deployment "nginx-deployment" successfully rolled out`. Esto indicaría que el despliegue se ha actualizado correctamente. 

```bash
kubectl get pods
```{{exec}}

Podemos ver cómo los pods se están actualizando de forma progresiva. A medida que Kubernetes realiza el rolling update, algunos pods antiguos se terminan y se reemplazan por nuevos, hasta que todos los pods estén actualizados a la nueva versión del despliegue.