-- name: CreateQuestion :one
INSERT INTO questions (categoryid, text, option1id, option2id, option3id, option4id, explanation) 
  VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *;

-- name: UpdateQuestionExplain :one
UPDATE questions SET explanation = $1 WHERE id = $2 RETURNING *;

-- name: FindAllQuestions :many
SELECT * FROM questions ORDER BY id;

-- name: FindQuestionByIDs :one
SELECT * FROM questions WHERE id = $1 LIMIT 1;

-- name: DeleteQuestionByIDs :exec
DELETE FROM questions WHERE id = $1;
