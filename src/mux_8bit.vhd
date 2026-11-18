library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity mux_8bit is
port(
a : in std_logic_vector(7 downto 0);
b : in std_logic_vector(7 downto 0);
s : in std_logic_vector(1 downto 0);
output : out std_logic_vector(7 downto 0)
);
end entity;

architecture beh of mux_8bit is
begin

mux : process (a, b, s)
begin

case s is

when "01" => output <= a;

when "10" => output <= b;

when others => output <= a;

end case;

end process;

end beh;