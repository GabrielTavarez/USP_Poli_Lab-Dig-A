library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity contador IS 
    generic(
        max : integer := 15
    );
    port(
        clock : in std_logic; --active HIGH
        load_n : in  std_logic; --active LOW
        Q_in : in std_logic_vector(3 downto 0);
        Q : out std_logic_vector(3 downto 0);
        reset_n : in std_logic
    );
end contador;

architecture contador_arch of contador is

signal Q_integer_s :  integer range 0 to 15 := 0;
signal Q_s : std_logic_vector(3 downto 0) := "0000";

begin
    process(clock, reset_n, Q_integer_s, load_n)
    begin
        if rising_edge(clock) then
            if reset_n = '0' then -- active low
                Q_integer_s <= 0;
            elsif load_n = '0' then --active low
                Q_integer_s <= to_integer(unsigned(Q_in));
            elsif Q_integer_s = max then 
                Q_integer_s <= 0;
            elsif Q_integer_s < max then
                Q_integer_s <= Q_integer_s + 1;
            end if;
        end if;
    end process;

    Q_s <= std_logic_vector(to_unsigned(Q_integer_s, Q_s'length));
    Q <= Q_s;
end architecture;


