library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is
  generic (
    addr_width : integer := 2;
    data_width : integer := 8
  );
  port (
    clk   : in  std_logic;
    reset : in  std_logic;
    state : in  std_logic_vector(1 downto 0);
    din   : in  std_logic_vector(data_width - 1 downto 0);
    dout  : out std_logic_vector(data_width - 1 downto 0)
  );
end memory;

architecture rtl of memory is
  type ram_type is array ((2**addr_width - 1) downto 0) of std_logic_vector(data_width - 1 downto 0);
  signal RAM        : ram_type := (others => (others => '0'));
  signal prev_state : std_logic_vector(1 downto 0) := "01";
begin

  RAM(0) <= (others => '0');

  process(clk, reset)
  begin
    if reset = '0' then
      RAM(1)     <= (others => '0');
      RAM(2)     <= (others => '0');
      RAM(3)     <= (others => '0');
      dout       <= (others => '0');
      prev_state <= "01";

    elsif rising_edge(clk) then
      prev_state <= state;

      if state = "10" and prev_state /= "10" then
        RAM(1) <= RAM(2);
        RAM(2) <= RAM(3);
        RAM(3) <= din;
        dout   <= din;    -- immediately output the newly written value once
      else
        dout   <= RAM(3); -- hold the stored value (breaks the ALU feedback loop)
      end if;
    end if;
  end process;

end rtl;