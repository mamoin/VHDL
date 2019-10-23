--*******************************************
--    Start: Library Declaration
--*******************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--*******************************************
--    End: Library Declaration
--*******************************************
--*******************************************
--    Start: Entity Declaration
--*******************************************
entity ucounter is
	port (clk : in std_logic;
			rst : in std_logic;
			result : out std_logic_vector (3 downto 0));
--*******************************************
--    End: Entity Declaration
--*******************************************
end entity ucounter;
--*******************************************
--    Start: Architecture Declaration
--*******************************************
architecture behavioral of ucounter is

	signal count : std_logic_vector (3 downto 0);
	
	begin
	
	process (clk, rst)
	
		begin
			
			if (rst = '1') then
				count <= "0000";
			elsif (clk'event and clk = '1') then
				if (count = "1111") then
					count <= "0000";
				else
					count <= count + "0001";
				end if;
			end if;
		end process;
			
			result <= count;
			
--*******************************************
--    End: Architecture Declaration
--*******************************************		
end behavioral;
	