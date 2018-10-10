node_build:
	docker build -t node_spa_image -f Dockerfile_node .

node_run:
	docker run -p 8080:8080 -d node_spa_image

nginx_build:
	yarn build
	git log | head -n 6 > dist/git_log.txt
	docker build -t nginx_spa_image -f Dockerfile_nginx .

nginx_run:
	docker run -p 8080:80 -d nginx_spa_image

