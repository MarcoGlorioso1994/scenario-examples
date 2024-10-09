Puedes inspeccionar el contenido del archivo descargado para conocer los detalles de la configuración.

Obtén los detalles (notas en Helm) de la instalación creada en el paso anterior. Suponiendo que tu aplicación se llama `apache`, ejecuta los siguientes comandos:

```bash
helm get notes apache
```{{exec}}

Podemos visualizar los valores de la instalación:

```bash
helm get values apache
```{{exec}}

Y por último, pero no por ello menos importante, analizar el manifiesto de los recursos YAML definidos en el Chart:

```bash
helm get manifest apache
```{{exec}}