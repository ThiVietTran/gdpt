import React from 'react'

import { Link } from 'react-router-dom'
import { Segment } from 'semantic-ui-react'

import SimplePage from 'Shared/SimplePage';

import SignUpForm from './SignUpForm'
import {Image} from 'semantic-ui-react'
const SignUp = () => (
  <SimplePage centered title=''>
    <Image src='./icon/logo.png' avatar size='small'/>
    <h1> Tạo Tài Khoản </h1>
    <Segment.Group>
      <Segment>
        <SignUpForm/>
      </Segment>
      <Segment>
        Already have an account? <Link to="/login">Log In</Link>.
      </Segment>
    </Segment.Group>
  </SimplePage>
);

export default SignUp;
