#!/bin/bash

set -e
source .env

if [ ! -d "${VENV_DIR}" ]; then
    python3 -m venv "${VENV_DIR}"
fi

source ${VENV_DIR}/bin/activate

pip install -r ./flyte/requirements.txt

N=$(which flytectl | grep "not found" | wc -l)
if [ "${N}" = "1" ]; then
    curl -sL https://ctl.flyte.org/install | sudo bash -s -- -b /usr/local/bin
fi

export FLYTECTL_CONFIG=~/.flyte/config-sandbox.yaml

flytectl demo start

flytectl create project --file ./flyte/project.yaml

docker compose -f ./be/docker-compose.yaml up -d

echo "To finish the setup, please run the following command on your terminal:"
echo "source ${VENV_DIR}/bin/activate"
