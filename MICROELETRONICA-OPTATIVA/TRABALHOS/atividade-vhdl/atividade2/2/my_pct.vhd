-----------------Package:----------------------------------------------
PACKAGE my_pct IS
	FUNCTION bcd_to_ssd (SIGNAL bcd: INTEGER) RETURN BIT_VECTOR;
END my_pct;
-----------------------------------------------------------------
PACKAGE BODY my_pct IS
	FUNCTION bcd_to_ssd (SIGNAL bcd : INTEGER) RETURN BIT_VECTOR IS
		TYPE memory IS ARRAY (0 TO 9) OF BIT_VECTOR(6 DOWNTO 0);
		CONSTANT rom: memory := (
			"1111110",
			"0110000",
			"1101101",
			"1111001",
			"0110011",
			"1011011",
			"1011111",
			"1110000",
			"1111111",
			"1111011");
	BEGIN
		RETURN rom(bcd);
	END bcd_to_ssd;
END my_pct;
