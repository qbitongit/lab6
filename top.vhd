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
      led           : out std_logic_vector(1 downto 0);
      hex_0         : out std_logic_vector(6 downto 0);
      hex_1         : out std_logic_vector(6 downto 0);
      hex_2         : out std_logic_vector(6 downto 0)
    );
 end entity;
  
architecture arch of top is

signal this_state : std_logic_vector(1 downto 0) := "01";
signal last_state : std_logic_vector(1 downto 0) := "01";
signal exec_blip : std_logic := '0';
signal num_sync : std_logic_vector(7 downto 0);
signal op_sync : std_logic_vector(1 downto 0);
signal last_result : std_logic_vector(7 downto 0);
signal r_sig : std_logic_vector(7 downto 0);
signal ones_dabbled : std_logic_vector(3 downto 0);
signal tens_dabbled : std_logic_vector(3 downto 0);
signal hund_dabbled : std_logic_vector(3 downto 0);

begin

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
op => op_sync,
result => r_sig
);

nsl1 : nsl
port map(
reset => rst,
clk => clock,
in_state => last_state,
flag => exec_blip,
out_state => this_state
);

mem : memory
port map(
clk => clock,
reset => rst,
state => this_state,
din => r_sig,
dout => last_result
);

dabbler : double_dabble
port map(
binary_in => last_result,
ones => ones_dabbled,
tens => tens_dabbled,
hundreds => hund_dabbled
);


ones_seg : seven_seg
port map(
bcd => ones_dabbled,
seven_seg_out => hex_0
);

tens_seg : seven_seg
port map(
bcd => tens_dabbled,
seven_seg_out => hex_1
);


hundreds_seg : seven_seg
port map(
bcd => hund_dabbled,
seven_seg_out => hex_2
);


state_leds <= this_state;
this_state <= next_state;


end arch;



