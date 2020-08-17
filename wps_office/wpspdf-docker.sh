VERSION="16.04"
docker run -d --rm --net none --user 1000:1000 \
		-v /usr:/usr:ro \
		-v /var:/var:ro \
		-v /etc:/etc:ro \
		-v /lib:/lib:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v "${HOME}":"${HOME}" \
		-v /opt/kingsoft:/opt/kingsoft \
		-e "DISPLAY=unix${DISPLAY}" \
		-e LANG="${LANG}" \
		-e GDK_SCALE \
		-e GDK_DPI_SCALE \
		ubuntu:${VERSION} /usr/bin/wpspdf "$1"

