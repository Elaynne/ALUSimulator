library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
--use IEEE.std_logic_signed.all;
use ieee.numeric_std.all;

package ArithmeticUnitPkg is
		function Sum(a, b : std_logic_vector) return std_logic_vector;
		function Sub(a, b : std_logic_vector) return std_logic_vector;
		function Mul(a, b : std_logic_vector) return std_logic_vector;	
		function Inc(a : std_logic_vector) return std_logic_vector;	
		function Dec(a : std_logic_vector) return std_logic_vector;	
end;

package body ArithmeticUnitPkg is

	function Sum(a, b : std_logic_vector (7 downto 0))
		return std_logic_vector is
		variable z: std_logic_vector (15 downto 0);
		begin
			z :=  (a + b) or "0000000000000000";
			return z;			
	end function;
	
	function Sub(a, b : std_logic_vector (7 downto 0))
		return std_logic_vector is
		variable z: std_logic_vector (15 downto 0);
		begin		
			z:= (a - b) or "0000000000000000";		
			return z;			
	end function;
	
	function Mul(a, b : std_logic_vector (7 downto 0))
		return std_logic_vector is
		variable z: std_logic_vector (15 downto 0);
		begin			
			z:=  (a * b);
			return z;			
	end function;	
	
	function Inc(a : std_logic_vector (7 downto 0))
		return std_logic_vector is
		variable z: std_logic_vector (15 downto 0);
			begin
				z:= (a or "0000000000000000") + 1;
			return z;
	end function;
	
	
	function Dec(a : std_logic_vector (7 downto 0))
		return std_logic_vector is
		variable z: std_logic_vector (15 downto 0);
			begin
				z:= (a or "0000000000000000") - 1;
			return z;
	end function;
	
	
end package body;