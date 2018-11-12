start:
	docker-compose up -d

logs:
	docker-compose logs -f

stop:
	docker-compose down -v

reload: stop start

build-testrunner-server:
	docker-compose -f testrunner/docker-compose.yml build

start-testrunner-server: build-testrunner-server
	# cannot do "docker-compose up", since we need the error-code:
	docker-compose -f testrunner/docker-compose.yml run testrunner yarn test

wait:
	echo "waiting for cluster to start..."
	sleep 5

test: start wait
	make start-testrunner-server;\
	EXIT_CODE=$$?;\
	make stop;\
	exit $$EXIT_CODE  # return exit code from testrunner

build-testrunner-client:
	docker build -t loffek/testrunner-client ./testrunner-client

push-testrunner-client: build-testrunner-client
	docker tag loffek/testrunner-client loffek/testrunner-client:v0.1
	docker push loffek/testrunner-client:v0.1
