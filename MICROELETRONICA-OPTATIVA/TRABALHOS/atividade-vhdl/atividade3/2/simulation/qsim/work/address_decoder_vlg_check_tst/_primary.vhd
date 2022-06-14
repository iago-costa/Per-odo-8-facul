library verilog;
use verilog.vl_types.all;
entity address_decoder_vlg_check_tst is
    port(
        y               : in     vl_logic_vector(63 downto 0);
        sampler_rx      : in     vl_logic
    );
end address_decoder_vlg_check_tst;
