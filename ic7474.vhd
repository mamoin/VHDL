library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ic7474 is
	port(	clk: in std_logic;
			preset: in std_logic;
			clear: in std_logic;
			data: in std_logic;
			q: out std_logic;
			q_bar: out std_logic);
end entity ic7474;

architecture behaviour of ic7474 is

	signal tempq: std_logic;
	signal tempq_bar: std_logic;
	
	begin
	
	process(clk, preset, clear)
	
	begin
	
		if(preset = '0' and clear = '1') then
			tempq <= '1';
			tempq_bar <= '0';
		elsif(preset = '1' and clear  = '0') then
			tempq <= '0';
			tempq_bar <= '1';
		elsif(preset = '0' and clear  = '0') then
			tempq <= '1';
			tempq_bar <= '1';
		elsif(preset = '1' and clear  = '1') then
			if(clk'event and clk = '1') then
				tempq <= data;
				tempq_bar <= not data;
			else
				tempq <= tempq;
				tempq_bar <= tempq_bar;
			end if;
		end if;
	end process;
	
q <= tempq;
q_bar <= tempq_bar;

end architecture behaviour;