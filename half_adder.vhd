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
entity half_adder is
	port(a : in std_logic; --input
		  b : in std_logic; --input
	     sum : out std_logic; --output
		  c_out : out std_logic); --output
--***************************************
--      END: Entity Declaration
--***************************************
end entity half_adder;
--***************************************
--    START: Architecture Declaration
--***************************************
architecture behaviour of half_adder is
	begin
		sum <= a xor b;
		c_out <= a and b;
--***************************************
--      END: Architecture Declaration
--***************************************
end architecture behaviour;