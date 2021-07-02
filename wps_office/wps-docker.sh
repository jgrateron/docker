docker run -m 1024m --memory-swap 1024m -d --rm --net none --user 1000:1000 \
		-v /bin:/bin:ro \
		-v /usr:/usr:ro \
		-v /var:/var:ro \
		-v /etc:/etc:ro \
		-v /lib:/lib:ro \
		-v /lib64:/lib64:ro \
		-v /opt:/opt:ro \
		-v /var/run/cups:/var/run/cups:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v "${HOME}":"${HOME}" \
		-e "DISPLAY=unix${DISPLAY}" \
		-e LANG="${LANG}" \
		-e GDK_SCALE \
		-e GDK_DPI_SCALE \
		alpine:3.12 /usr/bin/wps "$1"

