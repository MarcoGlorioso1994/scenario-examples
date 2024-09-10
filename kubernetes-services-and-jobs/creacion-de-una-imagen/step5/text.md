Ahora que tenemos el contenedor corriendo, vamos a ver cómo podemos interactuar con él.

Podemos ejecutar un comando dentrod el contenedor con "docker exec"

```bash
docker exec my-node-app curl -s -d ping http://localhost:8080
```

Si todo ha ido bien, deberías ver el mensaje `pong`.