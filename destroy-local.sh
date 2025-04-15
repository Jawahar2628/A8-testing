#!/bin/bash

set -e
source .env

export FLYTECTL_CONFIG=~/.flyte/config-sandbox.yaml

flytectl demo teardown -v

docker compose -f ./be/docker-compose.yaml down -v