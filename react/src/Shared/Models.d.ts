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
  categoryId: number,
  text: string,
  option1Id: number,
  option2Id: number,
  option3Id: number,
  option4Id: number,
  explanation?: string
}
