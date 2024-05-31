import React from 'react';
import { Icon } from 'semantic-ui-react';

interface NavItem {
  to: string;
  text: string;
  icon: string;
  submenu?: NavItem[];
}

export const navItems: NavItem[] = [
  {
    to: '',
    text: 'Nghiêm Huấn',
    icon: 'newspaper',
    submenu: [
      {
        to: '',
        text: 'Tu Học',
        icon: '',
        submenu: [
          { to: '/underdevpage', text: 'Tu Bát Quan Trai', icon: '' },
          { to: '/underdevpage', text: 'Bậc học', icon: '' },
          { to: '/questions', text: 'Ngân hàng đề thi trắc nghiệm', icon: '' },
          { to: '/practicemulchoice', text: 'Ôn thi trắc Nghiệm', icon: '' },
        ],
      },
      {
        to: '',
        text: 'Huấn Luyện',
        icon: '',
        submenu: [
          { to: '/underdevpage', text: 'Huynh Trưởng', icon: '' },
          { to: '/underdevpage', text: 'Đoàn Sinh', icon: '' },
        ],
      },
    ],
  },
  {
    to: '',
    text: 'Nội Vụ',
    icon: 'address card',
    submenu: [
      { to: '/underdevpage', text: 'Sách tịch Huynh Trưởng', icon: '' },
    ],
  },
  {
    to: '',
    text: 'Thư Ký',
    icon: 'archive',
    submenu: [
      { to: '/underdevpage', text: 'Văn thư', icon: '' },
    ],
  },
  { to: '/underdevpage', text: 'Tu Thư', icon: 'book' },
];

export const authItems = {
  loggedIn: [
    { to: '/logout', text: 'Log Out', icon: 'power off' },
  ],
  anon: [
    { to: '/login', text: 'Log In', icon: 'hand point right outline' },
    { to: '/signup', text: 'Sign Up', icon: 'hand point right outline' },
  ],
};
