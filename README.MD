![ ](https://ghcr-badge.egpl.dev/agpsn/docker-sonarr/size?tag=develop&color=black&label=SIZE&trim=patch&trim=major&ignore=sha256*)
![ ](https://ghcr-badge.egpl.dev/agpsn/docker-sonarr/latest_tag?color=black&label=VERSION&trim=patch&trim=major&ignore=sha256*)

```
docker run -d \
  --name=sonarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=UTC \
  -e UMASK=022 \
  -p <hostport>:8989 \
  -v <hostconfigpath>:/config \
  -v <hostmediapath>:/data \
  --restart unless-stopped \
  ghcr.io/agpsn/docker-sonarr:develop
```
