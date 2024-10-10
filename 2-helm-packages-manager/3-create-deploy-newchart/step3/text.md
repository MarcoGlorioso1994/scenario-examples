En este paso del laboratorio, queremos analizar el concepto de `Revisión` en nuestro chart propietario.

Recuerda que cada vez que realizas una actualización o modificación de un release, Helm incrementa el número de revisión, lo que permite llevar un historial de cambios para dicho release.

Para modificar el Despliegue con Helm, vamos a realizar cambios en el archivo `values.yaml`:

Actualiza la imagen:

```yaml
image:
  repository: nginx
  tag: "1.21.0"
```{{copy}}

En el archivo `values.yaml`, configura un **Servicio** de tipo **ClusterIP**.

```yaml
service:
  enabled: true
  name: nginx-svc
  type: ClusterIP
  port: 80
  targetPort: 80
```{{copy}}

Como último cambio, queremos desplegar un **Ingress** en nuestro clúster de Kubernetes. Para ello, vamos a modificar algunos campos en el archivo `values.yaml`:

```yaml
ingress:
  enabled: true
  name: my-ingress
  annotations: {}
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  hosts:
    - host: myapp.local
      paths:
        - path: /
          pathType: ImplementationSpecific
          backend:
            serviceName: nginx-svc
            servicePort: 80
  tls: []
```{{copy}}

También necesitamos realizar algunos ajustes en el archivo **service.yaml** ubicado en el directorio **/my-chart/templates/service.yaml**.

Modificamos el campo `name` del servicio de la siguiente manera:

```yaml
name: {{ .Values.service.name }}
```{{copy}}

Este último cambio nos permite definir el nombre del servicio con el valor **`service.name`** establecido en el archivo **`values.yaml`** en la propiedad `service.name`

Ahora deseamos realizar una actualización de nuestra aplicación **`nginx`**. Para hacer el upgrade, utilizamos el siguiente comando:

Si necesitas más ajustes o información adicional, ¡hazmelo saber!

```bash
helm upgrade nginx ./my-chart
```{{exec}}

Comprueba los recursos desplegados con el siguiente comando:

```bash
kubectl get pods
kubectl get services
kubectl get ingress
```{{exec}}

Con estos cambios, has actualizado exitosamente tu aplicación en Kubernetes utilizando Helm, aprovechando el concepto de `Revisión` para mantener un historial de versiones. Esto no solo facilita la gestión de tu aplicación, sino que también mejora la capacidad de rastreo y reversión en caso de que se necesiten deshacer cambios.

Puedes revisar las diferentes revisiones de tu release con el siguiente comando:

```bash
helm history nginx
```{{exec}}