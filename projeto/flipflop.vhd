library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipflop IS 
    port(
        D : in std_logic;
        clock : in std_logic;
        reset : in std_logic;
        preset: in std_logic;
        Q : out std_logic
    );
end flipflop;

architecture flipflop_arch of flipflop is

signal Q_s : std_logic := '0';

begin

    process(clock, D, reset, preset)
    begin
        if reset = '1' then
            Q_s <= '0';
        elsif preset = '1' then
            Q_s <= '1';
        elsif rising_edge(clock) then
            Q_s <= D;
        end if;
    end process;

    Q <= Q_s;

end architecture;


