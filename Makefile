
docker-build-tag:
	docker build -t cloudolife/col-hexo -t cloudolife/col-hexo:node-15.9.0-alpine3.10-hexo-6.1.0 .

docker-run-it:
	docker run -it --name col-hexo -p 4000:4000 --rm -v ${PWD}:/app cloudolife/col-hexo bash