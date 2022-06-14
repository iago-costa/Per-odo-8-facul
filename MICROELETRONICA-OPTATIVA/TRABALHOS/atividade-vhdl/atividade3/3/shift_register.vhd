--- Main code:  
USE work.data_load_package.all;  
------------------------------------------------------ 
ENTITY shift_register IS 
	GENERIC (M: INTEGER := 4;  --number of stages 
				N: INTEGER := 8); --number of bits 
	PORT (clk, load: IN BIT; 
	      x: IN x_input(1 TO M); 
			d: IN BIT_VECTOR(N-1 DOWNTO 0); 
			q: OUT BIT_VECTOR(N-1 DOWNTO 0)); 
END shift_register;   
------------------------------------------------------ 
ARCHITECTURE structural OF shift_register IS 
	SIGNAL temp1: x_input(0 TO M); 
	SIGNAL temp2: x_input(1 TO M); 
	------------------------------------------------------ 
	COMPONENT multiplexer IS 
		GENERIC (bits: POSITIVE); 
		PORT (inp1, inp2: IN BIT_VECTOR(bits-1 DOWNTO 0); 
				sel: IN BIT; outp: OUT BIT_VECTOR(bits-1 DOWNTO 0)); 
	END COMPONENT; 
	------------------------------------------------------ 
	COMPONENT ff_bank IS 
		GENERIC (bits: POSITIVE); 
		PORT (d: IN BIT_VECTOR(bits-1 DOWNTO 0); 
				clk: IN BIT; 
				q: OUT BIT_VECTOR(bits-1 DOWNTO 0)); 
	END COMPONENT; 
	------------------------------------------------------ 
BEGIN 
	temp1(0) <= d; 
	g: FOR i IN 1 TO M GENERATE 
		mux: multiplexer GENERIC MAP (N) 
			PORT MAP (temp1(i-1), x(i), load, temp2(i)); 
		ff: ff_bank GENERIC MAP (N) 
			PORT MAP (temp2(i), clk, temp1(i)); 
	END GENERATE g; 
	q <= temp1(M); 
END structural; 
------------------------------------------------------ 

