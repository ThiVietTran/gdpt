import React, { useEffect, useState, ChangeEvent, FormEvent } from 'react';
import { useParams } from 'react-router-dom';
import { Button, Form, Input, TextArea } from 'semantic-ui-react';
import API from 'Api';
import { useNavigate } from 'react-router-dom';
import { useRequest } from 'Shared/Hooks';
import { Question } from 'Shared/Models';
import SimplePage from 'Shared/SimplePage';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

const EditQuestionForm: React.FC = () => {
  const { id } = useParams<{ id: string }>();
  const questionID = Number(id);
  const navigate = useNavigate();
  const [loading, error, run, question] = useRequest<Question>({});
  
  const [loadedQuestion, setLoadedQuestion] = useState<Question | null>(null);

  const [formData, setFormData] = useState<Question>({
    bac_hoc_id: '',
    question_text: '',
    explanation: '',
    option1: { option: '', is_answer: false },
    option2: { option: '', is_answer: false },
    option3: { option: '', is_answer: false },
    option4: { option: '', is_answer: false },
  });

  // Add custom styles to center the toast notifications
  const customToastStyle = {
    top: '20%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
  };

  useEffect(() => {
    if (questionID) {
      run(API.getQuestion(questionID));
    }
  }, [run, questionID]);

  useEffect(() => {
    if (question) {
      setLoadedQuestion(question);
      setFormData(question);
    }
  }, [question]);

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    try {
      await API.updateQuestion(formData);
      toast.success('Question updated successfully!', { autoClose: 2000 }); // Show success notification
      navigate(`/question/${questionID}`);
    } catch (error: any) {
      console.error(error);
    }
  };

  const handleInputChange = (e: ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value,
    });
  };

  const handleCheckboxChange = (optionNum: number, checked: boolean) => {
    setFormData(prevState => ({
      ...prevState,
      [`option${optionNum}`]: {
        ...prevState[`option${optionNum}` as keyof Question] as { option: string; is_answer: boolean },
        is_answer: checked
      }
    }));
  };

  if (loading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  if (!loadedQuestion) {
    return null;
  }

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
        {[1, 2, 3, 4].map(optionNum => (
          <Form.Field key={`option${optionNum}`}>
            <label>{`Option ${optionNum}`}</label>
            <Input
              name={`option${optionNum}`}
              value={(formData[`option${optionNum}` as keyof Question] as { option: string; is_answer: boolean })?.option || ''}
              onChange={handleInputChange}
            />
            <Form.Checkbox
              label="Is Answer"
              checked={(formData[`option${optionNum}` as keyof Question] as { option: string; is_answer: boolean })?.is_answer || false}
              onChange={(e, { checked }) => handleCheckboxChange(optionNum, checked as boolean)}
            />
          </Form.Field>
        ))}
        <Form.Field>
          <label>Explanation</label>
          <TextArea
            name="explanation"
            value={explanation}
            onChange={handleInputChange}
          />
        </Form.Field>
        <Button type='submit' content='Update' />
      </Form>
      <ToastContainer position="top-center" autoClose={2000} style={customToastStyle} />
    </SimplePage>
  );
};

export default EditQuestionForm;
