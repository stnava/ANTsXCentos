

Portable ANTsR docker app based on minimal centos:7 image.

https://hub.docker.com/_/centos


```
docker build  -t  antsrcentos .
```

to push an update

```
 docker tag antsrcentos:latest stnava/antsrcentos:latest
 docker push  stnava/antsrcentos:latest
```


Users should run

```
docker run -it --rm antsrcentos /bin/bash
```
