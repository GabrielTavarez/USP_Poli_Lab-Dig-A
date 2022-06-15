library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity contador IS 
    port(
        clock : in std_logic;
        Q : out std_logic_vector(3 downto 0);
        full : out std_logic;
        res : in std_logic
    );
end contador;

architecture contador_arch of contador is

component flipflop IS 
    port(
        D : in std_logic;
        clock : in std_logic;
        Q : out std_logic
    );
end component;

signal Q_integer_s : integer;
signal full_s, full_del_1_s : std_logic;
signal n_clock_s : std_logic;

begin

    n_clock_s <= NOT(clock);


    process(clock, res)
    begin
        if res = '1' then
            Q_integer_s <= 0;
        elsif rising_edge(clock) then
            if Q_integer_s = 15 then 
                Q_integer_s <= 0;
                full_s <= '1';
            elsif Q_integer_s < 15 then
                Q_integer_s <= Q_integer_s + 1;
                full_s <= '0';
            end if;
        end if;
    end process;

    delay_reg_1:flipflop 
        port map(
            D => full_s ,
            Q => full_del_1_s,
            clock => n_clock_s
    );

    delay_reg_2:flipflop 
        port map(
            D => full_del_1_s,
            Q => full ,
            clock => clock
    );



    Q <= std_logic_vector(to_unsigned(Q_integer_s, Q'length));

end architecture;


