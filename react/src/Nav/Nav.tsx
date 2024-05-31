import React, { useContext, useEffect, useState } from 'react';
import { useLocation } from 'react-router';
import { NavLink } from 'react-router-dom';
import { Icon, Image } from 'semantic-ui-react';
import { Anon, LoggedIn } from 'Shared/Roles';
import { UserContainer } from 'Shared/UserContainer';
import './responsive.css';
import { Sidebar, Menu, MenuItem, SubMenu } from 'react-pro-sidebar';
import { menuClasses } from './utilityClasses';
import { MenuItemStyles } from './Menu';
import { Switch } from 'Nav/Switch';

type Theme = 'light' | 'dark';

const themes = {
  light: {
    sidebar: {
      backgroundColor: '#dff5e1',
      color: '#607489',
    },
    menu: {
      menuContent: '#c4f5c6',
      icon: '#0098e5',
      hover: {
        backgroundColor: '#adf7c1',
        color: '#44596e',
      },
      disabled: {
        color: '#9fb6cf',
      },
    },
  },
  dark: {
    sidebar: {
      backgroundColor: '#0b2948',
      color: '#8ba1b7',
    },
    menu: {
      menuContent: '#082440',
      icon: '#59d0ff',
      hover: {
        backgroundColor: '#00458b',
        color: '#b6c8d9',
      },
      disabled: {
        color: '#3e5e7e',
      },
    },
  },
};

// hex to rgba converter
const hexToRgba = (hex: string, alpha: number) => {
  const r = parseInt(hex.slice(1, 3), 16);
  const g = parseInt(hex.slice(3, 5), 16);
  const b = parseInt(hex.slice(5, 7), 16);

  return `rgba(${r}, ${g}, ${b}, ${alpha})`;

};

const handleLogoutClick = () => {
  handleLogout();
  // Redirect to login page
  window.location.href = '/login';

  return <div>
    
  </div>
  
};

const Nav = () => {
  const location = useLocation();
  const [open, setOpen] = useState(false);
  const { handleLogout } = useContext(UserContainer);

  useEffect(() => {
    setOpen(false);
  }, [location]);

  const [collapsed, setCollapsed] = useState(false);
  const [toggled, setToggled] = useState(false);
  const [hasImage, setHasImage] = useState(false);
  const [theme, setTheme] = useState<Theme>('light');

  // handle on theme change event
  const handleThemeChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setTheme(e.target.checked ? 'dark' : 'light');
  };

  const menuItemStyles: MenuItemStyles = {
    root: {
      fontSize: '18px', // Increased font size
      fontWeight: 400,
    },
    icon: {
      color: themes[theme].menu.icon,
      [`&.${menuClasses.disabled}`]: {
        color: themes[theme].menu.disabled.color,
      },
    },
    SubMenuExpandIcon: {
      color: '#b6b7b9',
    },
    subMenuContent: ({ level }) => ({
      backgroundColor:
        level === 0
          ? hexToRgba(themes[theme].menu.menuContent, hasImage && !collapsed ? 0.4 : 1)
          : 'transparent',
    }),
    button: {
      [`&.${menuClasses.disabled}`]: {
        color: themes[theme].menu.disabled.color,
      },
      '&:hover': {
        backgroundColor: hexToRgba(themes[theme].menu.hover.backgroundColor, hasImage ? 0.8 : 1),
        color: themes[theme].menu.hover.color,
      },
    },
    label: ({ open }) => ({
      fontWeight: open ? 600 : undefined,
    }),
  };

  return (
    <div style={{ display: "flex", height: "100vh", width: "5vh" }} > {/* Adjusting the width */}
      <Sidebar
        collapsed={collapsed}
        toggled={toggled}
        onBackdropClick={() => setToggled(false)}
        backgroundColor={hexToRgba(themes[theme].sidebar.backgroundColor, hasImage ? 0.9 : 1)}
        rootStyles={{
          color: themes[theme].sidebar.color,
        }}
      >
        <div style={{ flex: 1, marginBottom: '32px' }}>
          <Menu menuItemStyles={menuItemStyles} >
            <div style={{ marginTop: '0.5cm' }}>
              <Image src='../icon/logohead.png' centered size='medium' />
            </div>
            <MenuItem>
            </MenuItem>
            <MenuItem>
              <NavLink to="/" className="button-link" ><Icon name='home' size='large' /> Home </NavLink>
            </MenuItem>
            <LoggedIn>
              <SubMenu label={<span><Icon name='newspaper' size='large' /> Nghiêm Huấn </span>}>
                <SubMenu label='Tu Học'>
                  <MenuItem>
                    <NavLink to="/underdevpage" className="button-link">Tu Bát Quan Trai</NavLink>
                  </MenuItem>
                  <MenuItem>
                    <NavLink to="/bac_hocs" className="button-link">Bậc học</NavLink>
                  </MenuItem>
                  <MenuItem>
                    <NavLink to="/questions" className="button-link">Ngân hàng đề thi trắc nghiệm</NavLink>
                  </MenuItem>
                  <MenuItem>
                    <NavLink to="/practicemulchoice" className="button-link">Ôn thi trắc Nghiệm</NavLink>
                  </MenuItem>
                </SubMenu >
                <SubMenu label='Huấn Luyện'>
                  <MenuItem>
                    <NavLink to="/underdevpage" className="button-link">Huynh Trưởng</NavLink>
                  </MenuItem>
                  <MenuItem>
                    <NavLink to="/underdevpage" className="button-link">Đoàn Sinh</NavLink>
                  </MenuItem>
                </SubMenu>
              </SubMenu>
              <SubMenu label={<span><Icon name='address card' size='large' /> Nội Vụ </span>}>
                <MenuItem>
                  <NavLink to="/underdevpage" className="button-link">Sách tịch Huynh Trưởng</NavLink>
                </MenuItem>
                <MenuItem>
                  <NavLink to="/don_vis" className="button-link">Đơn vị</NavLink>
                </MenuItem>
                <MenuItem>
                  <NavLink to="/bhds" className="button-link">Ban Hướng Dẫn</NavLink>
                </MenuItem>
              </SubMenu>
              <SubMenu label={<span><Icon name='archive' size='large' /> Thư Ký </span>}>
                <MenuItem>
                  <NavLink to="/underdevpage" className="button-link">Văn thư</NavLink>
                </MenuItem>
              </SubMenu>
              <MenuItem>
                <NavLink to="/underdevpage" className="button-link"><Icon name='book' size='large' /> Tu Thư</NavLink>
              </MenuItem>
            </LoggedIn>
          </Menu>
          <Menu menuItemStyles={menuItemStyles}>
            
            <Menu>
              <LoggedIn>
                <Menu menuItemStyles={menuItemStyles}>
                  <MenuItem onClick={handleLogout} ><Icon name='power off' size='large' />Log Out</MenuItem>
                </Menu>
              </LoggedIn>
              <MenuItem>
              </MenuItem>
              <div style={{ marginBottom: 16 }}>
                <Switch
                  id="collapse"
                  checked={collapsed}
                  onChange={() => setCollapsed(!collapsed)}
                  label="Collapse"
                />
              </div>
              <div style={{ marginBottom: 16 }}>

                <Switch
                  id="theme"
                  checked={theme === 'dark'}
                  onChange={handleThemeChange}
                  label="Dark theme"
                />
              </div>
            </Menu>
          </Menu>
        </div>
      </Sidebar>
    </div>
  );
};

export default Nav;

function handleLogout() {
  throw new Error('Function not implemented.');
}

