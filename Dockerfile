FROM alpine:latest

LABEL "name"="Git-Crypt Unlock"
LABEL "maintainer"="Zemuldo <danstan.otieno@gmail.com>"

LABEL "com.github.actions.icon"="unlock"
LABEL "com.github.actions.color"="red"
LABEL "com.github.actions.name"="Git-Crypt Unlock"
LABEL "com.github.actions.description"="Action to Unlock files encrypted using Git-Crypt, supports keys with passphrase"

RUN apk add --update git-crypt gpg gpg-agent && rm -rf /var/cache/apk/*

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]