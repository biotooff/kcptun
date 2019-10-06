#!/bin/bash
VERSION=`date -u +%Y%m%d`
LDFLAGS="-X main.VERSION=$VERSION -s -w"
GCFLAGS=""

# OSES=(linux windows)
# ARCHS=(amd64)
# for os in ${OSES[@]}; do
	# for arch in ${ARCHS[@]}; do
		# suffix=""
		# if [ "$os" == "windows" ]
		# then
			# suffix=".exe"
		# fi
		# env CGO_ENABLED=0 GOOS=$os GOARCH=$arch go build -ldflags "$LDFLAGS" -gcflags "$GCFLAGS" -o client_${os}_${arch}${suffix} github.com/biotooff/kcptun/client
		# env CGO_ENABLED=0 GOOS=$os GOARCH=$arch go build -ldflags "$LDFLAGS" -gcflags "$GCFLAGS" -o server_${os}_${arch}${suffix} github.com/biotooff/kcptun/server
	# done
# done

 env CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -ldflags "$LDFLAGS" -gcflags "$GCFLAGS" -o client_windows_64.exe github.com/biotooff/kcptun/client
 env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "$LDFLAGS" -gcflags "$GCFLAGS" -o server_linux_server github.com/biotooff/kcptun/server