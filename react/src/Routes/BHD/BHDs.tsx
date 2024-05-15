import React, { useContext, useEffect } from 'react'

import { Link } from 'react-router-dom'
import { Segment, Message, Header, Button, Placeholder, SegmentGroup, PlaceholderHeader } from 'semantic-ui-react'

import API from 'Api'
import { useRequest } from 'Shared/Hooks'
import { Bhd } from 'Shared/Models'
import SimplePage from 'Shared/SimplePage'
import { UserContainer } from 'Shared/UserContainer'

const BHDs = () => {
  const [loading, error, run, bhds] = useRequest([])
  const { user } = useContext(UserContainer)

  useEffect(() => {
    run(API.getBhds())
  }, [run])

  return (
    <SimplePage icon='copy outline' title='BHD' error={error}>
      <p>This page fetches some protected data that only the logged in user ({user.email}) can see!</p>
      {loading && <PostsPlaceholder/>}
      {bhds.length === 0 && !loading && 
        <Message warning>No bhd found...</Message>}
      {bhds.map(SingleBHD)}
      <Button as={Link} to='/bhd/create' primary icon='plus' content='New BHD' />
    </SimplePage>
  )
}

export default BHDs;

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

const SingleBHD = ({ id, name }: Bhd) => (
  <Segment.Group key={id}>
    <Header attached='top' as='h3'>
      <Link to={`/bhd/${id}`}>{id}</Link>
    </Header>
    <Segment attached='bottom' content={name} />
  </Segment.Group>
)
