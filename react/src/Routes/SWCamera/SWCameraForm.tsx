import React, { useState } from 'react';
import { Form, Button } from 'semantic-ui-react';
import API from 'Api'; // Make sure 'Api' is imported correctly

const SWCameraForm = () => {
  const [cameraCmd, setCameraCmd] = useState({ cmd: '' });

  const handleSubmit = () => {
    API.cameraCommand(cameraCmd);
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setCameraCmd(prevState => ({
      ...prevState,
      [name]: value
    }));
  };

  return (
    <Form name="login" onSubmit={(e) => { e.preventDefault(); handleSubmit(); }}>
      <Form.Input
        size="big"
        name="cmd"
        type="text"
        placeholder="api_save_raw_frame_remote_db"
        required
        value={cameraCmd.cmd}
        onChange={handleChange}
      />
      <Button primary fluid size="huge" type="submit">Send Command</Button>
    </Form>
  );
};

export default SWCameraForm;
