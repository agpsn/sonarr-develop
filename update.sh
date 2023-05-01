#!/bin/bash
set -eu

[ ! -d "/mnt/user/system/agpsn-github/sonarr-develop" ] && echo "No repo!" && exit 1
cd "/mnt/user/system/agpsn-github/sonarr-develop"

echo $(cat ~/.ghcr-token) | docker login ghcr.io -u $(cat ~/.ghcr-user) --password-stdin &>/dev/null

SVERSION=$(curl -sX GET http://services.sonarr.tv/v1/releases | jq -r "first(.[] | select(.branch==\"develop\") | .version)");

echo "Building and Pushing 'ghcr.io/agpsn/docker-sonarr:$SVERSION'"
docker build  --force-rm --rm --tag ghcr.io/agpsn/docker-sonarr:develop --tag ghcr.io/agpsn/docker-sonarr:${SVERSION} --tag ghcr.io/agpsn/docker-sonarr:latest -f ./Dockerfile.develop .
docker push --quiet ghcr.io/agpsn/docker-sonarr:develop; docker push --quiet ghcr.io/agpsn/docker-sonarr:$SVERSION && docker image rm -f ghcr.io/agpsn/docker-sonarr:$SVERSION
git tag -f $SVERSION && git push --quiet origin $SVERSION -f --tags
git add . && git commit -m "Updated" && git push --quiet
echo ""
