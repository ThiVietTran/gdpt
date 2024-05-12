import React, { useContext, useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { Segment, Header, Button, Placeholder, Container, Card } from 'semantic-ui-react';
import API from 'Api';
import { useRequest } from 'Shared/Hooks';
import { Question } from 'Shared/Models';
import SimplePage from 'Shared/SimplePage';
import { UserContainer } from 'Shared/UserContainer';

// Define the SingleQuestion component
const SingleQuestion: React.FC<Question> = ({
  id,
  question_text,
  option1,
  option2,
  option3,
  option4,
}) => {
  const [selectedOption, setSelectedOption] = useState<string | null>(null);

  // Handle click on an option
  const handleOptionClick = (option: string, is_answer: boolean) => {
    setSelectedOption(option);
  };

  return (
    <Segment.Group>
      <Header attached='top' as='h3'>
        Câu {id}
      </Header>
      <Segment attached='bottom'>
        <p>{question_text}</p>
        <ul>
        <li onClick={() => handleOptionClick(option1.option, option1.is_answer)} style={{ cursor: 'pointer', color: selectedOption === option1.option ? (option1.is_answer ? 'yellow' : 'red') : 'inherit' }}>{option1.option}</li>
          <li onClick={() => handleOptionClick(option2.option, option2.is_answer)} style={{ cursor: 'pointer', color: selectedOption === option2.option ? (option2.is_answer ? 'yellow' : 'red') : 'inherit' }}>{option2.option}</li>
          <li onClick={() => handleOptionClick(option3.option, option3.is_answer)} style={{ cursor: 'pointer', color: selectedOption === option3.option ? (option3.is_answer ? 'yellow' : 'red') : 'inherit' }}>{option3.option}</li>
          <li onClick={() => handleOptionClick(option4.option, option4.is_answer)} style={{ cursor: 'pointer', color: selectedOption === option4.option ? (option4.is_answer ? 'yellow' : 'red') : 'inherit' }}>{option4.option}</li>
        </ul>
        {/* Render Next button only if an option is selected */}
        
      </Segment>
    </Segment.Group>
  );
};

// Define the Questions component
const PracticeMulChoice: React.FC = () => {
  const [loading, error, run, questions] = useRequest<Question[]>([]);
  const [selectedQuestionIndex, setSelectedQuestionIndex] = useState<number>(0); // State to track the index of the selected question

  // Fetch questions on component mount
  useEffect(() => {
    run(API.getQuestions());
  }, [run]);

  // Handle click on a question
  const handleQuestionClick = (question: Question) => {
    const index = questions.findIndex(q => q.id === question.id);
    setSelectedQuestionIndex(index);
  };

  // Handle "Next" button click
  const handleNextButtonClick = () => {
    // Move to the next question
    setSelectedQuestionIndex(prevIndex => (prevIndex + 1) % questions.length);
  };

  return (
    <SimplePage icon='copy outline' title='Câu hỏi trắc nghiệm' error={error}>
      <Container>
        <div style={{ display: 'flex', justifyContent: 'space-between' }}>
          {/* Question list component */}
          <div style={{ flex: '1', marginRight: '1rem' }}>
            {!loading && questions && (
              <QuestionList questions={questions} onQuestionClick={handleQuestionClick} />
            )}
          </div>
          {/* Display selected question */}
          <div style={{ flex: '2' }}>
            {!loading && questions.length > 0 && (
              <SingleQuestion {...questions[selectedQuestionIndex]} />
            )}
            <Button primary  onClick={handleNextButtonClick}>Next</Button>
          </div>
        </div>
        
      </Container>
      {/* Button to navigate to create question page */}
      
      {/* "Next" button */}
      
    </SimplePage>
  );
};

// Define the QuestionList component
const QuestionList: React.FC<{ questions: Question[]; onQuestionClick: (question: Question) => void }> = ({
  questions,
  onQuestionClick,
}) => {
  const [showList, setShowList] = useState<boolean>(false);
  const [currentPage, setCurrentPage] = useState<number>(1);
  const questionsPerPage: number = 40;

  // Toggle the visibility of the question list
  const toggleList = () => {
    setShowList(!showList);
  };

  // Get current questions
  const indexOfLastQuestion: number = currentPage * questionsPerPage;
  const indexOfFirstQuestion: number = indexOfLastQuestion - questionsPerPage;
  const currentQuestions: Question[] = questions.slice(indexOfFirstQuestion, indexOfLastQuestion);

  // Change page
  const nextPage = () => {
    setCurrentPage(currentPage + 1);
  };

  const prevPage = () => {
    setCurrentPage(currentPage - 1);
  };

  return (
    <Card fluid>
      <Card.Content>
        {/* Button to toggle visibility of question list */}
        <Button fluid onClick={toggleList} content={showList ? 'Hide Question List' : 'Show Question List'} />
        {/* Display the question list only if showList is true */}
        {showList && (
          <>
            <Header as="h3">Danh sách câu hỏi</Header>
            <Card.Description>
              {/* Render questions in rows of 5 */}
              <div style={{ display: 'flex', flexWrap: 'wrap' }}>
                {currentQuestions.map((question, index) => (
                  <Button key={index} style={{ margin: '5px 10px' }} onClick={() => onQuestionClick(question)}>
                    Câu {question.id}
                  </Button>
                ))}
              </div>
              {/* Pagination buttons */}
              <div style={{ marginTop: '1rem' }}>
                <Button onClick={prevPage} disabled={currentPage === 1}>Previous</Button>
                <Button onClick={nextPage} disabled={currentQuestions.length < questionsPerPage}>Next</Button>
              </div>
            </Card.Description>
          </>
        )}
      </Card.Content>
    </Card>
  );
};

export default PracticeMulChoice; // Export the Questions component
