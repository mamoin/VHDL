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
entity full_adder_tb is

end entity full_adder_tb;
--***************************************
--      END: Entity Declaration
--***************************************
--***************************************
--    START: Architecture Declaration
--***************************************
architecture behaviour of full_adder_tb is
--***************************************
--      START: Signal Declaration
--***************************************
	signal A : std_logic := '0';
	signal B : std_logic := '0';
	signal C_IN : std_logic := '0';
	signal SUM : std_logic;
	signal C_OUT : std_logic;
	
	begin
	
		dut : entity work.full_adder
			port map (a => A,
						 b => B,
						 c_in => C_IN,
						 sum => SUM,
						 c_out => C_OUT);
		simulation : process
			begin
		
				A <= '0';
				B <= '0';
				C_IN <= '0';
				wait for 10ns;
				A <= '0';
				B <= '1';
				C_IN <= '0';
				wait for 10ns;
				A <= '1';
				B <= '0';
				C_IN <= '1';
				wait for 10ns;
				A <= '1';
				B <= '1';
				C_IN <= '1';
				wait for 10ns;
				wait;
--***************************************
--      End: Process Declaration
--***************************************
		end process simulation;
--***************************************
--      End: Architecture Declaration
--***************************************
end architecture behaviour;