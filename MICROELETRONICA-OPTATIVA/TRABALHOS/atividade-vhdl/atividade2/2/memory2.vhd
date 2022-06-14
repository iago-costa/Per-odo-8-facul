---------------------Main code.----------------------------------------
USE work.my_pct.all;
---------------------------------------------------------------
ENTITY memory2 IS
	PORT (bcd : IN INTEGER RANGE 0 TO 9;
		ssd: OUT BIT_VECTOR(6 DOWNTO 0));
END memory2;
----------------------------------------------------------------------
ARCHITECTURE memory2 OF memory2 IS
BEGIN
	ssd <= bcd_to_ssd(bcd);
END memory2;
---------------------------------------------------------------------