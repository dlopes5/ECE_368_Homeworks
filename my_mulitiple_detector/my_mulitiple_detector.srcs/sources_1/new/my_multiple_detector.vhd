-----------------------------LIBRARY-----------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-----------------------------ENTITY------------------------------
ENTITY my_multiple_detector IS
    GENERIC(width: NATURAL := 5);
    PORT ( A : IN STD_LOGIC_VECTOR (width-1 DOWNTO 0);
           B : IN STD_LOGIC_VECTOR (width-1 DOWNTO 0);
           is_multiple : OUT STD_LOGIC;
           invalid_input : INOUT STD_LOGIC);
END my_multiple_detector;

-------------------------ARCHITECTURE----------------------------
ARCHITECTURE my_arch of my_multiple_detector is
SIGNAL ain, bin : UNSIGNED(width-1 DOWNTO 0);
BEGIN
    ain <= UNSIGNED(A);
    bin <= UNSIGNED(B);
    is_multiple <= '1' WHEN (ain MOD bin = 0) AND invalid_input = '0' ELSE '0';
    invalid_input <= '1' WHEN (Ain = 0) OR (Bin = 0) ELSE '0';
END my_arch;
