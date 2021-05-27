# docker

Run GUI applications in Docker

Ejecutar aplicaciones gráficas de linux en Dockers.

En éste enfoque no descago una imagen e instalo las aplicaciones, utilizo los programas instalados en su propia máquina pero los ejecuto dentro de un contenedor con la imagen alpine, así se limita al acceso a ciertas carpetas y/o recursos del sistema.

# Como se logra ésto?

Ejecuto una imagen Alpine y comparto todas las carpetas del sistema en el contenedor así tiene todas las librerías y luego ejecuto el programa.

`
docker run -d --rm --net host --user 1000:1000 \
		-v /bin:/bin:ro \
		-v /usr:/usr:ro \
		-v /var:/var:ro \
		-v /etc:/etc:ro \
		-v /lib:/lib:ro \
		-v /lib64:/lib64:ro \
		-v /opt:/opt:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v "${DIRECTORIO}":"${HOME}" \
		-e "DISPLAY=unix${DISPLAY}" \
		-e LANG="${LANG}" \
		-e GDK_SCALE \
		-e GDK_DPI_SCALE \
		-v /dev/shm:/dev/shm \
		--privileged \
		--device /dev/snd \
		--device /dev/dri \
		--device /dev/video0 \
		--device /dev/usb \
		--device /dev/bus/usb \
		--group-add audio \
		--group-add video \
		alpine:3.12 /usr/bin/google-chrome 
`

# google-chrome-docker

En este script se ejecuta google-chome dentro de un container.

Sólo se comparte la carpeta "Descargas" y la carpeta home del usuario es temporal.

El script se puede copiar a la carpeta /usr/local/bin y el lanzador de aplicaciones en la carpeta ~/.local/share/applications para que aparezca en el menú.

Hay 4 niveles de ejecución

- Nivel 1: se ejecuta el navegador en forma privada, no se tiene los accesos a la carpeta home del usuario y cuando se reinicia la máquina se borran todos los archivos.

- Nivel 2: se ejecuta el navegador pero sólo se comparte los directorios Desktop y Downloads.

- Nivel 3: se ejecuta el navegador, se comparten los directorios Desktop, Downloads y donde google-chrome guarda toda su configuración.

- Nivel 4: se ejecuta el navegador, se comparte todo el directorio HOME.

# chromium-docker

En este script se ejecuta chromium dentro de un container.

Sólo se comparte la carpeta "Descargas" y la carpeta home del usuario es temporal.

El script se puede copiar a la carpeta /usr/local/bin y el lanzador de aplicaciones en la carpeta ~/.local/share/applications para que aparezca en el menú.

# firefox-docker

En este script se ejecuta firefox dentro de un container.

Sólo se comparte la carpeta "Descargas" y la carpeta home del usuario es temporal.

El script se puede copiar a la carpeta /usr/local/bin y el lanzador de aplicaciones en la carpeta ~/.local/share/applications para que aparezca en el menú.

# wps-docker

WPS Office es una excelente herramienta para trabajar con documentos de word, excel y powerpoint, me gusta más que libreoffice ya que tiene mejor compatibilidad y estabilidad.

Lo coloco en un container para que las aplicaciones no tengan acceso a internet, y se puede ajustar para limitar la carpeta HOME, por defecto está compartido en su totalidad pero como uno tiene esos documentos por todos lados entonces se agrego permiso a todo el directorio home.

El script se puede copiar a la carpeta /usr/local/bin y el lanzador de aplicaciones en la carpeta ~/.local/share/applications para que aparezca en el menú.

# Conclusiones

En éste experimento podemos observar como podemos ejecutar aplicaciones gráficas de linux usando contenedores para limitar el acceso a recursos del sistema.

La ventaja de éste enfoque es que los programas están actualizadas, sólo se necesita una imagen para ejecutar el contenedor, no es necesario descargar imágenes de otros programadores que tienen todo empaquetado y de dudosa procedencia.

Está probado en ubuntu 16.04, 18.04, 20.10 y Raspbian OS, me gustaría si pueden probarlo en otras distribuciones para hacer ajustes en los scripts.

# Comentarios y sugerencias

Jairo Graterón jgrateron@gmail.com


