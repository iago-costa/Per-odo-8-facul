------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------------
ENTITY memory5 IS
	GENERIC (N : INTEGER := 8; --Width of data bus
				M: INTEGER := 4); --Widt h of address bus
	PORT (clk1, clk2, write: IN STD_LOGIC ;
		rd_address : IN INTEGER RANGE 0 TO 2**M-1;
		wr_address : IN INTEGER RANGE 0 TO 2**M-1;
		data_in : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
		data_out : OUT STD_LOGIC_VECTOR(N- 1 DOWNTO 0) ) ;
END memory5;
----------------------------------------------------------
ARCHITECTURE memory5 OF memory5 IS
	TYPE memory IS ARRAY (0 TO 2**M-1) OF
		STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
	SIGNAL ram : memory;
BEGIN
	PROCESS (clk1)
	BEGIN
		IF (clk1'EVENT AND clk1 = '1') THEN
			IF (write = '1') THEN
				ram (wr_address) <= data_in;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clk2)
	BEGIN
		IF (clk2'EVENT AND clk2 = '1') THEN
			data_out <= ram(rd_address) ;
		END IF;
	END PROCESS ;
END memory5; ---------------------------------------------