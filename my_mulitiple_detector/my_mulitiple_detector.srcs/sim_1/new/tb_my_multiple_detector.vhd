--------------------------------LIBRARY----------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

--------------------------------ENTITY-----------------------------
ENTITY tb_my_multiple_detector IS
END tb_my_multiple_detector;

ARCHITECTURE my_arch OF tb_my_multiple_detector IS

CONSTANT width: NATURAL := 4;

COMPONENT my_multiple_detector IS 
    GENERIC(width: NATURAL := width);
    PORT ( A : IN STD_LOGIC_VECTOR (width-1 DOWNTO 0);
           B : IN STD_LOGIC_VECTOR (width-1 DOWNTO 0);
           is_multiple : OUT STD_LOGIC;
           invalid_input : INOUT STD_LOGIC);
END COMPONENT;

SIGNAL Ain: STD_LOGIC_VECTOR(width-1 DOWNTO 0):="0100";-- init val of 4
SIGNAL Bin: STD_LOGIC_VECTOR(width-1 DOWNTO 0):="0010";-- init val of 2
SIGNAL is_multiple_out : STD_LOGIC;
SIGNAL invalid_input_out : STD_LOGIC;

BEGIN
    multiple: my_multiple_detector
            GENERIC MAP(width =>width)
            PORT MAP( A=>Ain, B=>Bin, is_multiple=>is_multiple_out, invalid_input=>invalid_input_out);
            
    PROCESS 
        BEGIN 
            wait for 100 ns;
            Ain<= "1000";
            Bin<= "0010";
            wait for 100 ns;
            Ain<= "0110";
            Bin<= "0011";
            wait for 100 ns;
            Ain<= "1111";
            Bin<= "0111";
            wait for 100 ns;
            Ain<= "1000";
            Bin<= "0001";
            wait for 100 ns;
            Ain<= "1111";
            Bin<= "1000";
     END PROCESS;
END my_arch;
