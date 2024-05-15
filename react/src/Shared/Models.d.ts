export type Post = {
  id?: number,
  title: string,
  body: string
}

export type User = {
  id?: number,
  email: string,
  pass: string
}

export type Question = {
  id?: number,
  bac_hoc_id: string, // Change categoryID to bac_hoc_id
  question_text: string, // Change text to question
  explanation?: string,
  option1: { // Represent JSONB structure for option1
    option: string,
    is_answer: boolean
  },
  option2: { // Represent JSONB structure for option2
    option: string,
    is_answer: boolean
  },
  option3: { // Represent JSONB structure for option3
    option: string,
    is_answer: boolean
  },
  option4: { // Represent JSONB structure for option4
    option: string,
    is_answer: boolean
  }
}

export type BacHoc = {
  id: string,
  name: string
}

export type Bhd = {
  id: string,
  name: string
}


