
library ieee;
use ieee.std_logic_1164.all;   
use ieee.numeric_std.all;
   

entity top_tb is 
end top_tb;

architecture arch of top_tb is

component top is
port(

clock : in std_logic;
rst : in std_logic;
execute : in std_logic;
num_in : in std_logic_vector(8 downto 0);
state_leds : out std_logic_vector(3 downto 0);
hex0 : out std_logic_vector(6 downto 0);
hex1 : out std_logic_vector(6 downto 0);
hex2 : out std_logic_vector(6 downto 0)

);
end component;
	
signal clock_tb : std_logic := '0';
signal rst_tb : std_logic := '0';
signal butt_tb : std_logic := '1';
signal num_tb  : std_logic_vector(8 downto 0):= (others => '0');
	
constant period : time := 20 ns;
	
begin
	
clock : process
begin
clock_tb <= not clock_tb;
wait for period/2;
end process;

reset : process
begin
wait for 5 ms;
rst_tb <= '1';
wait;
end process;

i_num : process
begin

for i in 0 to 44 loop
num_tb <= std_logic_vector(unsigned(num_tb) + 31);
wait for 10 ms;
end loop;
for i in 0 to 44 loop
num_tb <= std_logic_vector(unsigned(num_tb) - 31);
wait for 10 ms;
end loop;
wait;
	
end process;

state : process
begin
wait for 5 ms;
butt_tb <= '0';
wait for 1 ms;
butt_tb <= '1';
wait for 5 ms;
end process;

uut : top
port map(
clock => clock_tb,
reset_button => rst_tb,
butt_async => butt_tb,
num_async => num_tb,
state_leds => open,
hex100s => open, 
hex10s => open,
hex1s => open
);

end arch; 