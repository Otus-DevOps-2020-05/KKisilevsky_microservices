#!/bin/bash
# https://github.com/percona/mongodb_exporter
# Prerequisites:
# 1. Go compiler
# 2. Docker and Docker Compose

go get -u github.com/percona/mongodb_exporter
cd ${GOPATH-$HOME/go}/src/github.com/percona/mongodb_exporter
make docker
docker tag mongodb-exporter:master kkisilevsky/mongodb-exporter
docker push kkisilevsky/mongodb-exporter

# 3. Create mongo user
