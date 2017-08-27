PWD:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

server:
	docker build -t genderidentity.io .
	docker run -d --rm --name genderidentity -p 80:3000 genderidentity.io
