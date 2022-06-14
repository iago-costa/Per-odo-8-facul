----------------------
ENTITY memory1 IS
	PORT (address : IN INTEGER RANGE 0 TO 9;
		data : OUT BIT_VECTOR(6 DOWNTO 0));
END memory1;
--------------------------------------------------
ARCHITECTURE memory1 OF memory1 IS
	TYPE memory IS ARRAY (0 TO 9) OF BIT_VECTOR(6 DOWNTO 0) ;
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
	data <= rom(address);
END memory1;
-------------------------------------------------------------