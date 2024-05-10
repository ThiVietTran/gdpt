import { useEffect, useCallback } from 'react'

import { useParams, useNavigate } from "react-router-dom";
import { Form, Message, Button } from 'semantic-ui-react'

import API from 'Api'
import { useRequest, useFields } from 'Shared/Hooks';
import { Question } from 'Shared/Models'
import SimplePage from 'Shared/SimplePage';

const QuestionForm = () => {
  const params = useParams<{ id: string }>();
  const questionID = Number(params.id);
  const [loading, error, run] = useRequest({} as Question)
  const {fields, handleChange, setFields} = useFields({} as Question)
  const navigate = useNavigate();

  // if we have a question ID, fetch it
  useEffect(() => {
    if (questionID) {
      run(API.getQuestion(questionID), (question) => {
        setFields(question);
      });
    }
  }, [questionID, run, setFields])

  // handlers
  const handleSubmit = useCallback(() => {
    const action = questionID ? API.updateQuestion(fields) : API.createQuestion(fields);
    run(action, (data) => {
      navigate(`/question/${data.id}`);
    })
  }, [questionID, fields, run, navigate])

  const handleDelete = useCallback(() => {
    run(API.deleteQuestion(questionID), () => {
      navigate('/questions')
    })
  }, [run, questionID, navigate])

  const { id, categoryId, text, option1Id, option2Id, option3Id, option4Id, explanation } = fields;

  return (
    <SimplePage icon='file alternate outline' title={questionID ? `Edit Question #${questionID}` : 'Create a Question'}>
      <Form error name="createQuestion" loading={loading} onSubmit={handleSubmit}>
        <Message error>{error}</Message>
        <Form.Input
          autoFocus
          size="big"
          name="categoryId"
          type="number"
          placeholder="Category ID"
          required
          value={categoryId}
          onChange={handleChange} />
        <Form.Input
          name="text"
          type="text"
          placeholder="Question Text"
          required
          value={text}
          onChange={handleChange} />
        <Form.Input
          name="option1Id"
          type="number"
          placeholder="Option 1 ID"
          required
          value={option1Id}
          onChange={handleChange} />
        <Form.Input
          name="option2Id"
          type="number"
          placeholder="Option 2 ID"
          required
          value={option2Id}
          onChange={handleChange} />
        <Form.Input
          name="option3Id"
          type="number"
          placeholder="Option 3 ID"
          required
          value={option3Id}
          onChange={handleChange} />
        <Form.Input
          name="option4Id"
          type="number"
          placeholder="Option 4 ID"
          required
          value={option4Id}
          onChange={handleChange} />
        <Form.TextArea
          name="explanation"
          rows={4}
          placeholder="Explanation"
          value={explanation}
          onChange={handleChange} />
        <Button primary size="huge" type="submit">Save</Button>
        {id && id > 0 &&
          <Button negative size="huge" type="button" onClick={handleDelete}>Delete</Button>}
      </Form>
    </SimplePage>
  )
}

export default QuestionForm;
