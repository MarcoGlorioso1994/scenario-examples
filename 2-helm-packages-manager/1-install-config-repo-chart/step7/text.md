En este paso del laboratorio, queremos analizar el concepto de `Rollback`.

En Helm, el concepto de rollback (reversión) se refiere al **proceso de volver a una revisión anterior de un release**, es decir, a un estado anterior de una aplicación que fue desplegada o actualizada previamente. Esto resulta útil cuando se realiza una actualización que no funciona correctamente o provoca problemas, y se desea restaurar la aplicación a un estado funcional anterior.

Para la release llamada `mi-aplicacion-v2`, hemos realizado varias actualizaciones. Para ver las revisiones de ese release, puedes ejecutar:

```bash
helm history mi-aplicacion-v2
```{{exec}}

Ahora deseamos realizar un rollback de nuestra aplicación (release Helm) `mi-aplicacion-v2` a la revisión 1 (release inicial). Para hacer el rollback, utilizamos el siguiente comando:

```bash
helm rollback mi-aplicacion-v2 1
```{{exec}}

Deberías recibir un mensaje de éxito como el siguiente: "Rollback was a success! Happy Helming!". Esto significa que el rollback a la revisión 1 se ha completado con éxito.

Podemos ver cómo se ha actualizado el historial de la release `mi-aplicacion-v2`:
```bash
helm history mi-aplicacion-v2
```{{exec}}

Podemos observar que ahora existe una nueva revisión que corresponde al rollback a la revisión 1.