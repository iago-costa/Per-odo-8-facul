-------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------------------------------
ENTITY memory4 IS
	GENERIC (N: INTEGER := 8; --Widt h of data bus
				M: INTEGER := 4); --Wi dth of address bus
	PORT (clk , write : IN STD_LOGIC;
		address : IN INTEGER RANGE 0 TO 2**M-1;
		data: INOUT STD_LOGIC_VECTOR(N- 1 DOWNTO 0)) ;
END memory4;
--------------------------------------------------------------------
ARCHITECTURE memory4 OF memory4 IS
	TYPE memory IS ARRAY (0 TO 2**M-1) OF
		STD_LOGIC_VECTOR(N- 1 DOWNTO 0);
	SIGNAL ram: memory;
BEGIN
	PROCESS (clk)
	BEGIN
		IF (clk'EVENT AND clk = '1') THEN
			IF (write = '1') THEN
				ram(address) <= data ;
			END IF;
		END IF;
	END PROCESS;
	data <= ram (address) WHEN write='0' ELSE (OTHERS=>'Z');
END memory4;
-------------------------------------------------------------------