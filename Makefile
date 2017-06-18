PWD:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

server:
#	docker run --rm --name genderidentity.io-helloworld -v $(PWD):/usr/share/nginx/html:ro -p 80:80 nginx
	docker build -t genderidentity.io .
	docker run --name genderidentity -p 3000:3000 -d -v $(PWD):/usr/src/app genderidentity.io
