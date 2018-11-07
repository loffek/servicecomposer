start:
	docker-compose up -d

logs:
	docker-compose logs -f

stop:
	docker-compose down -v

reload: stop start

build-testrunner:
	docker-compose -f testrunner/docker-compose.testrunner.yml build

start-testrunner: build-testrunner
	# cannot do "docker-compose up", since we need the error-code:
	docker-compose -f testrunner/docker-compose.testrunner.yml run testrunner yarn test

wait:
	echo "waiting for cluster to start..."
	sleep 5

test: start wait
	make start-testrunner;\
	EXIT_CODE=$$?;\
	make stop;\
	exit $$EXIT_CODE  # return exit code from testrunner
