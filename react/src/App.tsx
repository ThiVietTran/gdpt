import React from 'react'

import { Helmet } from 'react-helmet'
import { NavLink, BrowserRouter as Router } from 'react-router-dom'

import Nav from 'Nav/Nav'
import Routes from 'Routes/Routes'
import { WithUser } from 'Shared/UserContainer'
import { MenuItem } from 'react-pro-sidebar'
import { TAnon, Anon, LoggedIn } from 'Shared/Roles';
import { Icon } from 'semantic-ui-react'

const App = () => (
  <WithUser>
    <Helmet
      defaultTitle="PNGR"
      titleTemplate="%s | PNGR"
    >
      {/* put meta tags here for opengraph and stuff */}
    </Helmet>

    <Router>
      <Anon>
        <NavLink to={{ pathname: "/login" }} className="button-link"><Icon name='hand point right outline' size='large' />Log In</NavLink>
        <NavLink to="/signup" className="button-link"><Icon name='hand point right outline' size='large' />Sign Up</NavLink>
      </Anon>

      <div id="wrapper">
        <div style={{ height: "100vh", display: "flex" }}>
          <TAnon>
            <Nav />
          </TAnon>
          <Routes />
        </div>
      </div>

    </Router>
  </WithUser>
);

export default App;