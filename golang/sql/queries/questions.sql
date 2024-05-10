-- name: CreateQuestion :one
INSERT INTO questions (categoryid, text, option1id, option2id, option3id, option4id, explanation) 
  VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id;

-- name: UpdateQuestionExplain :exec
UPDATE questions SET explanation = $1 WHERE id = $2;

-- name: FindAllQuestions :many
SELECT q.id, q.text, q.explanation, c.id, c.name, o1.id, o1.text, o1.is_answer, o2.id, o2.text, o2.is_answer, o3.id, o3.text, o3.is_answer, o4.id, o4.text, o4.is_answer 
FROM questions q INNER JOIN options o1 ON q.option1id = o1.id INNER JOIN options o2 ON q.option2id = o2.id INNER JOIN options o3 ON q.option3id = o3.id INNER JOIN options o4 ON q.option4id = o4.id INNER JOIN categories c ON q.categoryid = c.id ORDER BY q.id;