import React from 'react'

import { Link } from 'react-router-dom'

import SimplePage from 'Shared/SimplePage';

const Home = () => (
  <SimplePage icon='rocket' title='WEB GDPT!'>
    <p>This is a boilerplate app using React for the front-end, and Golang + Postgres for the backend.</p>
    <p><Link to="/signup">Sign Up</Link> to see how sessions work, and to create and view private posts.</p>
  </SimplePage>
)

export default Home;
