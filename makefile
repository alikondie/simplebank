makepsql:
	docker run --name postgres-latest -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=admin -d postgres

startpsql:
	docker start postgres-latest

createdb:
	docker exec -it postgres-latest createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -ot postgres-latest dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:admin@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:admin@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc: 
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test
