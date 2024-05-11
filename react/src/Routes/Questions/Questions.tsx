import React, { useContext, useEffect } from 'react'

import { Link } from 'react-router-dom'
import { Segment, Message, Header, Button, Placeholder, SegmentGroup, PlaceholderHeader } from 'semantic-ui-react'

import API from 'Api'
import { useRequest } from 'Shared/Hooks'
import { Question } from 'Shared/Models'
import SimplePage from 'Shared/SimplePage'
import { UserContainer } from 'Shared/UserContainer'

const Questions = () => {
  const [loading, error, run, questions] = useRequest([])
  const { user } = useContext(UserContainer)

  useEffect(() => {
    run(API.getQuestions())
  }, [run])

  return (
    <SimplePage icon='copy outline' title='Câu hỏi trắc nghiệm' error={error}>
      <p>Xin chào {user.email} </p>
      {loading && <QuestionsPlaceholder/>}
      {questions.length === 0 && !loading && 
        <Message warning>Không tìm thấy câu hỏi nào</Message>}
      {questions.map(SingleQuestion)}
      <Button as={Link} to='/question/create' primary icon='plus' content='Thêm câu hỏi' />
    </SimplePage>
  )
}

export default Questions;


interface SingleQuestionProps extends Question {
  id: number;
}

const SingleQuestion: React.FC<SingleQuestionProps> = ({ id, bac_hoc_id, question_text, option1, option2, option3, option4, explanation }: SingleQuestionProps) => (
  <Segment.Group key={id}>
    <Header attached='top' as='h3'>
      <Link to={`/question/${id}`}>{bac_hoc_id}</Link>
    </Header>
    <Segment attached='bottom'>
      <p>{question_text}</p>
      <ul>
        <li>{option1.option}</li>
        <li>{option2.option}</li>
        <li>{option3.option}</li>
        <li>{option4.option}</li>
      </ul>
      <p><strong>Explanation:</strong> {explanation}</p>
    </Segment>
  </Segment.Group>
);


const QuestionsPlaceholder = () => (
  <SegmentGroup style={{ marginBottom: '1em' }}>
    <Segment attached='bottom'>
      <Placeholder>
        <Placeholder.Header>
          <Placeholder.Line/>
        </Placeholder.Header>
      </Placeholder>
    </Segment>
    <Segment attached='top'>
      <Placeholder>
        <Placeholder.Paragraph>
          <Placeholder.Line />
          <Placeholder.Line />
        </Placeholder.Paragraph>
      </Placeholder>
    </Segment>
  </SegmentGroup>
);


