Puedes inspeccionar el contenido del archivo descargado para conocer los detalles de la configuración.

Obtén los detalles de la instalación (Notas en Helm) con los siguientes comandos. Suponiendo que tu aplicación se llama `wordpress`:

```bash
helm get notes wordpress
```{{exec}}

Podemos visualizar los valores de la instalación:

```bash
helm get values wordpress
```{{exec}}

Y por último, pero no por ello menos importante, analizar el manifiesto de los recursos YAML definidos en el Chart:

```bash
helm get manifest wordpress
```{{exec}}