A continuación, vamos a crear una Política de Red que restrinja el tráfico entre Pods. Crea un archivo YAML llamado `network-policy.yaml` con el siguiente contenido:

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-nginx
spec:
  podSelector:
    matchLabels:
      app: nginx
  policyTypes:
  - Ingress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: nginx
```{{copy}}

Esta política permite el tráfico de entrada (Ingress) solo desde otros Pods que tienen la etiqueta `app: nginx`.

Ahora podemos aplicar el manifiesto para aplica la política:

```bash
kubectl apply -f network-policy.yaml
```{{exec}}