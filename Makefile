
docker-build-tag:
	# docker buildx create --name mybuilder --driver docker-container
	# docker buildx use mybuilder
	docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t cloudolife/col-hexo -t cloudolife/col-hexo:node-15.9.0-alpine3.10-hexo-6.1.01 .
docker-run-it:
	docker run -it --rm --name col-hexo -p 4000:4000 -v ${PWD}:/app cloudolife/col-hexo bash