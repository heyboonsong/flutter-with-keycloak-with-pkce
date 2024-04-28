import { Suspense } from "react";
import Login from "./pages/Login";

export default function KcApp() {

    return (
        <Suspense>
            <Login />
        </Suspense>
    );

}