library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

package LogicUnitPkg is			
	function ShiftLeft(a : std_logic_vector) return std_logic_vector;
	function ShiftRight(a : std_logic_vector) return std_logic_vector;
	function Equal(a, b : std_logic_vector) return std_logic_vector;
	function Less(a, b : std_logic_vector) return std_logic_vector;
	function Greater(a , b: std_logic_vector) return std_logic_vector;
	function OpAND (a, b : std_logic_vector) return std_logic_vector;	
	function OpOR (a, b : std_logic_vector) return std_logic_vector;
	function OpXOR (a, b : std_logic_vector) return std_logic_vector;	
	function OpNAND (a, b : std_logic_vector) return std_logic_vector;
	function OpNOR (a, b : std_logic_vector) return std_logic_vector;
	function OpXNOR (a, b : std_logic_vector) return std_logic_vector;
	function OpNOT_A (a : std_logic_vector) return std_logic_vector;
	
end;

package body LogicUnitPkg is

function ShiftLeft(a : std_logic_vector (7 downto 0))
		return std_logic_vector is
		variable z: std_logic_vector (15 downto 0);
		variable d: unsigned(7 downto 0);	
			begin
				d:= unsigned(a);
				z:= X"00" & std_logic_vector(d sll 1);--shift_left(unsigned(a), 1);				
				return z ;
	end function;
	
	function ShiftRight(a : std_logic_vector (7 downto 0))
		return std_logic_vector is
			variable z: std_logic_vector (15 downto 0);
			variable d: unsigned(7 downto 0);
				begin
					d:= unsigned(a);
					z:= X"00" & std_logic_vector(d srl 1) ;
				return z;
	end function;	
	
	function Equal (a : std_logic_vector (7 downto 0);
						 b : std_logic_vector (7 downto 0))
		return std_logic_vector is	
			variable z: std_logic_vector (15 downto 0);
			begin
				if(a = b) then
					z := "0000000000000001" ;
				else
					z:= "0000000000000000";
				end if;
			return z;		
	end function;
	
	function Less (a : std_logic_vector (7 downto 0);
						b : std_logic_vector (7 downto 0))
		return std_logic_vector is	
			variable z: std_logic_vector (15 downto 0);
			begin
				if (a < b) then
					z := "0000000000000001" ;
				else
					z:= "0000000000000000";			
				end if;
			return z;		
	end function;
	
	function Greater (a : std_logic_vector (7 downto 0);
						   b : std_logic_vector (7 downto 0))
		return std_logic_vector is	
			variable z: std_logic_vector (15 downto 0);
			begin
				if(a > b) then
					z := "0000000000000001" ;
				else
					z:= "0000000000000000";
				end if;
			return z;
	end function;		
			
	function OpAND (a : std_logic_vector (7 downto 0);
						 b : std_logic_vector (7 downto 0))
		return std_logic_vector is	
			variable z: std_logic_vector (15 downto 0);
			begin
				z := X"00" & (a and b);
			return z;
	end function;
	
	function OpOR (a : std_logic_vector (7 downto 0);
						 b : std_logic_vector (7 downto 0))
		return std_logic_vector is	
			variable z: std_logic_vector (15 downto 0);
			begin
				z := X"00" & (a or b);
			return z;
	end function;
	
	function OpXOR (a : std_logic_vector (7 downto 0);
						 b : std_logic_vector (7 downto 0))
		return std_logic_vector is	
			variable z: std_logic_vector (15 downto 0);
			begin
				z := X"00" & (a xor b);
			return z;
	end function;
	
	function OpNAND (a : std_logic_vector (7 downto 0);
						 b : std_logic_vector (7 downto 0))
		return std_logic_vector is	
			variable z: std_logic_vector (15 downto 0);
			begin
				z := X"00" & (a nand b);
			return z;
	end function;
	
	function OpNOR (a : std_logic_vector (7 downto 0);
						 b : std_logic_vector (7 downto 0))
		return std_logic_vector is	
			variable z: std_logic_vector (15 downto 0);
			begin
				z := X"00" & (a nor b);
			return z;
	end function;		
			
	function OpXNOR (a : std_logic_vector (7 downto 0);
						 b : std_logic_vector (7 downto 0))
		return std_logic_vector is	
			variable z: std_logic_vector (15 downto 0);
			begin
				z := X"00" & (a xnor b);
			return z;
	end function;
	
	function OpNOT_A (a : std_logic_vector (7 downto 0))
		return std_logic_vector is	
			variable z: std_logic_vector (15 downto 0);
			begin
				z := X"00" & (not a);
			return z;	
	end function;
	
end package body;