library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;  

entity memory is
generic (addr_width : integer := 2;
            data_width : integer := 8);
    port (
      clk               : in std_logic;
	  reset             : in std_logic;
      we                : in std_logic;
      din               : in std_logic_vector(data_width - 1 downto 0);
      dout              : out std_logic_vector(data_width - 1 downto 0)
    );
end memory;
  
architecture rtl of memory is

type ram_type is array ((2**addr_width - 1) downto 0) of std_logic_vector(data_width - 1 downto 0);
signal RAM : ram_type;

begin

process(clk, reset)

RAM(0) <= (others => '0');

begin

if reset = '0' then

d_out <= RAM(0);

elsif rising_edge(clk) then

if we = '0' then
RAM(1) <= RAM(2);
RAM(2) <= RAM(3);
RAM(3) <= din;
end if;

d_out <= RAM(3);

end if; --clk

end process;
end rtl;