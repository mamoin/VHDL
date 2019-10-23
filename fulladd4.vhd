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
entity fulladd4 is
	port (A : in std_logic_vector (3 downto 0); -- input
			B : in std_logic_vector (3 downto 0); -- input 
			C_IN : in std_logic; 					  -- input
			SUM : out std_logic_vector (3 downto 0); -- output
			C_OUT : out std_logic);  					  -- output
--*******************************************
--      END: Entity declaration
--*******************************************
end entity fulladd4;
--*******************************************
--      START: Architecture declaration
--*******************************************
architecture behavioral of fulladd4 is

	signal c0 : std_logic;
	signal c1 : std_logic;
	signal c2 : std_logic;
	
	component full_adder is
		port (a : in std_logic;
				b : in std_logic;
				c_in : in std_logic;
				sum : out std_logic;
				c_out : out std_logic);
				
	end component;
	
	begin
	
	fa0 : full_adder port map (a => A(0), b => B(0), c_in => C_IN, sum => SUM(0), c_out => c0);
	fa1 : full_adder port map (a => A(1), b => B(1), c_in => c0, sum => SUM(1), c_out => c1);
	fa2 : full_adder port map (a => A(2), b => B(2), c_in => C1, sum => SUM(2), c_out => c2);
	fa3 : full_adder port map (a => A(3), b => B(3), c_in => c2, sum => SUM(3), c_out => C_OUT);
--*******************************************
--      END: Architecture declaration
--*******************************************				
	end architecture behavioral;
	
--*******************************************
--            Bottom Block
--*******************************************

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
entity full_adder is
	port (a : in std_logic; -- input
			b : in std_logic; -- input
			c_in: in std_logic; -- input
			sum : out std_logic; -- output
			c_out : out std_logic); -- output
end entity full_adder;
--***************************************
--    START: Architecture Declaration
--***************************************
architecture behavioral_fa of full_adder is
	
	signal x1 : std_logic; -- output of first xor gate
	signal x2 : std_logic; -- signal of and gate 1
	signal x3 : std_logic; -- signal of and gate 2

	begin 
	
		x1 <= a xor b;
		sum <= x1 xor c_in;
		x2 <= x1 and c_in;
		x3 <= a and b;
		c_out <= x2 or x3;
	
--***************************************
--      END: Architecture Declaration
--***************************************
end architecture behavioral_fa;