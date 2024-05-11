-- name: CreateQuestion :one
INSERT INTO questions (bac_hoc_id, question_text, option1, option2, option3, option4, explanation) 
  VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *;

-- name: UpdateQuestion :one
UPDATE questions 
SET 
    bac_hoc_id = $1,
    question_text = $2,
    option1 = $3,
    option2 = $4,
    option3 = $5,
    option4 = $6,
    explanation = $7 
WHERE id = $8
RETURNING *;

-- name: FindAllQuestions :many
SELECT * FROM questions ORDER BY id;

-- name: FindQuestionByIDs :one
SELECT * FROM questions WHERE id = $1 LIMIT 1;

-- name: DeleteQuestionByIDs :exec
DELETE FROM questions WHERE id = $1;
