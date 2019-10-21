#!/bin/bash
VERSION=`date -u +%Y%m%d`
LDFLAGS="-X main.VERSION=$VERSION -s -w"
GCFLAGS=""

spec=$1
if [ -z $spec ];then
spec="server client"
fi

if [[ $spec =~ "client" ]];then
env CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -ldflags "$LDFLAGS" -gcflags "$GCFLAGS" -o client_windows_64.exe github.com/biotooff/kcptun/client
fi 

if [[ $spec =~ "server" ]];then
env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "$LDFLAGS" -gcflags "$GCFLAGS" -o server_linux_server github.com/biotooff/kcptun/server
fi