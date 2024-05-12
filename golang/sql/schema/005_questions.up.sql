CREATE SCHEMA questions;

CREATE TABLE questions (
    id BIGSERIAL PRIMARY KEY,
    bac_hoc_id TEXT NOT NULL,
    question_text TEXT NOT NULL,
    explanation TEXT NOT NULL,
    option1 JSONB NOT NULL,
    option2 JSONB NOT NULL,
    option3 JSONB NOT NULL,
    option4 JSONB NOT NULL,
    FOREIGN KEY (bac_hoc_id) REFERENCES bac_hoc(id)
);
