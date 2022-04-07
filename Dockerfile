FROM nginx:1.21-alpine

RUN apk update && apk add --no-cache gettext nano

ENV VARS='${BACK_HOST},${BACK_PORT},${BODY_SIZE},${PROXY_TIMEOUT}'

COPY nginx.template /etc/nginx/nginx.template0

RUN touch /tmp/nginx.conf

ARG USER

RUN chown "$USER" /tmp/nginx.conf

ARG PORT

RUN envsubst '${PORT}' < /etc/nginx/nginx.template0 > /etc/nginx/nginx.template

EXPOSE "$PORT"

USER "$USER"

CMD envsubst "$VARS" < /etc/nginx/nginx.template > /tmp/nginx.conf && nginx -g "daemon off;" -p "$PWD" -c /tmp/nginx.conf