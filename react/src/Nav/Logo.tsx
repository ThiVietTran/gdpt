import * as React from "react";
import { styled } from "@mui/material/styles";
import ListItemText from "@mui/material/ListItemText";
import Box from "@mui/material/Box";
import Typography from "@mui/material/Typography";


interface LogoProps {
  children?: React.ReactNode;
  img?: string;
}

export const SidebarContext = React.createContext({
    width: "270px",
    collapsewidth: "80px",
    textColor: "#8D939D",
    isCollapse: false,
    themeColor: "#5d87ff"
  });


export const Logo = React.forwardRef<HTMLAnchorElement, LogoProps>(({
  children,
  img = './icon/logohead3.png'
}, ref) => {
  const customizer = React.useContext(SidebarContext);

  const LogoStyled = styled(ListItemText)(() => ({
    whiteSpace: "nowrap",
    overflow: customizer.isCollapse ? 'hidden' : 'visible',
    WebkitLineClamp: '1',
    fontSize: '2rem',
    padding: '15px 22px',
    textOverflow: 'ellipsis',
  }));

  return (
    <LogoStyled href="/" ref={ref}>
      {
        img === "" ? (
          <Typography variant="body1">
            {children}
          </Typography>
        ) : (
          <Box
            component="img"
            sx={{
              display: "flex",
              alignItems: "center",
            }}
            src={img}
          />
        )
      }
    </LogoStyled>
  );
});
