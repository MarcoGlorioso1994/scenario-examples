Para comprobar el correcto funcionamiento del servicio NodePort, vamos a ejecutar una llamada HTTP utilizando la herramienta `curl`, directamente desde la línea de comandos de KillerCode.

```
curl http://{ip_node1}:30123
```{{exec}}

Deberías recibir la página HTML del servidor web Nginx.

Podemos ejecutar la llamada HTTP anterior, pero esta vez utilizando la dirección IP del segundo nodo.

```
curl http://{ip_node2}:30123
```{{exec}}

De esta forma, hemos visto que el servicio NodePort nos permite acceder a un pod o aplicación desde fuera del clúster, utilizando las IPs físicas de los nodos. También nos permite hacerlo sin tener en cuenta en qué nodo está realmente desplegado el pod de la aplicación. 