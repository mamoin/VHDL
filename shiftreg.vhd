library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity shiftreg is
	port(	clk: in std_logic;
			reset: in std_logic;
			--sil: in std_logic;
			--sir: in std_logic;
			datain: in std_logic_vector(7 downto 0);
			mode: in std_logic_vector(1 downto 0);
			sol: out std_logic;
			sor: out std_logic;
			dataout: out std_logic_vector(7 downto 0));
end entity shiftreg;

architecture behaviour of shiftreg is

	signal tempdataout: std_logic_vector(7 downto 0) := "00000000";
	signal divided_clk : std_logic := '0';
	
	begin
	
	process(clk)
	
		variable clk_count: integer:=0;
		begin
			if(clk'event and clk = '1') then
				if(clk_count = 12500000) then
					divided_clk <= not divided_clk;
					clk_count := 0;
				else
					clk_count := clk_count + 1;
				end if;
			end if;
	end process;
		
	process(divided_clk, reset)
	begin
	
		if(reset = '0') then
			tempdataout <= "00000000";
		else
			if(divided_clk'event and divided_clk = '1') then
				if(mode = "00") then 
					tempdataout <= tempdataout(6 downto 0) & '1';
				elsif(mode = "01") then
					tempdataout <= '1' & tempdataout(7 downto 1);
				elsif(mode = "10") then
					tempdataout <= datain;
				else
					null;
				end if;
			else
				null;
			end if;
		end if;
	end process;


dataout <= tempdataout;
sol <= tempdataout(7);
sor <= tempdataout(0);

end architecture behaviour;
