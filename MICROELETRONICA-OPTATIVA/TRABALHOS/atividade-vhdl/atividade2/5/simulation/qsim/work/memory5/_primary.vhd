library verilog;
use verilog.vl_types.all;
entity memory5 is
    port(
        clk1            : in     vl_logic;
        clk2            : in     vl_logic;
        write           : in     vl_logic;
        rd_address      : in     vl_logic_vector(3 downto 0);
        wr_address      : in     vl_logic_vector(3 downto 0);
        data_in         : in     vl_logic_vector(7 downto 0);
        data_out        : out    vl_logic_vector(7 downto 0)
    );
end memory5;
