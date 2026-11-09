library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use work.components.all

 
 entity top is
    port (
      clock           : in  std_logic; 
      rst         : in  std_logic;
      execute       : in  std_logic;
      num_in        : in  std_logic_vector(7 downto 0);
      op            : in  std_logic_vector(1 downto 0);
      led           : out std_logic_vector(2 downto 0);
      hex_0         : out std_logic_vector(6 downto 0);
      hex_1         : out std_logic_vector(6 downto 0);
      hex_2         : out std_logic_vector(6 downto 0)
    );
 end entity;
  
architecture arch of top is

signal rst : std_logic := '1';
signal exec_blip : std_logic := '0';
signal num_sync : std_logic_vector(7 downto 0);
signal op_sync : std_logic_vector(1 downto 0);
signal last_result : std_logic_vector(7 downto 0);
signal r_sig : std_logic_vector(7 downto 0);
signal ones_out

exec_blipper : blipper
port map(
clk => clock,
reset => rst,
button => execute,
blip => exec_blip
);

number_syncer : synchronizer_8bit
port map(
clk => clock,
reset => rst,
async_in => num_in,
sync_out => num_sync
);

op_syncer : synchronizer_2bit
port map(
clk => clock,
reset => rst,
async_in => op,
sync_out => op_sync
);

alu1 : alu
port map(
reset => rst,
a => num_sync,
b => last_result


--nsl : select to show num_sync or result

begin





