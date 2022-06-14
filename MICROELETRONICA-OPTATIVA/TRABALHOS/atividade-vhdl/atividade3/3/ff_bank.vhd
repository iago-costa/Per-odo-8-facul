--- ff_bank (another component): 
ENTITY ff_bank IS 
	GENERIC (bits: POSITIVE); 
	PORT (d: IN BIT_VECTOR(bits-1 DOWNTO 0); 
			clk: IN BIT; 
			q: OUT BIT_VECTOR(bits-1 DOWNTO 0)); 
END ff_bank; 
------------------------------------------------------ 
ARCHITECTURE ff_bank OF ff_bank IS 
BEGIN 
	PROCESS (clk) 
	BEGIN 
		IF (clk'EVENT AND clk='1') THEN 
			q <= d; 
		END IF; 
	END PROCESS; 
END ff_bank; 
------------------------------------------------------ 
