Utiliza el siguiente comando para crear una nueva estructura de `Chart` de Helm:

```bash
helm create my-chart
```{{exec}}

Familiaríza con cada archivo generado automáticamente:

**Chart.yaml** Contiene los metadatos del chart.
**values.yaml** Valores por defecto utilizados por el chart.
Directorio **templates/** Contiene los manifiestos Kubernetes que se renderizan con los valores.

Ahora vamos a personalizar los valores predeterminados en `values.yaml`.

Modifica el campo replicaCount para especificar el número de réplicas que deseas para tu aplicación:

```yaml
replicaCount: 3
```{{copy}}

Cambia la imagen de la aplicación:

```yaml
image:
  repository: nginx
  tag: "1.19.0"
```{{copy}}

Ajusta los recursos:

```yaml
resources:
  limits:
    cpu: 100m
    memory: 128Mi
```{{copy}}