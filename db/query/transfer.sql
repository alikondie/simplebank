-- name: CreateTransfer :one
INSERT INTO transfer (from_account_id, to_account_id, amount) VALUES ($1, $2, $3) RETURNING *;

-- name: GetTransfer :one
SELECT * FROM transfer
WHERE id = $1 LIMIT 1;

-- name: ListTransfers :many
SELECT * FROM transfer
ORDER BY id
LIMIT $1
OFFSET $2
;

-- name: DeleteTransfer :exec
DELETE FROM transfer
WHERE id = $1;