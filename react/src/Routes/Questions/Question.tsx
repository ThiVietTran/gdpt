import React, { useEffect, useState , useCallback} from 'react';
import { useParams , useNavigate} from 'react-router';
import { Link } from 'react-router-dom';
import { Button } from 'semantic-ui-react';
import API from 'Api';
import { useRequest } from 'Shared/Hooks';
import { Question } from 'Shared/Models';
import SimplePage from 'Shared/SimplePage';


const ViewQuestion = () => {
  const params = useParams<{ id: string }>();
  const questionID = Number(params.id);
  const [loading, error, run, question] = useRequest({} as Question);
  const navigate = useNavigate();
  
  // Define state to hold the loaded question
  const [loadedQuestion, setLoadedQuestion] = useState<Question | null>(null);

  // Fetch the question when component mounts
  useEffect(() => {
    if (questionID) {
      run(API.getQuestion(questionID));
    }
  }, [run, questionID]);

  // Update state with the loaded question
  useEffect(() => {
    if (question) {
      setLoadedQuestion(question);
    }
  }, [question]);

  // Handle delete function
  const handleDelete = useCallback(() => {
    try {
      API.deleteQuestion(questionID); 
      navigate('/questions');
    } catch (error: any) {
      console.error(error); // Log error to console
      // Handle error (show error message, etc.)
    }
  }, [questionID, navigate])

  // If question is still loading, show a loading indicator
  if (loading) {
    return <div>Loading...</div>;
  }

  // If there's an error, show the error message
  if (error) {
    return <div>Error: {error}</div>;
  }

  // If question hasn't loaded yet, return null or a loading indicator
  if (!loadedQuestion) {
    return null; // or <div>Loading...</div>;
  }

  // Destructure question object
  const {
    id,
    bac_hoc_id,
    question_text,
    option1,
    option2,
    option3,
    option4,
    explanation,
  } = loadedQuestion;

  return (
    <SimplePage icon='file alternate outline' title={bac_hoc_id}>
      <p style={{ whiteSpace: 'pre' }}>{question_text}</p>
      {/* Render options here */}
      <ul>
        <li>{option1.option}</li>
        <li>{option2.option}</li>
        <li>{option3.option}</li>
        <li>{option4.option}</li>
      </ul>
      <p>{String(typeof explanation === 'object' && explanation.Valid ? explanation.String: explanation)}</p>
      {/* Show edit button if question has an ID */}
      {id && id > 0 && (
        <div>
          <Button as={Link} to={`/question/${id}/edit`} content='Edit' />
          <Button onClick={handleDelete} content='Delete' />
        </div>
      )}
      
    </SimplePage>
  );
};

export default ViewQuestion;
