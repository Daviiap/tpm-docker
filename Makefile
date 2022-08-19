.PHONY: build clean

BUILD_CONTAINER_NAME?=swtpmbuild

build:
	git clone https://github.com/deitch/swtpm-build.git ./swtpm-build
	cp Dockerfile ./swtpm-build/Dockerfile.tpm
	cd swtpm-build; docker build -t swtpmbuild -f ./Dockerfile.tpm .

	rm -rf ./swtpm-build

	docker run swtpmbuild &
