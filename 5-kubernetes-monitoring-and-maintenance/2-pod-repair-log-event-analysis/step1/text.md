Come primer paso, necesitamos desplegar un pod con dos contenedores: uno que funciona correctamente (nginx) y otro que simula un fallo (busybox que finaliza inmediatamente después de iniciarse).

Para ello, creamos el archivo `deployment.yaml` y añadimos el siguiente código dentro del archivo:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: multi-container-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: multi-container-app
  template:
    metadata:
      labels:
        app: multi-container-app
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
      - name: faulty-container
        image: busybox
        command: ['sh', '-c', 'echo "Simulating a crash"; sleep 5; exit 1']
```{{copy}}

El `nginx` container funciona correctamente y sirve contenido web en el puerto 80. El `faulty-container`, simula un fallo. Ejecuta un comando que imprime un mensaje, espera 5 segundos y luego falla con un código de salida 1.

Ahora podemos desplegar el deployment ejecutando el siguiente comando:

```bash
kubectl apply -f deployment.yaml
```{{exec}}

Para comprobar que el pod se ha desplegado pero esta fallando, ejecutamos el siguiente comando:

```bash
kubectl get pods
```{{exec}}