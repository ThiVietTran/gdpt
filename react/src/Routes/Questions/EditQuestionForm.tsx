import React, { useEffect, useState, ChangeEvent, FormEvent } from 'react';
import { useParams } from 'react-router-dom'; // Import useHistory from react-router-dom
import { Button, Form, Input, TextArea } from 'semantic-ui-react';
import API from 'Api';
import { useNavigate } from 'react-router-dom';
import { useRequest } from 'Shared/Hooks';
import { Question } from 'Shared/Models';
import SimplePage from 'Shared/SimplePage';

const EditQuestionForm: React.FC = () => {
  const { id } = useParams<{ id: string }>();
  const questionID = Number(id);
  const navigate = useNavigate();
  const [loading, error, run, question] = useRequest<Question>({});
  
  // Define state to hold the loaded question
  const [loadedQuestion, setLoadedQuestion] = useState<Question | null>(null);

  // Define state to hold form input values
  const [formData, setFormData] = useState<Question>({
    bac_hoc_id: '', // Provide initial value for bac_hoc_id
    question_text: '', // Provide initial value for question_text
    explanation: 'Khong co loi giai thich', // Provide initial value for explanation
    option1: { option: '', is_answer: false }, // Provide initial value for option1
    option2: { option: '', is_answer: false }, // Provide initial value for option2
    option3: { option: '', is_answer: false }, // Provide initial value for option3
    option4: { option: '', is_answer: false }, // Provide initial value for option4

  });

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
      setFormData(question); // Set form data with loaded question values
    }
  }, [question]);

  // Function to handle form submission
  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    try {
      await API.updateQuestion(formData); // Update question using form data
      navigate(`/question/${questionID}`);
    } catch (error: any) {
      console.error(error); // Log error to console
      // Handle error (show error message, etc.)
    }
  };

  // Handle input change
  const handleInputChange = (e: ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value,
    });
  };

  const handleExplanationChange = (e: ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { value } = e.target;
    if (typeof formData.explanation === 'object') {
      setFormData({
        ...formData,
        explanation: { String: value, Valid: true }, // Update the explanation object
      });
    } else {
      setFormData({
        ...formData,
        explanation: value, // Update the explanation string
      });
    }
  };
  

  if (loading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  if (!loadedQuestion) {
    return null; // or <div>Loading...</div>;
  }

  // Destructure question object
  const {
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
      <Form onSubmit={handleSubmit}>
        <Form.Field>
          <label>Question Text</label>
          <TextArea
            name="question_text"
            value={formData.question_text || ''}
            onChange={handleInputChange}
          />
        </Form.Field>
        <Form.Field>
          <label>Option 1</label>
          <Input
            name="option1"
            value={formData.option1?.option || ''}
            onChange={handleInputChange}
          />
        </Form.Field>
        <Form.Field>
          <label>Option 2</label>
          <Input
            name="option2"
            value={formData.option2?.option || ''}
            onChange={handleInputChange}
          />
        </Form.Field>
        <Form.Field>
          <label>Option 3</label>
          <Input
            name="option3"
            value={formData.option3?.option || ''}
            onChange={handleInputChange}
          />
        </Form.Field>
        <Form.Field>
          <label>Option 4</label>
          <Input
            name="option4"
            value={formData.option4?.option || ''}
            onChange={handleInputChange}
          />
        </Form.Field>
        <Form.Field>
          <label>Explanation</label>
          <TextArea
            name="explanation"
            value= {String(typeof formData.explanation === 'object' && formData.explanation.Valid ? formData.explanation.String: formData.explanation)}
            onChange={handleExplanationChange}
          />
        </Form.Field>
        <Button type='submit' content='Update' />
      </Form>
    </SimplePage>
  );
};

export default EditQuestionForm;
