library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity contador IS 
    generic(
        max : integer := 15
    );
    port(
        clock : in std_logic;
        Q : out std_logic_vector(3 downto 0);
        full : out std_logic;
        reset : in std_logic
    );
end contador;

architecture contador_arch of contador is

component flipflop IS 
    port(
        D : in std_logic;
        clock : in std_logic;
        reset : in std_logic;
        preset: in std_logic;
        Q : out std_logic
    );
end component;

signal Q_integer_s :  integer range 0 to 15 := 0;
signal full_s, full_del_1_s, full_out_s : std_logic := '0';
signal n_clock_s : std_logic;
signal Q_s : std_logic_vector(3 downto 0) := "0000";

begin

    n_clock_s <= NOT(clock);


    process(clock, reset, Q_integer_s)
    begin
        if reset = '1' then
            Q_integer_s <= 0;
        elsif rising_edge(clock) then
            if Q_integer_s = max then 
                Q_integer_s <= 0;
                -- full <= '1';
            elsif Q_integer_s < max then
                Q_integer_s <= Q_integer_s + 1;
                -- full <= '0';
            end if;
        end if;
    end process;

    full_s <= '1' when Q_integer_s = max else '0';

    Q_s <= std_logic_vector(to_unsigned(Q_integer_s, Q_s'length));
    Q <= Q_s;

    delay_reg_1:flipflop 
        port map(
            D => full_s ,
            Q => full_del_1_s,
            reset => reset,
            preset => '0',
            clock => n_clock_s
    );

    delay_reg_2:flipflop 
        port map(
            D => full_del_1_s,
            Q => full_out_s ,
            reset => reset,
            preset => '0',
            clock => clock
    );

    full <= full_out_s;

end architecture;


