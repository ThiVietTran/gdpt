import React, { useEffect } from 'react'

import { useParams } from 'react-router'
import { Link } from 'react-router-dom'
import { Button } from 'semantic-ui-react'

import API from 'Api'
import { useRequest } from 'Shared/Hooks'
import { Bhd } from 'Shared/Models'
import SimplePage from 'Shared/SimplePage'

const BHD = () => {
  const params = useParams<{ id: string }>();
  const bhdID = params.id;
  const [loading, error, run, bhd] = useRequest({} as Bhd);

  // if we have a bhd ID, fetch it
  useEffect(() => {
    if (bhdID) {
      run(API.getBhd(bhdID))
    }
  }, [run, bhdID])

  const { id, name } = bhd;

  return (
    <SimplePage icon='file alternate outline' title={id} loading={loading} error={error}>
      <p style={{whiteSpace: 'pre'}}>{name}</p>
      {id &&  
        <Button as={Link} to={`/bhd/${id}/edit`} content='Edit' />}
    </SimplePage>
  )
}

export default BHD;
