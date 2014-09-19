## Docker Base: Jenkins


This repository contains **Dockerbase** of [Jenkins](http://jenkins-ci.org/) for [Docker](https://www.docker.com/)'s [Dockerbase build](https://registry.hub.docker.com/u/dockerbase/service/) published on the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Depends on:

* [dockerbase/service](https://registry.hub.docker.com/u/library/service/)


### Installation

1. Install [Docker](https://docs.docker.com/installation/).

2. Download [Dockerbase build](https://registry.hub.docker.com/u/dockerbase/jenkins/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull dockerbase/jenkins`


### Usage

    run:
        sudo docker run --restart=always -t --cidfile cidfile -d dockerbase/jenkins /sbin/runit

    start:
        sudo docker start `cat cidfile`

    stop:
        sudo docker stop -t 10 `cat cidfile`

### Components & Versions

    Description:	Ubuntu 14.04.1 LTS
    git version 1.9.1
    OpenSSH_6.6.1p1 Ubuntu-2ubuntu2, OpenSSL 1.0.1f 6 Jan 2014
    jenkins	1.580
