<--![ ](https://img.shields.io/github/v/tag/agpsn/sonarr-develop?color=00CCFF&label=:develop&style=plastic&logo=%20)-->

![ ](https://ghcr-badge.egpl.dev/agpsn/docker-sonarr/size?tag=develop?color=00CCFF)
![ ](https://ghcr-badge.egpl.dev/agpsn/docker-sonarr/latest_tag?trim=major&label=develop)

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
