#!/bin/bash
set -eu

echo $(cat ~/.ghcr-token) | docker login ghcr.io -u $(cat ~/.ghcr-user) --password-stdin &>/dev/null

#GBRANCH=$(git branch | grep "*" | rev | cut -f1 -d" " | rev)

SVERSION=$(curl -sX GET http://services.sonarr.tv/v1/releases | jq -r "first(.[] | select(.branch==\"develop\") | .version)");

#if [ $GBRANCH != "develop" ]; then git checkout "develop"; fi
	echo "Building and Pushing 'ghcr.io/agpsn/docker-sonarr:$SVERSION'"
	docker build  --force-rm --rm --tag ghcr.io/agpsn/docker-sonarr:develop --tag ghcr.io/agpsn/docker-sonarr:${SVERSION} --tag ghcr.io/agpsn/docker-sonarr:latest -f ./Dockerfile.develop .
	docker push  ghcr.io/agpsn/docker-sonarr:develop; docker push  ghcr.io/agpsn/docker-sonarr:$SVERSION && docker image rm -f ghcr.io/agpsn/docker-sonarr:$SVERSION
	git tag -f $SVERSION && git push origin $SVERSION -f --tags
	echo ""
	git add . && git commit -m "Updated" && git push 
