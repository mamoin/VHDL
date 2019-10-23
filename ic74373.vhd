library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ic74373 is
	port(	OE_bar: in std_logic;
			LE: in std_logic;
			data: in std_logic_vector(7 downto 0);
			q_out: out std_logic_vector(7 downto 0));
end entity ic74373;

architecture behaviour of ic74373 is

	signal temp_q: std_logic_vector(7 downto 0);
	
	begin
	
	process(OE_bar,LE)
	begin
	
		if(OE_bar = '1') then
			temp_q <= "ZZZZZZZZ";
		else
			if(LE = '1') then
				temp_q <= data;
			else
				temp_q <= temp_q;
			end if;
		end if;
	end process;
	
	q_out <= temp_q;

end architecture behaviour;