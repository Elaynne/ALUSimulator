library verilog;
use verilog.vl_types.all;
entity ULA8bits is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        O               : out    vl_logic_vector(15 downto 0);
        Selector        : in     vl_logic_vector(4 downto 0);
        RFID            : in     vl_logic_vector(7 downto 0);
        LedOut          : out    vl_logic_vector(1 downto 0)
    );
end ULA8bits;
