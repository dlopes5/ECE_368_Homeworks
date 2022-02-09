------LIBRARY---------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-----ENTITY-----------
ENTITY my_2toN_8Bit_MUX IS 
    GENERIC ( n: IN INTEGER := 4); --CHANGE THIS TO MATCH THE n VALUE 
    PORT ( LineSel: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0); Line: IN STD_LOGIC_VECTOR(((2**n)*8-1) DOWNTO 0); y: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END my_2toN_8Bit_MUX;

-----ARCHITECTURE-------
ARCHITECTURE my_mux OF my_2toN_8Bit_MUX IS 

SIGNAL x: INTEGER;
SIGNAL index: INTEGER :=7;

    BEGIN 
        x <= TO_INTEGER(UNSIGNED(LineSel)); -- gives the number that we want to grab binary_read 
        y<= Line(((2**n)*8-1-x*8) DOWNTO ((2**n)*8-1-x*8-7)); 
END my_mux; 