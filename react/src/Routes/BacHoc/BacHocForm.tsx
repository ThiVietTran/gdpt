import { useEffect, useCallback } from 'react'

import { useParams, useNavigate } from "react-router-dom";
import { Form, Message, Button } from 'semantic-ui-react'

import API from 'Api'
import { useRequest, useFields } from 'Shared/Hooks';
import { BacHoc } from 'Shared/Models'
import SimplePage from 'Shared/SimplePage';

const BacHocForm = () => {
  const params = useParams<{ id: string }>();
  const bac_hocID = params.id;
  const [loading, error, run] = useRequest({} as BacHoc)
  const { fields, handleChange, setFields } = useFields({} as BacHoc)
  const navigate = useNavigate();

  // if we have a bac hoc ID, fetch it
  useEffect(() => {
    if (bac_hocID) {
      run(API.getBacHoc(bac_hocID), (bachoc) => {
        setFields(bachoc);
      });
    }
  }, [bac_hocID, run, setFields])

  // handlers
  const handleSubmit = useCallback(() => {
    const action = bac_hocID ? API.updateBacHoc(fields) : API.createBacHoc(fields);
    run(action, (data) => {
      navigate(`/bac_hoc/${data.id}`);
    })
  }, [bac_hocID, fields, run, navigate])

  const handleDelete = useCallback(() => {
    if (bac_hocID) {
      run(API.deleteBacHoc(bac_hocID), () => {
        navigate('/bac_hocs')
      })
    }
  }, [run, bac_hocID, navigate])

  const { id, name } = fields;

  return (
    <SimplePage icon='file alternate outline' title={bac_hocID ? `Edit Bac Hoc #${bac_hocID}` : 'Create a BacHoc'}>
      <Form error name="createBacHoc" loading={loading} onSubmit={handleSubmit}>
        <Message error>{error}</Message>
        <Form.Input
          autoFocus
          size="big"
          name="id"
          type="text"
          placeholder="Post Title"
          required
          value={id}
          onChange={handleChange} />
        <Form.TextArea
          name="name"
          rows={4}
          placeholder="Post content"
          required
          value={name}
          onChange={handleChange} />
        <Button primary size="huge" type="submit">Save</Button>
        {id && 
          <Button negative size="huge" type="button" onClick={handleDelete}>Delete</Button>}
      </Form>
    </SimplePage>
  )
}

export default BacHocForm;
