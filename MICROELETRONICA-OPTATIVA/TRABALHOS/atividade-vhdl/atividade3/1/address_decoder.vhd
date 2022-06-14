---Code for N-3 with WHEN: 

ENTITY address_decoder IS 
	PORT (x: IN BIT_VECTOR(2 DOWNTO 0); 
			y: OUT BIT_VECTOR(7 DOWNTO 0)); 
END address_decoder; 
--------------------------------------------------
ARCHITECTURE address_decoder OF address_decoder IS 
BEGIN 
	y <= "00000001" WHEN x = "000" ELSE 
		  "00000010" WHEN x = "001" ELSE 
		  "00000100" WHEN x = "010" ELSE 
		  "00001000" WHEN x = "011" ELSE 
		  "00010000" WHEN x = "100" ELSE 
		  "00100000" WHEN x = "101" ELSE 
		  "01000000" WHEN x = "110" ELSE 
		  "10000000"; 
END address_decoder; 
-------------------------------------------------- 