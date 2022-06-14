library verilog;
use verilog.vl_types.all;
entity memory4 is
    port(
        clk             : in     vl_logic;
        write           : in     vl_logic;
        address         : in     vl_logic_vector(3 downto 0);
        data            : inout  vl_logic_vector(7 downto 0)
    );
end memory4;
