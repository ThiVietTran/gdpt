import React from 'react'

import { Link } from 'react-router-dom'

import SimplePage from 'Shared/SimplePage';

const UnderDevPage = () => (
  <SimplePage icon='video play' title='Page under develop'>
    <p>Chức năng đang được phát triển và được cập nhật sau</p>
    <p><Link to="/">Back to home</Link> Quay lại trang thông tin</p>
  </SimplePage>
)

export default UnderDevPage;
