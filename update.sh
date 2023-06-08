#!/bin/bash
set -eu

SVERSION=$(curl -sX GET http://services.sonarr.tv/v1/releases | jq -r "first(.[] | select(.branch==\"develop\") | .version)");

echo $(cat ../.token) | docker login ghcr.io -u $(cat ../.user) --password-stdin &>/dev/null

echo "Updating Sonarr: v$SVERSION"
docker build --quiet --force-rm --rm --tag ghcr.io/agpsn/docker-sonarr:develop --tag ghcr.io/agpsn/docker-sonarr:$SVERSION -f ./Dockerfile.develop .
git tag -f $SVERSION && git push --quiet origin $SVERSION -f --tags
git add . && git commit -m "Updated" && git push --quiet
docker push --quiet ghcr.io/agpsn/docker-sonarr:develop; docker push --quiet ghcr.io/agpsn/docker-sonarr:$SVERSION && docker image rm -f ghcr.io/agpsn/docker-sonarr:$SVERSION
echo ""
