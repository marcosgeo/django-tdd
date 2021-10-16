build:
	docker-compose up -d --build

test:
	docker-compose exec movies pytest -p no:warnings

coverage:
	docker-compose exec movies pytest -p no:warnings --cov=.

coverage/html:
	docker-compose exec movies pytest -p no:warnings --cov=. --cov-report html

lint:
	docker-compose exec movies flake8 .

black/apply:
	docker-compose exec movies black --check --exclude=migrations .

black/diff:
	docker-compose exec movies black --diff --exclude=migrations .

isort:
	docker-compose exec movies isort . --check-only

isort/diff:
	docker-compose exec movies isort . --diff

isort/apply:
	docker-compose exec movies isort .
