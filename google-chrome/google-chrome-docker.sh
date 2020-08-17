DIRECTORIO=`mktemp -d`
VERSION="16.04"
docker run -d --rm --net host --user 1000:1000 \
		-it \
		-v /usr:/usr:ro \
		-v /var:/var:ro \
		-v /etc:/etc:ro \
		-v /lib:/lib:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v "${DIRECTORIO}":"${HOME}" \
		-v "${HOME}/Descargas":"${HOME}/Downloads" \
		-v /opt/google:/opt/google \
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
		ubuntu:${VERSION} /usr/bin/google-chrome https://www.google.com
