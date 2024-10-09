Para eliminar el despliegue creado, ejecuta:

```bash
helm uninstall my-app-nginx
```{{exec}}

Para verificar que los recursos han sido eliminados, utiliza kubectl para asegurarte de que los pods y demás recursos han sido eliminados:

```bash
kubectl get pods
kubectl get services
kubectl get ingress
```{{exec}}

Con esto, has eliminado correctamente el despliegue y todos los recursos asociados a tu aplicación. Este proceso resalta la flexibilidad de Helm para gestionar aplicaciones en Kubernetes, permitiéndote implementar, actualizar y eliminar recursos de manera sencilla y eficiente.