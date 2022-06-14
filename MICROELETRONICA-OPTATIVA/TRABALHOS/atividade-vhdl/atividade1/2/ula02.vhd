library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity ula02 is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
C : in STD_LOGIC_VECTOR (1 downto 0);
F : out STD_LOGIC_VECTOR (3 downto 0));
end ula02;
architecture Behavioral of ula02 is
Begin
process (A, B, C)
begin
CASE C is
WHEN "00" => F <= A + B;
WHEN "01" => F <= A - B;
WHEN "10" => F <= A xor B;
WHEN others => F <= not A;
END CASE;
end process;
end Behavioral;