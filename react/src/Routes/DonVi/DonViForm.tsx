import { useEffect, useCallback } from 'react'

import { useParams, useNavigate } from "react-router-dom";
import { Form, Message, Button } from 'semantic-ui-react'

import API from 'Api'
import { useRequest, useFields } from 'Shared/Hooks';
import { Don_vi } from 'Shared/Models'
import SimplePage from 'Shared/SimplePage';

const DonViForm = () => {
  const params = useParams<{ id: string }>();
  const donviID = params.id;
  const [loading, error, run] = useRequest({} as Don_vi)
  const { fields, handleChange, setFields } = useFields({} as Don_vi)
  const navigate = useNavigate();

  // if we have a Donvi ID, fetch it
  useEffect(() => {
    if (donviID) {
      run(API.getDonVi(donviID), (donvi) => {
        setFields(donvi);
      });
    }
  }, [donviID, run, setFields])

  // handlers
  const handleSubmit = useCallback(() => {
    const action = donviID ? API.updateDonVi(fields) : API.createDonVi(fields);
    run(action, (data) => {
      navigate(`/don_vi/${data.id}`);
    })
  }, [donviID, fields, run, navigate])

  const handleDelete = useCallback(() => {
    if (donviID) {
      run(API.deleteDonVi(donviID), () => {
        navigate('/don_vis')
      })
    }
  }, [run, donviID, navigate])

  const { id, name } = fields;

  return (
    <SimplePage icon='file alternate outline' title={donviID ? `Edit DonVi #${donviID}` : 'Create a DonVi'}>
      <Form error name="createDonVi" loading={loading} onSubmit={handleSubmit}>
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

export default DonViForm;
