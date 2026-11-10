library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nsl is
port(
reset : in std_logic;
clk : in std_logic;
in_state : in std_logic_vector(1 downto 0);
flag : in std_logic;
out_state : out std_logic_vector(1 downto 0)
);
end nsl;

architecture beh of nsl is

	signal state_sig1 : std_logic_vector(3 downto 0) := "01";
	signal state_sig2 : std_logic_vector(3 downto 0) := "01";
	signal pressed : std_logic := '0';

begin

next_state : process (clk, reset, flag)
begin

if reset = '0' then
state_sig1 <= "01";
state_sig2 <= "01";

elsif rising_edge(clk) then

if flag = '1' then
state_sig1 <= (in_state(0) & in_state(1));
else
state_sig2 <= state_sig1;
end if;

end if;

end process;

out_state <= state_sig2;

end beh;