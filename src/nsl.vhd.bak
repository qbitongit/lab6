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

	signal state_sig1 : std_logic_vector(1 downto 0) := "01";
	signal state_sig2 : std_logic_vector(1 downto 0) := "01";
	signal prev_flag : std_logic := '0';

begin

next_state : process (flag)
begin

if (flag = '1') and (prev_flag = '0') then --rising edge
state_sig1 <= (in_state(0) & in_state(1));
else
state_sig1 <= in_state;
end if;

end process;

clocked : process(clk, reset)
begin
if reset = '0' then
state_sig1 <= "01";
state_sig2 <= "01";
elsif rising_edge(clk) then
state_sig2 <= state_sig1;
out_state <= state_sig2;
end if;

end process;


end beh;