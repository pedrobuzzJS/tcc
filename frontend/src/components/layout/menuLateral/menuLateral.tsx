import React, { useState } from 'react';
import { MenuLateral } from './style';

const Header = () => {
    const [sideBar, setSideBar] = useState(false);

    const showSideBar = () => setSideBar(!sideBar);

    return (
        <MenuLateral>
            
        </MenuLateral>
    )
}

export default Header;