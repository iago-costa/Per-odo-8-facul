library verilog;
use verilog.vl_types.all;
entity ula01 is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        cin             : in     vl_logic;
        opcode          : in     vl_logic_vector(3 downto 0);
        y               : out    vl_logic_vector(7 downto 0)
    );
end ula01;
