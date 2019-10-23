--***************************************
--      START: Library Declaration
--***************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--***************************************
--      END: Library Declaration
--***************************************
--***************************************
--      START: Entity Declaration
--***************************************
entity full_adder is
	port (a : in std_logic; -- input
			b : in std_logic; -- input
			c_in: in std_logic; -- input
			sum : out std_logic; -- output
			c_out : out std_logic); -- output
end entity full_adder;
--***************************************
--    START: Architecture Declaration
--***************************************
architecture behaviour of full_adder is
	
	signal x1 : std_logic; -- output of first xor gate
	signal x2 : std_logic; -- signal of and gate 1
	signal x3 : std_logic; -- signal of and gate 2

	begin 
	
		x1 <= a xor b;
		sum <= x1 xor c_in;
		x2 <= x1 and c_in;
		x3 <= a and b;
		c_out <= x2 or x3;
	
--***************************************
--      END: Architecture Declaration
--***************************************
end architecture behaviour;