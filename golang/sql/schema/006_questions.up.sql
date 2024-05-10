CREATE SCHEMA questions;

CREATE TABLE questions (
    id BIGSERIAL PRIMARY KEY,
    categoryid INTEGER NOT NULL,
    text TEXT NOT NULL,
    option1id INTEGER NOT NULL,
    option2id INTEGER NOT NULL,
    option3id INTEGER NOT NULL,
    option4id INTEGER NOT NULL,
    explanation TEXT,
    FOREIGN KEY (categoryid) REFERENCES categories(id),
    FOREIGN KEY (option1id) REFERENCES options(id),
    FOREIGN KEY (option2id) REFERENCES options(id),
    FOREIGN KEY (option3id) REFERENCES options(id),
    FOREIGN KEY (option4id) REFERENCES options(id)
);