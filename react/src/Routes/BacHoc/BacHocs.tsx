import React, { useContext, useEffect } from 'react'

import { Link } from 'react-router-dom'
import { Segment, Message, Header, Button, Placeholder, SegmentGroup, PlaceholderHeader } from 'semantic-ui-react'

import API from 'Api'
import { useRequest } from 'Shared/Hooks'
import { BacHoc } from 'Shared/Models'
import SimplePage from 'Shared/SimplePage'
import { UserContainer } from 'Shared/UserContainer'

const BacHocs = () => {
  const [loading, error, run, bachocs] = useRequest([])
  const { user } = useContext(UserContainer)

  useEffect(() => {
    run(API.getBacHocs())
  }, [run])

  return (
    <SimplePage icon='copy outline' title='Bac hoc' error={error}>
      <p>This page fetches some protected data that only the logged in user ({user.email}) can see!</p>
      {loading && <PostsPlaceholder/>}
      {bachocs.length === 0 && !loading && 
        <Message warning>No bac hoc found...</Message>}
      {bachocs.map(SingleBacHoc)}
      <Button as={Link} to='/bac_hoc/create' primary icon='plus' content='New bac hoc' />
    </SimplePage>
  )
}

export default BacHocs;

const PostsPlaceholder = () => (
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
)

const SingleBacHoc = ({ id, name }: BacHoc) => (
  <Segment.Group key={id}>
    <Header attached='top' as='h3'>
      <Link to={`/bac_hoc/${id}`}>{id}</Link>
    </Header>
    <Segment attached='bottom' content={name} />
  </Segment.Group>
)
