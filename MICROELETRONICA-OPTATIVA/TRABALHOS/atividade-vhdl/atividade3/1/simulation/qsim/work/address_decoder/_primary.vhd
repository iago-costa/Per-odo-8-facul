library verilog;
use verilog.vl_types.all;
entity address_decoder is
    port(
        x               : in     vl_logic_vector(2 downto 0);
        y               : out    vl_logic_vector(7 downto 0)
    );
end address_decoder;
