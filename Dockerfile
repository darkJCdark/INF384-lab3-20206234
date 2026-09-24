# Dockerfile del repositorio base.
# Contiene cinco malas practicas deliberadas. Cada una lleva su numero en la
# linea anterior. Corregirlas es el bloque A1 de la guia del laboratorio.

# defecto 1
FROM public.ecr.aws/lambda/nodejs:20 AS build

WORKDIR ${LAMBDA_TASK_ROOT}

# defecto 2
COPY package.json package-lock.json ./

# defecto 3
RUN npm ci

COPY src ./src

RUN npm run build

FROM public.ecr.aws/lambda/nodejs:20

WORKDIR ${LAMBDA_TASK_ROOT}

# defecto 4: eliminada la credencial en texto plano

# defecto 5
COPY --from=build ${LAMBDA_TASK_ROOT}/dist/handler.js ./dist/handler.js

CMD ["src/handler.handler"]
