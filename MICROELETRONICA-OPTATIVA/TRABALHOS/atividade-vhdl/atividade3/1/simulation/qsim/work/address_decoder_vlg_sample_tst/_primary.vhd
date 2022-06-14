library verilog;
use verilog.vl_types.all;
entity address_decoder_vlg_sample_tst is
    port(
        x               : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end address_decoder_vlg_sample_tst;
