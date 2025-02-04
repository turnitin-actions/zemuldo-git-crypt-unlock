#!/bin/sh

echo "$GPG_PRIVATE_KEY" | base64 -d > "$HOME"/git-crypt-key.asc

gpg --batch --import "$HOME"/git-crypt-key.asc

gpgconf --kill gpg-agent

gpg-agent --daemon --allow-preset-passphrase --max-cache-ttl 3153600000

if [ "$GPG_KEY_PASS" != "" ]; then
/usr/libexec/gpg-preset-passphrase --preset --passphrase "$GPG_KEY_PASS" "$GPG_KEY_GRIP"
fi

git config --global --add safe.directory /github/workspace

git-crypt unlock

rm "$HOME"/git-crypt-key.asc