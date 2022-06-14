library verilog;
use verilog.vl_types.all;
entity memory2 is
    port(
        bcd             : in     vl_logic_vector(3 downto 0);
        ssd             : out    vl_logic_vector(6 downto 0)
    );
end memory2;
