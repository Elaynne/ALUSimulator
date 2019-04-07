library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
--use IEEE.std_logic_signed.all;
use ieee.numeric_std.all;

package IoTUnitPkg is
		function ReadRFID(rfid : std_logic_vector) return std_logic_vector;		
		function SendRFID(rfid : std_logic_vector) return std_logic_vector;
		function ValidateRFID(rfid : std_logic_vector) return std_logic_vector;
end;

package body IoTUnitPkg is

	function ReadRFID(rfid : std_logic_vector (7 downto 0))
		return std_logic_vector is
		variable z: std_logic_vector (1 downto 0);
		begin
			if (rfid = "00000000" or rfid = null) then
				z :=  "00";
			else
				z := "11";
			end if;
			return z;			
	end function;
	
	function SendRFID(rfid : std_logic_vector (7 downto 0))
		return std_logic_vector is
		variable z: std_logic_vector (1 downto 0);
		begin
			if rfid = "00000000" or (rfid = null) then
				z :=  "00";
			else
				z := "11";
			end if;
			return z;			
	end function;
	
	function ValidateRFID(rfid : std_logic_vector (7 downto 0))
		return std_logic_vector is
		variable z: std_logic_vector (1 downto 0);
		begin
			if (rfid(7) = '1') and (rfid(0) = '1') then
				z :=  "11";
			else
				z := "00";
			end if;
			return z;			
	end function;


end package body;