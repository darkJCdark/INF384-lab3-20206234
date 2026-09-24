# Declaración de uso de IA generativa

Para este laboratorio usé un asistente de IA (Claude) como apoyo puntual, dentro de lo que permiten las indicaciones generales del curso para laboratorios.

## Para qué lo usé

- Para entender partes del enunciado que no me quedaban claras a la primera lectura (por ejemplo la relación entre el pipeline de aplicación y el de infraestructura, o el rol del `ignore_changes` en la Lambda).
- Para obtener un primer borrador de los jobs de GitHub Actions (los cuatro gates de A2, el job `publicar` de A3) y del `Dockerfile` corregido, que luego revisé, adapté y probé yo mismo en mi repositorio.
- Para interpretar mensajes de error reales de mis propias ejecuciones cuando no entendía la causa (por ejemplo un fallo de `COPY --from` en el build de Docker, un error de configuración de "Automatic Analysis" en SonarCloud, y la rotación de cuenta de mi entorno académico de AWS que invalidó el bucket y el repositorio ECR que había creado antes).

## Qué hice yo

Cada sugerencia la corrí yo mismo en mi fork y en mi propia cuenta de AWS/SonarCloud, no las apliqué a ciegas. Leí los logs completos de cada ejecución fallida, decidí qué cambiar según lo que el enunciado realmente pedía, y resolví por mi cuenta los problemas de configuración que no eran de código: cargar y renovar credenciales de AWS, crear el proyecto en SonarCloud y generar su token, desactivar el análisis automático, volver a correr `setup-infra` con un nombre de bucket nuevo cuando el entorno académico me cambió de cuenta, y corregir un error de tipeo (espacios de más) al lanzar ese mismo workflow. También verifiqué con evidencia (capturas de las ejecuciones) que cada parte cumplía lo pedido antes de darla por terminada.

## Por qué lo considero un uso válido

El curso permite el uso de IA en los laboratorios siempre que se declare, y la usé como acelerador de comprensión y como generador de un primer borrador de código, no como reemplazo del trabajo de configurar, ejecutar, depurar y verificar el pipeline, que hice yo directamente sobre mi propio entorno.
