Ahora que Helm está instalado, vamos a agregar el repositorio de Bitnami, ejecutando el siguiente comando.

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
```{{exec}}

Este comando se utiliza para añadir un nuevo repositorio de charts (paquetes de aplicaciones) a tu cliente de Helm.
Cuando añades un repositorio, Helm puede buscar y descargar charts desde ese repositorio. Es útil para acceder a una colección de charts que puedes instalar en tu clúster de Kubernetes.

Actualiza los repositorios:

```bash
helm repo update
```{{exec}}

Ahora vamos a buscar un chart de Nginx Ingress Controller en el repositorio de Bitnami con v9.9. Ejecuta el siguiente comando:

```bash
helm search repo nginx-ingress-controller --version 9.9 -l
```{{exec}}

Con este comando puedes visualizar las diferentes versiones de un Chart. Continuamos en el siguiente paso, donde vamos a instalar nuestro primer chart.