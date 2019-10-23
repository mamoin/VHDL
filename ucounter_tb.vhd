--*******************************************
--      START: Library declaration
--*******************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_1164.all;
--*******************************************
--      START: Library declaration
--*******************************************
--*******************************************
--      START: Entity declaration
--*******************************************
entity ucounter_tb is

end entity ucounter_tb;
--*******************************************
--      End: Entity declaration
--*******************************************
--*******************************************
--      START: Architecture declaration
--*******************************************
architecture behavioral of ucounter_tb is
	
	--Clock generation
	constant clockfreq : integer := 100e6;
	constant clockper : time := 1000 ms/clockfreq;
	
	signal Clk : std_logic := '0';
	signal Rst : std_logic := '0';
	signal Result : std_logic_vector (3 downto 0);
	
	begin
	
	dut : entity work.ucounter
	
		port map (clk => Clk,
					 rst => Rst,
					 result => Result);
		
	Clk <= not Clk after clockper / 2;
	
	simulation : process
	
		begin
		
		Rst <= '1';
		wait for 10ns;
		Rst <= '0';
		wait for 200ns;
		Rst <= '1';
		wait for 10ns;
		Rst <= '0';
		wait for 100ns;
		wait;
		
	end process simulation;

end architecture behavioral;	
	
	
		