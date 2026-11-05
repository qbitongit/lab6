
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blipper is
    port (
        clk   : in  std_logic;
        reset : in  std_logic;
        button: in  std_logic;
        blip  : out std_logic := '0'
    );
end blipper;

architecture beh of blipper is

    signal blip_reg : std_logic := '0';

    -- Synchronize the asynchronous button input
    signal button_meta : std_logic := '1';
    signal button_sync : std_logic := '1';
    signal button_prev : std_logic := '1';

begin

    process(clk, reset)
    begin
        if reset = '1' then
            blip_reg    <= '0';
            button_meta <= '1';
            button_sync <= '1';
            button_prev <= '1';

        elsif rising_edge(clk) then

            -- Synchronize button to the FPGA clock
            button_meta <= button;
            button_sync <= button_meta;
            button_prev <= button_sync;

            if blip_reg = '0' then

                -- Detect a new button press (high to low)
                if button_prev = '1' and button_sync = '0' then
                    blip_reg <= '1';
                end if;

            else
                    blip_reg <= '0';

            end if;
        end if;
    end process;

    blip <= bip_reg;

end beh;
