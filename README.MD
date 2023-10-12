<img src="https://raw.githubusercontent.com/agpsn/sonarr-develop/develop/logo.png" width="50" />

![ ](https://ghcr-badge.egpl.dev/agpsn/docker-sonarr/latest_tag?color=%23000000&ignore=latest&label=VERSION&trim=)
![ ](https://ghcr-badge.egpl.dev/agpsn/docker-sonarr/size?color=%23000000&tag=develop&label=SIZE&trim=)

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
