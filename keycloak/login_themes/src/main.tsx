import React, { lazy } from 'react'
import ReactDOM from 'react-dom/client'
import "./index.css"

const KcLoginThemeApp = lazy(() => import("./keycloak-theme/mobile/KcApp"));

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <KcLoginThemeApp />;
  </React.StrictMode>,
)
