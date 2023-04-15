#!/bin/bash
clear; set -eu

echo $(cat ~/.ghcr-token) | docker login ghcr.io -u $(cat ~/.ghcr-user) --password-stdin &>/dev/null

	GBRANCH=$(git branch | grep "*" | rev | cut -f1 -d" " | rev)
	DVERSION=$(curl -sX GET http://services.sonarr.tv/v1/releases | jq -r "first(.[] | select(.branch==\"develop\") | .version)");

if [ $GBRANCH != "develop" ]; then git checkout "develop"; fi

#BUILD/PUSH v4
	echo "Building and Pushing 'ghcr.io/agpsn/docker-sonarr:$DVERSION'"
	docker build --quiet --force-rm --rm --tag ghcr.io/agpsn/docker-sonarr:develop --tag ghcr.io/agpsn/docker-sonarr:${DVERSION} -f ./Dockerfile.develop .
	docker push --quiet ghcr.io/agpsn/docker-sonarr:develop; docker push --quiet ghcr.io/agpsn/docker-sonarr:$DVERSION && docker image rm -f ghcr.io/agpsn/docker-sonarr:$DVERSION
	git tag $DVERSION && git push origin $DVERSION --tags
	echo ""

#SOURCE
	git add . && git commit -m "Updated" && git push --quiet
