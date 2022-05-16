import styled from "styled-components";

// MN - Menu
// CT - Content

export const Grid = styled.div`
    display: grid;

    grid-template-columns: 150px auto;
    grid-template-rows: auto auto;

    grid-template-areas: 
        'MN CT'
    ;

    height: 100vh;
`;