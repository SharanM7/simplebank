postgres:
	docker run --name postgres14 -p 5432:5432  -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d 41cd24e8c51b  

createdb:
	docker exec -it postgres14 createdb --username=root --owner=root simple_bank 

dropdb:
	docker exec -it postgres14 dropdb --username=root simple_bank 

migrateup:
	migrate -path db/migration -database "postgres://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgres://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

generate:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown generate