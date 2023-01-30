install:
	kustomize build . | kubectl apply -f -

build: build-avahi

build-avahi:
	cd avahi/docker && docker build -t ghcr.io/coderanger/avahi:latest .
	cd avahi/docker && docker push ghcr.io/coderanger/avahi:latest
