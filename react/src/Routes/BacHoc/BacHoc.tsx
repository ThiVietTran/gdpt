import React, { useEffect } from 'react'

import { useParams } from 'react-router'
import { Link } from 'react-router-dom'
import { Button } from 'semantic-ui-react'

import API from 'Api'
import { useRequest } from 'Shared/Hooks'
import { BacHoc } from 'Shared/Models'
import SimplePage from 'Shared/SimplePage'

const Bac_Hoc = () => {
  const params = useParams<{ id: string }>();
  const bachocID = params.id;
  const [loading, error, run, bachoc] = useRequest({} as BacHoc);

  // if we have a bachoc ID, fetch it
  useEffect(() => {
    if (bachocID) {
      run(API.getBacHoc(bachocID))
    }
  }, [run, bachocID])

  const { id, name } = bachoc;

  return (
    <SimplePage icon='file alternate outline' title={id} loading={loading} error={error}>
      <p style={{whiteSpace: 'pre'}}>{name}</p>
      {id &&  
        <Button as={Link} to={`/bac_hoc/${id}/edit`} content='Edit' />}
    </SimplePage>
  )
}

export default Bac_Hoc;
