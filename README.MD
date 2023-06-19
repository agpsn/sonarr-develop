![ ](https://ghcr-badge.egpl.dev/agpsn/docker-sonarr/size?tag=develop&color=#00ccff&label=VERSION&trim=patch&trim=major&ignore=sha256*)
![ ](https://ghcr-badge.egpl.dev/agpsn/docker-sonarr/latest_tag?color=#00ccff&label=VERSION&trim=patch&trim=major&ignore=sha256*)

```
docker run -d \
  --name=sonarr \
  -e PUID=99 \
  -e PGID=100 \
  -e TZ=UTC \ #optional
  -e UMASK=022 \  #optional
  -p <hostport>:8989 \
  -v <hostconfigpath>:/config \
  -v <hostmediapath>:/data \ #optional
  --restart unless-stopped \  #optional
  ghcr.io/agpsn/docker-sonarr:develop
```
