--*******************************************
--      START: Library declaration
--*******************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--*******************************************
--      END: Library declaration
--*******************************************
--*******************************************
--      START: Entity declaration
--*******************************************
entity addsub_tb is
	
end entity addsub_tb;
--*******************************************
--      END: Entity declaration
--*******************************************
--*******************************************
--      START: Architecture declaration
--*******************************************
architecture behavioral of addsub_tb is
--*******************************************
--      START: Signal declaration
--*******************************************
	signal a : std_logic_vector (3 downto 0) := "0000";
	signal b : std_logic_vector (3 downto 0) := "0000";
	signal c_in : std_logic := '0';
	signal sum  : std_logic_vector (3 downto 0);
	signal c_out : std_logic;
	
	begin
	
	dut : entity work.addsub
	
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
				a <= "0100";
				b <= "0010";
				c_in <= '1';
				wait for 10ns;
				a <= "1000";
				b <= "0011";
				c_in <= '1';
				wait for 10ns;
				wait;
--***************************************
--      End: Process Declaration
--***************************************
		end process simulation;
--***************************************
--      End: Architecture Declaration
--***************************************
end architecture behavioral;
		