--- Package: ------------------------------------------------------------- 
PACKAGE data_load_package IS 
	CONSTANT bits: POSITIVE := 8; 
	TYPE x_input IS ARRAY (NATURAL RANGE <>) OF BIT_VECTOR(bits-1 DOWNTO 0); 
END data_load_package; 
-------------------------------------------------------------------------- 
 

