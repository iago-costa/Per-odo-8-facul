--- Multiplexer (a component):  
ENTITY multiplexer IS 
	GENERIC (bits: POSITIVE); 
	PORT (inp1, inp2: IN BIT_VECTOR(bits-1 DOWNTO 0); 
	      sel: IN BIT; 
			outp: OUT BIT_VECTOR(bits-1 DOWNTO 0)); 
END multiplexer; 
------------------------------------------------------ 
ARCHITECTURE multiplexer OF multiplexer IS 
BEGIN 
	outp <= inp1 WHEN sel='0' ELSE inp2; 
END multiplexer; 
------------------------------------------------------ 
