import { Routes as ReactRouterRoutes, Route } from "react-router-dom";

import ChangePassword from 'Routes/Account/ChangePassword'
import { NoMatch, RequireAuth } from "Routes/Helpers";
import Home from 'Routes/Home/Home'
import LogIn from 'Routes/LogIn/LogIn'
import PostForm from 'Routes/Posts/PostForm'
import Posts from 'Routes/Posts/Posts'
import CheckReset from 'Routes/Reset/CheckReset'
import Reset from 'Routes/Reset/Reset'
import SignUp from 'Routes/SignUp/SignUp'
import Verify from 'Routes/Verify/Verify'
import SWCamera from 'Routes/SWCamera/SWCamera'
import Questions from "./Questions/Questions";
import ViewQuestion from "./Questions/Question";
import ViewPost from "Routes/Posts/Post";
import AddQuestionForm from './Questions/AddQuestionForm';
import EditQuestionForm from './Questions/EditQuestionForm';
import UnderDevPage from './UnderDevPage/UnderDevPage';
import PracticeMulChoice from './Questions/PracticeMulChoice';
import Bac_Hoc from './BacHoc/BacHoc';
import BacHocs from './BacHoc/BacHocs';
import BacHocForm from './BacHoc/BacHocForm';
import BHD from "./BHD/BHD";
import BHDForm from "./BHD/BHDForm";
import BHDs from "./BHD/BHDs";
import DONVIs from "./DonVi/DonVis";
import DonViForm from "./DonVi/DonViForm";
import DONVI from "./DonVi/DonVi";

const Routes = () => (
  <ReactRouterRoutes>
    <Route path="/" element={<Home />} />
    <Route path="/signup" element={<SignUp />} />
    <Route path="/login" element={<LogIn />} />
    <Route path="/reset" element={<Reset />} />
    <Route path="/reset/:code" element={<CheckReset />} />
    <Route path="/verify/:code" element={<Verify />} />

    {/* crud post routes */}
    <Route
      path="/swcamera"
      element={
        <RequireAuth>
          <SWCamera />
        </RequireAuth>
      }
    />
    <Route
      path="/change-password"
      element={
        <RequireAuth>
          <ChangePassword />
        </RequireAuth>
      }
    />
    <Route
      path="/posts"
      element={
        <RequireAuth>
          <Posts />
        </RequireAuth>
      }
    />
    <Route
      path="/post/create"
      element={
        <RequireAuth>
          <PostForm />
        </RequireAuth>
      }
    />
    <Route
      path="/post/:id/edit"
      element={
        <RequireAuth>
          <PostForm />
        </RequireAuth>
      }
    />
    <Route
      path="/post/:id"
      element={
        <RequireAuth>
          <ViewPost />
        </RequireAuth>
      }
    />
    <Route
      path="/questions"
      element={
        <RequireAuth>
          <Questions />
        </RequireAuth>
      }
    />
    <Route
      path="/question/create"
      element={
        <RequireAuth>
          <AddQuestionForm />
        </RequireAuth>
      }
    />
    <Route
      path="/question/:id/edit"
      element={
        <RequireAuth>
          <EditQuestionForm />
        </RequireAuth>
      }
    />
    <Route
      path="/question/:id"
      element={
        <RequireAuth>
          <ViewQuestion />
        </RequireAuth>
      }
    />

    <Route
      path="/underdevpage"
      element={
        <RequireAuth>
          <UnderDevPage />
        </RequireAuth>
      }
    />
    <Route
      path="/practicemulchoice"
      element={
        <RequireAuth>
          <PracticeMulChoice />
        </RequireAuth>
      }
    />

    <Route
      path="/bac_hocs"
      element={
        <RequireAuth>
          <BacHocs />
        </RequireAuth>
      }
    />
    <Route
      path="/bac_hoc/create"
      element={
        <RequireAuth>
          <BacHocForm />
        </RequireAuth>
      }
    />
    <Route
      path="/bac_hoc/:id/edit"
      element={
        <RequireAuth>
          <BacHocForm />
        </RequireAuth>
      }
    />
    <Route
      path="/bac_hoc/:id"
      element={
        <RequireAuth>
          <Bac_Hoc />
        </RequireAuth>
      }
    />

    <Route
      path="/bhds"
      element={
        <RequireAuth>
          <BHDs />
        </RequireAuth>
      }
    />
    <Route
      path="/bhd/create"
      element={
        <RequireAuth>
          <BHDForm />
        </RequireAuth>
      }
    />
    <Route
      path="/bhd/:id/edit"
      element={
        <RequireAuth>
          <BHDForm />
        </RequireAuth>
      }
    />
    <Route
      path="/bhd/:id"
      element={
        <RequireAuth>
          <BHD />
        </RequireAuth>
      }
    />

    <Route
      path="/don_vis"
      element={
        <RequireAuth>
          <DONVIs />
        </RequireAuth>
      }
    />
    <Route
      path="/don_vi/create"
      element={
        <RequireAuth>
          <DonViForm />
        </RequireAuth>
      }
    />
    <Route
      path="/don_vi/:id/edit"
      element={
        <RequireAuth>
          <DonViForm />
        </RequireAuth>
      }
    />
    <Route
      path="/don_vi/:id"
      element={
        <RequireAuth>
          <DONVI />
        </RequireAuth>
      }
    />

    <Route element={<NoMatch />} />
  </ReactRouterRoutes>
)

export default Routes;
