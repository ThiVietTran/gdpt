import React from 'react'

import { Segment } from 'semantic-ui-react'

import SimplePage from 'Shared/SimplePage'

import SWCameraForm from './SWCameraForm'

const SWCamera = () => (
  <SimplePage title='Camera AI' centered>
    <Segment.Group>
      <Segment>
        <SWCameraForm />
      </Segment>
    </Segment.Group>
  </SimplePage>
);

export default SWCamera;
