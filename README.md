# docker

Scripts para ejecutar aplicaciones dentro de contenedores

En éste enfoque no descago una imágen e instalo las aplicaciones,

utilizo los programas instalados en su propia máquina pero los 

ejecuto dentro de un contenedor, así se limita al acceso a ciertas

carpetas y/o recursos del sistema

# google-chrome-docker.sh

En este script se ejecuta google-chome dentro de un container,

se asume que en la máquina host el navegador está instalado en /opt/google

y se debe cambiar la variable version por el valor actual de la distribución

de ubuntu que está ejecutando.

Sólo se comparte la carpeta "Descargas" y la carpeta home del usuario es temporal

El script se puede copiar a la carpeta /usr/local/bin y el lanzador de aplicaciones

en la carpeta ~/.local/share/applications para que aparezca en el menú.
