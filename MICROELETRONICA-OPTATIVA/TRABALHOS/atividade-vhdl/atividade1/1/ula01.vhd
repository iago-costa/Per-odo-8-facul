--------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
---------------------------------------------------
ENTITY ula01 IS
	PORT (a, b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		cin: IN STD_LOGIC;
		opcode: IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
		y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)) ;
END ula01;
-----------------------------------------
ARCHITECTURE ula01 OF ula01 IS
BEGIN
	WITH opcode SELECT
		-----------logic part:------- -
		y <= a WHEN "0000",
		NOT a WHEN "0001",
		b WHEN "0010",
		NOT b WHEN "0011",
		a AND b WHEN "0100",
		a NAND b WHEN "0101",
		a OR b WHEN "0110",
		a NOR b WHEN "0111",
		---------arithmeti c part : - --
		a + 1 WHEN "1000",
		b + 1 WHEN "1001",
		a + b WHEN "1010",
		a - b WHEN "1011",
		b - a WHEN "1100",
		NOT a - b WHEN "1101",
		a + b + 1 WHEN "1110",
		a + b + cin WHEN OTHERS;
END ula01;
-----------------------------------------------