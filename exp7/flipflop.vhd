library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity flipflop is
    port (
        clock: in std_logic;
        reset: in std_logic;
        D: in std_logic;
        Q: out std_logic;
        Qn: out std_logic
    );
end flipflop;

architecture ff_arch of flipflop is
begin
    process (clock, reset)
    begin
        if reset = '1' then
            Q <= '0';
            Qn <= '0';
        elsif clock'event and clock = '1' then
            Q <= D;
            Qn <= NOT(D);
        end if;
    end process;

end ff_arch;