# nginx-param
Proxy NGINX parametrizado en modo usuario
## Ṕarámetros en build time, con --build-arg
- PORT: puerto en el que escucha nginx
- USER: usuario propietario de los archivos
## Parámetros en run time, con -e
- BACK_HOST: host que se quiere exponer
- BACK_PORT: puerto del servicio que se quiere exponer
