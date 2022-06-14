library verilog;
use verilog.vl_types.all;
entity ula02 is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        C               : in     vl_logic_vector(1 downto 0);
        F               : out    vl_logic_vector(3 downto 0)
    );
end ula02;
