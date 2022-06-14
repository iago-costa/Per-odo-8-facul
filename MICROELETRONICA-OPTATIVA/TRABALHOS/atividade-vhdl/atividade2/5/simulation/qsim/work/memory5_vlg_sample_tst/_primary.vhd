library verilog;
use verilog.vl_types.all;
entity memory5_vlg_sample_tst is
    port(
        clk1            : in     vl_logic;
        clk2            : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        rd_address      : in     vl_logic_vector(3 downto 0);
        wr_address      : in     vl_logic_vector(3 downto 0);
        write           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end memory5_vlg_sample_tst;
