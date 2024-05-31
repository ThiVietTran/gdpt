import React, { useContext, useEffect } from 'react'

import { Link } from 'react-router-dom'
import { Segment, Message, Header, Button, Placeholder, SegmentGroup, PlaceholderHeader } from 'semantic-ui-react'

import API from 'Api'
import { useRequest } from 'Shared/Hooks'
import { Don_vi } from 'Shared/Models'
import SimplePage from 'Shared/SimplePage'
import { UserContainer } from 'Shared/UserContainer'

const DONVIs = () => {
  const [loading, error, run, donvis] = useRequest([])
  const { user } = useContext(UserContainer)

  useEffect(() => {
    run(API.getDonVis())
  }, [run])

  return (
    <SimplePage icon='copy outline' title='DonVi' error={error}>
      <p>This page fetches some protected data that only the logged in user ({user.email}) can see!</p>
      {loading && <PostsPlaceholder/>}
      {donvis.length === 0 && !loading && 
        <Message warning>No don vi found...</Message>}
      {donvis.map(SingleDONVI)}
      <Button as={Link} to='/don_vi/create' primary icon='plus' content='New DonVi' />
    </SimplePage>
  )
}

export default DONVIs;

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

const SingleDONVI = ({ id, name }: Don_vi) => (
  <Segment.Group key={id}>
    <Header attached='top' as='h3'>
      <Link to={`/don_vi/${id}`}>{id}</Link>
    </Header>
    <Segment attached='bottom' content={name} />
  </Segment.Group>
)
