import React, { useEffect } from 'react'

import { useParams } from 'react-router'
import { Link } from 'react-router-dom'
import { Button } from 'semantic-ui-react'

import API from 'Api'
import { useRequest } from 'Shared/Hooks'
import { Don_vi } from 'Shared/Models'
import SimplePage from 'Shared/SimplePage'

const DONVI = () => {
  const params = useParams<{ id: string }>();
  const DonViID = params.id;
  const [loading, error, run, donvi] = useRequest({} as Don_vi);

  // if we have a DonVi ID, fetch it
  useEffect(() => {
    if (DonViID) {
      run(API.getDonVi(DonViID))
    }
  }, [run, DonViID])

  const { id, name } = donvi;

  return (
    <SimplePage icon='file alternate outline' title={id} loading={loading} error={error}>
      <p style={{whiteSpace: 'pre'}}>{name}</p>
      {id &&  
        <Button as={Link} to={`/don_vi/${id}/edit`} content='Edit' />}
    </SimplePage>
  )
}

export default DONVI;
