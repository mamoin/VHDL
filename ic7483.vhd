library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ic7483 is
	port(	data_a: in std_logic_vector (3 downto 0);
			data_b: in std_logic_vector (3 downto 0);
			c_in: in std_logic;
			sum: out std_logic_vector(3 downto 0);
			c_out: out std_logic);
end entity ic7483;

architecture behaviour of ic7483 is
	signal temp_out: std_logic_vector(4 downto 0);
	begin
	process(data_a, data_b, c_in)
	begin
		temp_out <= ('0' & data_a) + ('0' & data_b) + ("000" & c_in);
	end process;
	
	sum <= temp_out(3 downto 0);
	c_out <= temp_out(4);
end architecture behaviour;
	