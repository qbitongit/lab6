library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;  

entity memory is
generic (addr_width : integer := 2;
            data_width : integer := 8);
    port (
      clk               : in std_logic;
	  reset             : in std_logic;
      state             : in std_logic_vector(1 downto 0);
      din               : in std_logic_vector(data_width - 1 downto 0);
      dout              : out std_logic_vector(data_width - 1 downto 0)
    );
end memory;
  
architecture rtl of memory is

type ram_type is array ((2**addr_width - 1) downto 0) of std_logic_vector(data_width - 1 downto 0);
signal RAM : ram_type;
signal out_sig : std_logic_vector(data_width - 1 downto 0) := (others => '0');
signal prev_state : std_logic_vector(1 downto 0);

begin

RAM(0) <= (others => '0');


process(clk, reset)
begin

if reset = '0' then

out_sig <= RAM(0);
RAM(1) <= RAM(0);
RAM(2) <= RAM(0);
RAM(3) <= RAM(0);

elsif rising_edge(clk) then

prev_state <= state;

if (state = "10") then
RAM(1) <= RAM(2);
RAM(2) <= RAM(3);
RAM(3) <= din;
dout <= din;

end if;

dout <= RAM(3);

end if; --clk

end process;

end rtl;