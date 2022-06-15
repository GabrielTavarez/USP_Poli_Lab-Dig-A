library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipflop IS 
    port(
        D : in std_logic;
        clock : in std_logic;
        Q : out std_logic
    );
end flipflop;

architecture flipflop_arch of flipflop is

begin

    process(clock, D)
    begin
        if rising_edge(clock) then
            Q <= D;
        end if;
    end process;

end architecture;


