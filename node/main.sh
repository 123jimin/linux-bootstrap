#!/usr/bin/env bash

echo "- Node.js"

NODE_MAJOR=20

check_node_version() {
    if ! command -v node &> /dev/null; then
        echo "  - Node.js is currently not installed on this machine."
        return 1
    fi

    local CURR_NODE_VER=$(node -v | grep --color=never -oP 'v\K[0-9]+')
    if [ "$CURR_NODE_VER" -lt "$NODE_MAJOR" ]; then
        echo "  - An old version (v$CURR_NODE_VER) of Node.js is installed on this machine."
        return 1
    fi

    echo "  - The latest version (v$CURR_NODE_VER) is already installed on this machine."
    return 0
}

if check_node_version; then
    exit 0
fi

if [ $(id -u) -ne 0 ]; then
    echo "  - Skipping Node.js installation... (requires root permission)"
    exit 0
fi

echo "  - Installing..."

apt update
apt install -y ca-certificates curl gnupg

mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" > /etc/apt/sources.list.d/nodesource.list

apt update
apt install -y nodejs