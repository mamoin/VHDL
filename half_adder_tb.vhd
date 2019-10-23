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
entity half_adder_tb is

end entity half_adder_tb;
--***************************************
--      END: Entity Declaration
--***************************************
--***************************************
--      START: Architecture Declaration
--***************************************
architecture behaviour of half_adder_tb is
--***************************************
--      START: Siganl Declaration
--***************************************	
	signal r_bit1 : std_logic := '0';
	signal r_bit2 : std_logic := '0';
	signal w_sum : std_logic;
	signal w_carry : std_logic;
--***************************************
--  START: Device Under test Declaration
--***************************************	
begin
	dut : entity work.half_adder 
	port map (a => r_bit1,
				 b => r_bit2,
				 sum => w_sum,
				 c_out => w_carry);
--***************************************
--      START: Process Declaration
--***************************************	
	simulation: process
		begin
		r_bit1 <= '0';
		r_bit2 <= '0';
		wait for 10ns;
		r_bit1 <= '0';
		r_bit2 <= '1';
		wait for 10ns;
		r_bit1 <= '1';
		r_bit2 <= '0';
		wait for 10ns;
		r_bit1 <= '1';
		r_bit2 <= '1';
		wait for 10ns;
--***************************************
--      End: Process Declaration
--***************************************
	end process simulation;
--***************************************
--      END: Architecture Declaration
--***************************************
end architecture behaviour;

	
	