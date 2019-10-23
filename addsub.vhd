--*******************************************
--      START: Top level module
--*******************************************
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
entity addsub is
	port (A : in std_logic_vector (3 downto 0); --input
			B : in std_logic_vector (3 downto 0); --input
			C_IN : in std_logic;						  -- input
			SUM : out std_logic_vector (3 downto 0);--output
			C_OUT : out std_logic);  					 --output
--*******************************************
--      END: Entity declaration
--*******************************************
end entity addsub;
--*******************************************
--      START: Architecture declaration
--*******************************************
architecture behavioral of addsub is

	signal c0 : std_logic; -- carry 1
	signal c1 : std_logic; -- carry 2
	signal c2 : std_logic; -- carry 3
	
	signal x0 : std_logic; -- 1's Cpmplement
	signal x1 : std_logic; -- 1's Complement
	signal x2 : std_logic; -- 1's Complement
	signal x3 : std_logic; -- 1's Complement
	
	component full_adder is
		port (a : in std_logic;
				b : in std_logic;
				c_in : in std_logic;
				sum : out std_logic;
				c_out : out std_logic);
	end component full_adder;
	
	begin 
	
	x0 <= B(0) xor C_IN;
	x1 <= B(1) xor C_IN;
	x2 <= B(2) xor C_IN;
	x3 <= B(3) xor C_IN;
	
	fa0 : full_adder port map ( sum => SUM(0), c_out => c0, a => A(0), b => x0, c_in => C_IN );
	fa1 : full_adder port map ( sum => SUM(1), c_out => c1, a => A(1), b => x1, c_in => c0 );
	fa2 : full_adder port map ( sum => SUM(2), c_out => c2, a => A(2), b => x2, c_in => c1 );
	fa3 : full_adder port map ( sum => SUM(3), c_out => C_OUT, a => A(3), b => x3, c_in => c2 );

--*******************************************
--      END: Architecture declaration
--*******************************************	
end architecture behavioral;
--*******************************************
--      END: Top Level Module
--*******************************************

--*******************************************
--      START: Bottom level module
--*******************************************
--*******************************************
--      START: Library declaration
--*******************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--*******************************************
--      START: Library declaration
--*******************************************
--*******************************************
--      START: Entity declaration
--*******************************************
entity full_adder is
	port (a : in std_logic;
			b : in std_logic;
			c_in : in std_logic;
			sum : out std_logic;
			c_out : out std_logic);
--*******************************************
--      END: Entity declaration
--*******************************************
end entity full_adder;
--*******************************************
--      START: Architecture declaration
--*******************************************
architecture behavioral_fa of full_adder is

	signal e : std_logic; -- output of first xor gate
	signal f : std_logic; -- signal of and gate 1
	signal g : std_logic; -- signal of and gate 2

	begin 
	
		e <= a xor b;
		sum <= e xor c_in;
		f <= e and c_in;
		g <= a and b;
		c_out <= f or g;

--*******************************************
--      END: Architecture declaration
--*******************************************
end architecture behavioral_fa;
--*******************************************
--      END: Bottom level design
--*******************************************
