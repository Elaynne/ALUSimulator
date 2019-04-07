library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.ArithmeticUnitPkg.all;
use work.LogicUnitPkg.all;
use work.IoTUnitPkg.all;

entity ULA8bits is port
(
	A, B : in std_logic_vector(7 downto 0);
	O : out std_logic_vector(15 downto 0);
	Selector : in std_logic_vector(4 downto 0);
	RFID : in std_logic_vector(7 downto 0);
	LedOut : out std_logic_vector(1 downto 0)--green '1' or red '0's
	
);
end ULA8bits;

architecture hardware of ULA8bits is
	signal reg_logger: std_logic_vector(1 downto 0);
	
	begin
	process(A, B, Selector)
	begin
		case Selector is
			when "00000" => O <= Sum(A, B);
			when "00001" => O <= Sub(A, B);
			when "00010" => O <= Mul(A, B);
			when "00011" => O <= Inc(A);
			when "00100" => O <= Dec(A);
			when "00101" => O <= ShiftLeft(A);
			when "00110" => O <= ShiftRight(A);
			when "00111" => O <= Equal(A, B);
			when "01000" => O <= Less(A, B);
			when "01001" => O <= Greater(A, B);
			when "01010" => O <= OpAND(A, B);
			when "01011" => O <= OpOR(A, B);
			when "01100" => O <= OpXOR(A, B);
			when "01101" => O <= OpNAND(A, B);
			when "01110" => O <= OpNOR(A, B);
			when "01111" => O <= OpXNOR(A, B);
			when "10000" => O <= OpNOT_A(A);
			--Iot functions
			when "10001" => LedOut <= ReadRFID(RFID);
			when "10010" =>
						reg_logger <= SendRFID(RFID);
						if (reg_logger = "11") then
							LedOut <= ValidateRFID(RFID);
						elsif (reg_logger = "00") then
							LedOut <= "00";
						end if;
						reg_logger <= null;
			when others => O <= "ZZZZZZZZZZZZZZZZ";
		end case;
	end process;
	
	
end hardware;