-------------------------------------------------------------------------------
-- Dr. Kaputa
-- components package
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package components is

  component double_dabble is
    port (
      binary_in       : in std_logic_vector(7 downto 0);
      ones            : out std_logic_vector(3 downto 0);
      tens            : out std_logic_vector(3 downto 0);
      hundreds        : out std_logic_vector(3 downto 0)
    );  
  end component;  

  component alu is
    port (
	  clk : in std_logic;
      reset         : in  std_logic;
      a             : in  std_logic_vector(7 downto 0); 
      b             : in  std_logic_vector(7 downto 0);
      op            : in  std_logic_vector(1 downto 0); -- 00: add, 01: sub, 10: mult, 11: div
      result        : out std_logic_vector(7 downto 0)
    );  
  end component; 
  
  component mux_8bit is
port(
a : in std_logic_vector(7 downto 0);
b : in std_logic_vector(7 downto 0);
s : in std_logic_vector(1 downto 0);
output : out std_logic_vector(7 downto 0)
);
end component;

  component memory is 
    generic (addr_width : integer := 2;
            data_width : integer := 8);
    port (
      clk               : in std_logic;
	  reset             : in std_logic;
      state                : in std_logic_vector(1 downto 0);
      din               : in std_logic_vector(data_width - 1 downto 0);
      dout              : out std_logic_vector(data_width - 1 downto 0)
    );
  end component;

component blipper is
    port (
        clk   : in  std_logic;
        reset : in  std_logic;
        button: in  std_logic;
        blip  : out std_logic := '0'
    );
end component;
  
  
  component synchronizer_2bit is 
    port (
      clk               : in std_logic;
      reset             : in std_logic;
      async_in          : in std_logic_vector(1 downto 0);
      sync_out          : out std_logic_vector(1 downto 0)
    );
  end component;
  
  component synchronizer_8bit is 
    port (
      clk               : in std_logic;
      reset             : in std_logic;
      async_in          : in std_logic_vector(7 downto 0);
      sync_out          : out std_logic_vector(7 downto 0)
    );
  end component;
  
  component seven_seg is
    port (
      bcd             : in std_logic_vector(3 downto 0);
      seven_seg_out   : out std_logic_vector(6 downto 0)
    );  
  end component;  
  
component nsl is
   port(
     reset : in std_logic;
     clk : in std_logic;
     in_state : in std_logic_vector(1 downto 0);
     flag : in std_logic;
     out_state : out std_logic_vector(1 downto 0)
    );
end component;


end components;