import { useEffect, useCallback } from 'react'

import { useParams, useNavigate } from "react-router-dom";
import { Form, Message, Button } from 'semantic-ui-react'

import API from 'Api'
import { useRequest, useFields } from 'Shared/Hooks';
import { Bhd } from 'Shared/Models'
import SimplePage from 'Shared/SimplePage';

const BHDForm = () => {
  const params = useParams<{ id: string }>();
  const bhdID = params.id;
  const [loading, error, run] = useRequest({} as Bhd)
  const { fields, handleChange, setFields } = useFields({} as Bhd)
  const navigate = useNavigate();

  // if we have a bhd ID, fetch it
  useEffect(() => {
    if (bhdID) {
      run(API.getBhd(bhdID), (bhd) => {
        setFields(bhd);
      });
    }
  }, [bhdID, run, setFields])

  // handlers
  const handleSubmit = useCallback(() => {
    const action = bhdID ? API.updateBhd(fields) : API.createBhd(fields);
    run(action, (data) => {
      navigate(`/bhd/${data.id}`);
    })
  }, [bhdID, fields, run, navigate])

  const handleDelete = useCallback(() => {
    if (bhdID) {
      run(API.deleteBhd(bhdID), () => {
        navigate('/bhds')
      })
    }
  }, [run, bhdID, navigate])

  const { id, name } = fields;

  return (
    <SimplePage icon='file alternate outline' title={bhdID ? `Edit BHD #${bhdID}` : 'Create a BHD'}>
      <Form error name="createBHD" loading={loading} onSubmit={handleSubmit}>
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

export default BHDForm;
