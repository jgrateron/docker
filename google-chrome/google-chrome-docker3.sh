DIRECTORIO=`mktemp -d`
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
		-v "${HOME}/.config/google-chrome":"${HOME}/.config/google-chrome" \
		-v "${HOME}/.local/share/applications":"${HOME}/.local/share/applications" \
		-v "${HOME}/.pki":"${HOME}/.pki" \
		-v "${HOME}/Downloads":"${HOME}/Downloads" \
		-v "${HOME}/Desktop":"${HOME}/Desktop" \
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

