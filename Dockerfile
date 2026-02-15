FROM alpine:edge

ENV USER=penguin
ENV HOME=/home/${USER}

RUN \
apk update && \
apk add --no-cache \
	wine \
	xpra \
	xpra-webclient \
	dbus-x11 \
	xauth \
	mesa-gl \
	glib && \
dbus-uuidgen > /etc/machine-id && \
adduser -D ${USER} && \
mkdir -p ${HOME} && \
chown -R ${USER}:${USER} ${HOME}

USER ${USER}
WORKDIR ${HOME}
