#!/bin/sh
set -m

if [ -z "$VAULT_DEV_ROOT_TOKEN_ID" ]; then
    export VAULT_DEV_ROOT_TOKEN_ID=testtoken
fi
if [ -z "$VAULT_DEV_LISTEN_ADDRESS" ]; then
    export VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200
fi

export VAULT_ADDR=http://0.0.0.0:8200
export VAULT_TOKEN=$VAULT_DEV_ROOT_TOKEN_ID

vault server -dev -dev-listen-address="$VAULT_DEV_LISTEN_ADDRESS" -dev-root-token-id="$VAULT_TOKEN" &
sleep 1 && \
vault mount transit && \
vault write -f transit/keys/default
wait

