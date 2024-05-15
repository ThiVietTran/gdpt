import { BacHoc, Post, Question, User } from "Shared/Models"

export default class API {
  // SESSION
  static logout = () => (
    _delete('/session')
  )
  static login = (body: User) => (
    _post('/session', body)
  )

  // RESETS
  static reset = (body: { email: string }) => (
    _post('/reset', body)
  )
  static checkReset = (code: string) => (
    _get(`/reset/${code}`)
  )

  // USER
  static signup = (body: User) => (
    _post('/user', body)
  )
  static whoami = () => (
    _get('/user')
  )
  static verify = (body: { code: string }) => (
    _post('/user/verify', body)
  )
  static updatePassword = (body: { pass: string }) => (
    _put('/user/password', body)
  )

  // POSTS
  static getPosts = () => (
    _get('/post')
  )
  static getPost = (id: number) => (
    _get(`/post/${id}`)
  )
  static createPost = (body: Post) => (
    _post('/post', body)
  )
  static updatePost = (body: Post) => (
    _put('/post', body)
  )
  static deletePost = (id: number) => (
    _delete(`/post/${id}`)
  )

  // CAMERA
  static cameraCommand = (body: { cmd: string }) => (
    _post('/camera', body)
  )

  // QUESTIONS
  static getQuestions = () => (
    _get('/question')
  )
  static getQuestion = (id: number) => (
    _get(`/question/${id}`)
  )
  static createQuestion = (body: Question) => (
    _post('/question', body)
  )
  static updateQuestion = (body: Question) => (
    _put('/question', body)
  )
  static deleteQuestion = (id: number) => (
    _delete(`/question/${id}`)
  )

  // BAC HOC
  static getBacHocs = () => (
    _get('/bachoc')
  )
  static getBacHoc = (id: string) => (
    _get(`/bachoc/${id}`)
  )
  static createBacHoc = (body: BacHoc) => (
    _post('/bachoc', body)
  )
  static updateBacHoc = (body: BacHoc) => (
    _put('/bachoc', body)
  )
  static deleteBacHoc = (id: string) => (
    _delete(`/bachoc/${id}`)
  )
}

// internal utils
const _get = (url: string) => {
  return _fetch('GET', url);
}

const _post = (url: string, body: object) => {
  return _fetch('POST', url, body);
}

const _delete = (url: string) => {
  return _fetch('DELETE', url);
}

const _put = (url: string, body: object) => {
  return _fetch('PUT', url, body);
}

const _fetch = (method: string, url: string, body?: object) => {
  return fetch(`/api${url}`, {
    method: method,
    body: JSON.stringify(body),
    headers: {
      // CSRF prevention
      // https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)_Prevention_Cheat_Sheet#Use_of_Custom_Request_Headers
      'X-Requested-With': 'XMLHttpRequest'
    }
  })
    .then(resp => resp.json())
    .then(result => {
      if (result.error) {
        return Promise.reject(result.error);
      }
      return Promise.resolve(result);
    })
    .catch(error => {
      return Promise.reject(error.toString());
    });
}
