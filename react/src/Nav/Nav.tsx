import { useContext, useEffect, useState } from 'react'

import { useLocation } from 'react-router'
import { Link } from 'react-router-dom'
import { Button, Container } from 'semantic-ui-react'

import { Anon, LoggedIn } from 'Shared/Roles'
import { UserContainer } from 'Shared/UserContainer'

import './responsive.css'
import { Sidebar, Menu, MenuItem } from 'react-pro-sidebar'

const Nav = () => {
  const location = useLocation();
  const [open, setOpen] = useState(false)
  const { handleLogout } = useContext(UserContainer)

  useEffect(() => {
    setOpen(false);
  }, [location])

  const menuClass = open ? '' : 'hidden';

  return (
    <Sidebar>
      <Menu
        menuItemStyles={{
          button: {
            // the active class will be added automatically by react router
            // so we can use it to style the active menu item
            [`&.active`]: {
              backgroundColor: '#13395e',
              color: '#b6c8d9',
            },
          },
        }}
      >
        <MenuItem component={<Link to="/" />}> Home</MenuItem>
        <LoggedIn>
          <MenuItem component={<Link to="/questions" />}> Questions</MenuItem>
          <MenuItem component={<Link to="/bac_hocs" />}> Bac Hoc</MenuItem>
          <MenuItem component={<Link to="/underdevpage" />}> Under dev</MenuItem>
        </LoggedIn>
        <Anon>
          <MenuItem component={<Link to="/login" />}> Login</MenuItem>
          <MenuItem component={<Link to="/signup" />}> Sign up</MenuItem>
        </Anon>
        <LoggedIn>
          <MenuItem component={<Link to="/" onClick={handleLogout} />}> Logout</MenuItem>
        </LoggedIn>

      </Menu>
    </Sidebar>
  );
}

export default Nav;