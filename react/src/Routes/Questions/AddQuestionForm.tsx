import React, { useState } from 'react';
import { Form, Button, Message } from 'semantic-ui-react';
import { useNavigate } from 'react-router-dom';
import API from 'Api';
import { Question } from 'Shared/Models';
import SimplePage from 'Shared/SimplePage';

const AddQuestionForm = () => {
  // State hooks for managing form data, loading state, and errors
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [fields, setFields] = useState<Question>({
    bac_hoc_id: '',
    question_text: '',
    option1: { option: '', is_answer: false },
    option2: { option: '', is_answer: false },
    option3: { option: '', is_answer: false },
    option4: { option: '', is_answer: false },
  });

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
      navigate('/question/create');
    } catch (error: any) {
      setError(error.message || 'An error occurred');
    } finally {
      setLoading(false);
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
        {[1, 2, 3, 4].map(optionNum => (
          <div key={`option${optionNum}`}>
            <Form.Input
              name={`option${optionNum}`}
              type="text"
              placeholder={`Option ${optionNum}`}
              required
              value={(fields[`option${optionNum}` as keyof Question] as { option: string; is_answer: boolean }).option}
              onChange={(e) => handleOptionChange(optionNum, 'option', e.target.value)}
            />
            <Form.Checkbox
              name={`is_answer${optionNum}`}
              label="Is Answer"
              checked={(fields[`option${optionNum}` as keyof Question] as { option: string; is_answer: boolean }).is_answer}
              onChange={(e) => handleOptionChange(optionNum, 'is_answer', (e.target as HTMLInputElement).checked)}
            />
          </div>
        ))}
        <Button primary loading={loading} type="submit">
          Save
        </Button>
      </Form>
    </SimplePage>
  );
};

export default AddQuestionForm;
