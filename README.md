# FEM Acoustics
Sistema de Método de Elementos Finitos para Acústica

## Instalación

1. Instalar Docker Desktop.
2. En la terminal, construir el contenedor de docker 
```docker build -t fem-acoustics```
3. Ejecutar el contenedor en la terminal.
```docker run --init -ti -p 8888:8888 fem-acoustics```
4. Al iniciar el sistema, se verá algo como `(base) root@numeros-aleatorios:/app#`, para iniciar jupyter lab, ejecutar el comando  ```jupyter lab --ip='0.0.0.0' --port=8888 --no-browser --allow-root```
5. Ahora vaya al navegador e ingrese al url `localhost:8888`, le pedirá el token que aparece en  el mensaje de consola de jupyter lab. Por ejemplo, si aparece una url `http://127.0.0.1:8888/lab?token=44f9774680cc2a516409b3d507569bc6c90449f18788fac8`, entonces el token que debe copiar es `44f9774680cc2a516409b3d507569bc6c90449f18788fac8`.
6. Realizando bien los pasos, ya podrá utilizar jupyter notebook con fenics-dolphinx.