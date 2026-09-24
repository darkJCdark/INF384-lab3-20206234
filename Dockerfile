# Dockerfile corregido — bloque A1.

# defecto 1 corregido: version fija (20) y la etapa se nombra "build",
# porque la etapa final (mas abajo, no se toca) hace COPY --from=build
FROM public.ecr.aws/lambda/nodejs:20 AS build

WORKDIR /build

# defecto 2 corregido: se copia primero el manifiesto y el lock file,
# antes que el codigo de la aplicacion
COPY package.json package-lock.json ./

# defecto 3 corregido: instalacion reproducible desde el lock file
RUN npm ci

# Recien ahora se copia el codigo fuente
COPY src ./src

# defecto 4 corregido: eliminada la credencial en texto plano
# (ya no se declara ENV DB_PASSWORD)

# defecto 5 corregido: eliminada la instalacion de herramientas de
# depuracion con el gestor de paquetes del sistema

### NO TOCAR DE ACA EN ADELANTE, CONSIDEREN QUE EL WORKDIR DEBE SER /build
RUN npx esbuild src/handler.js \
      --bundle --platform=node --target=node20 \
      --outfile=dist/handler.js

# Etapa final: recibe unicamente el artefacto empaquetado.
# El arbol de node_modules se queda en la etapa anterior.
FROM public.ecr.aws/lambda/nodejs:20 AS runtime
COPY --from=build /build/dist/handler.js ${LAMBDA_TASK_ROOT}/
CMD ["handler.handler"]
