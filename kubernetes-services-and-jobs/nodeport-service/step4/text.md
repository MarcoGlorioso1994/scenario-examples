Para comprobar el correcto funcionamento del Service NodePort vamos a ejecutar una llamada http con utilizo de la herramienta Curl, directamente desde la command line del KillerCode

```
curl http://{ip_node1}:30123
```{{exec}}

Tendrias que recibir la pagina html del web server nginx. 

Podemos ejecutar la llamda http anterior pero utilizando esta vez la direccion ip del segundo nodo

```
curl http://{ip_node2}:30123
```{{exec}}

En esta forma, hemos visto que el servicio NodePort nos permite de acceder a un pod/application desde fuera del cluster, utilizando la ips fisico de los nodos. Tambien sin tener en consideracion sobre cual nodo esta en realidad desplegado el pod de la applicacion. 