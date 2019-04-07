library verilog;
use verilog.vl_types.all;
entity ULA8bits_vlg_check_tst is
    port(
        LedOut          : in     vl_logic_vector(1 downto 0);
        O               : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end ULA8bits_vlg_check_tst;
