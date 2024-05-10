import React, { useEffect } from 'react'

import { useParams } from 'react-router'
import { Link } from 'react-router-dom'
import { Button } from 'semantic-ui-react'

import API from 'Api'
import { useRequest } from 'Shared/Hooks'
import { Question } from 'Shared/Models'
import SimplePage from 'Shared/SimplePage'

const ViewQuestion = () => {
  const params = useParams<{ id: string }>();
  const questionID = Number(params.id);
  const [loading, error, run, question] = useRequest({} as Question);

  // if we have a question ID, fetch it
  useEffect(() => {
    if (questionID) {
      run(API.getQuestion(questionID))
    }
  }, [run, questionID])

  const { id, categoryId, text, option1Id, option2Id, option3Id, option4Id, explanation } = question;

  return (
    <SimplePage icon='file alternate outline' title={categoryId.toString()} loading={loading} error={error}>
      <p style={{whiteSpace: 'pre'}}>{text}</p>
      {id && id > 0 && 
        <Button as={Link} to={`/question/${id}/edit`} content='Edit' />}
    </SimplePage>
  )
}

export default ViewQuestion;
