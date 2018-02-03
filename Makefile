CI_BUILD_REF ?= $(shell git rev-parse --verify HEAD)
CONTAINER_NAME = flask-hello-world
PYFILES = flask_hw

clean:
	rm -rf .eggs/ build/ dist/ logs/ *.egg-info/
	-find . -name '__pycache__' -prune -exec rm -rf "{}" \;
	-find . -name '*.pyc' -delete

install:
	pip3 install -r requirements.txt

lint:
	flake8 ${PYFILES}

format:
	yapf -r -i ${PYFILES}

dk-build:
	docker build \
		-t  ${CONTAINER_NAME}:${CI_BUILD_REF} \
		-t  ${CONTAINER_NAME}:latest \
		--build-arg "commit=${CI_BUILD_REF}" \
		.

dk-run:
	docker run \
		-p 5000:5000 \
		-v $$(pwd):/opt/mdzhang/${CONTAINER_NAME} \
		-d \
		${CONTAINER_NAME}:latest
