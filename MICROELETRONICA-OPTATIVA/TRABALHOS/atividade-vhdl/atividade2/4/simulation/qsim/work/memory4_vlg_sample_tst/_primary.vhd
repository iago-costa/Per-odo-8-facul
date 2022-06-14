library verilog;
use verilog.vl_types.all;
entity memory4_vlg_sample_tst is
    port(
        address         : in     vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        write           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end memory4_vlg_sample_tst;
