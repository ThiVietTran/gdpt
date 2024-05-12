import React, { useState } from 'react';
import { Form, Button, Message } from 'semantic-ui-react';
import { useNavigate } from 'react-router-dom';
import API from 'Api';
import { Question } from 'Shared/Models';
import SimplePage from 'Shared/SimplePage';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

const AddQuestionForm = () => {
  // State hooks for managing form data, loading state, and errors
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [fields, setFields] = useState<Question>({
    bac_hoc_id: 'luc3',
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

  // Function to handle changes in form input fields
  const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = event.target;
    setFields(prevState => ({
      ...prevState,
      [name]: value
    }));
  };

  // Function to handle changes in option fields
  const handleOptionChange = (optionNum: number, field: keyof Question['option1'], value: string | boolean) => {
    console.log(value)
    console.log(fields)
    setFields(prevState => ({
      ...prevState,
      [`option${optionNum}` as keyof Question]: {
        ...prevState[`option${optionNum}` as keyof Question] as { option: string; is_answer: boolean },
        [field]: value
      }
    }));
  };

  // Function to handle form submission
  const handleSubmit = async () => {
    try {
      setLoading(true);
      await API.createQuestion(fields);
      toast.success('Question created successfully!', { autoClose: 2000 }); // Show success notification
      navigate('/question/create');
    } catch (error: any) {
      setError(error.message || 'An error occurred');
    } finally {
      setLoading(false);
      setFields({
        bac_hoc_id: 'luc3',
        question_text: '',
        explanation: '',
        option1: { option: '', is_answer: false },
        option2: { option: '', is_answer: false },
        option3: { option: '', is_answer: false },
        option4: { option: '', is_answer: false },
      });
    }
  };

  // JSX for rendering the form
  return (
    <SimplePage icon="plus square outline" title="Add New Question">
      <Form error={!!error} loading={loading} onSubmit={handleSubmit}>
        <Message error content={error} />
        <Form.Input
          name="bac_hoc_id"
          type="text"
          placeholder="Bac hoc"
          required
          value={fields.bac_hoc_id}
          onChange={handleChange}
        />
        <Form.Input
          name="question_text"
          type="text"
          placeholder="Question Text"
          required
          value={fields.question_text}
          onChange={handleChange}
        />
        <Form.Input
          name="explanation"
          type="text"
          placeholder="Explanation"
          required
          value={fields.explanation}
          onChange={handleChange}
        />
        {[1, 2, 3, 4].map(optionNum => (
          <div key={`option${optionNum}`}>
            <Form.Input
              name={`option${optionNum}`}
              type="text"
              placeholder={`Option ${optionNum}`}
              required
              // value={fields[`option${optionNum}`].option}
              value={(fields[`option${optionNum}` as keyof Question] as { option: string; is_answer: boolean }).option}
              onChange={(e) => handleOptionChange(optionNum, 'option', e.target.value)}
            />
            <Form.Checkbox
              name={`is_answer${optionNum}`}
              label="Is Answer"
              checked={(fields[`option${optionNum}` as keyof Question] as { option: string; is_answer: boolean }).is_answer}
              onChange={(e, { checked }) => handleOptionChange(optionNum, 'is_answer', checked as boolean)}
            />
          </div>
        ))}
        <Button primary loading={loading} type="submit">
          Save
        </Button>
      </Form>
      <ToastContainer position="top-center" autoClose={2000} style={customToastStyle} />
    </SimplePage>
  );
};

export default AddQuestionForm;
