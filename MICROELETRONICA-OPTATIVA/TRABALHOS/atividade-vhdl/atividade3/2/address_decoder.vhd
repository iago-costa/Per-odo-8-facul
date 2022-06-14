--- Code for arbitrary N.  

ENTITY address_decoder IS 
	GENERIC(N: INTEGER := 6); --pode ser qualquer valor 
	PORT (x: IN INTEGER RANGE 0 TO 2**N-1; 
	      y: OUT BIT_VECTOR(2**N-1 DOWNTO 0)); 
END address_decoder; 
------------------------------------------------------- 
ARCHITECTURE address_decoder OF address_decoder IS 
BEGIN 
	gen: FOR i IN x'RANGE GENERATE 
	     y(i) <= '1' WHEN i = x ELSE '0'; 
	END GENERATE; 
END address_decoder; 
------------------------------------------------------- 
