#!/bin/bash

GOVERSION="1.16.6"

wget https://golang.org/dl/go$(GOVERSIONI).linux-amd64.tar.gz
rm -rf /usr/local/go
tar -C /usr/local -xzf go$(GOVERSION).linux-amd64.tar.gz
rm go$(GOVERSION).linux-amd64.tar.gz