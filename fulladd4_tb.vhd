--***************************************
--      START: Library Declaration
--***************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--***************************************
--      END: Library Declaration
--***************************************
--***************************************
--      START: Entity Declaration
--***************************************
entity fulladd4_tb is

end entity fulladd4_tb;
--***************************************
--      END: Entity Declaration
--***************************************
--***************************************
--    START: Architecture Declaration
--***************************************
architecture behaviour of fulladd4_tb is
--***************************************
--      START: Signal Declaration
--***************************************
	signal a : std_logic_vector (3 downto 0) := "0000";
	signal b : std_logic_vector (3 downto 0) := "0000";
	signal c_in : std_logic := '0';
	signal sum : std_logic_vector (3 downto 0);
	signal c_out : std_logic;
	
	begin
	
		dut : entity work.fulladd4
			port map (A => a,
						 B => b,
						 C_IN => c_in,
						 SUM => sum,
						 C_OUT => c_out);
		simulation : process
			begin
		
				a <= "0100";
				b <= "0110";
				c_in <= '0';
				wait for 10ns;
				a <= "1000";
				b <= "0110";
				c_in <= '0';
				wait for 10ns;
				a <= "0001";
				b <= "0010";
				c_in <= '0';
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