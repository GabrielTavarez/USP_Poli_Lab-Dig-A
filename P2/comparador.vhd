library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity comparador IS 
    port(
        A, B : in std_logic_vector(3 downto 0);
        AeB, AgB, AlB : out std_logic
    );
end comparador;

architecture comparador_arch of comparador is

signal A_s, B_s : integer range 0 to 15 := 0;
signal AeB_s, AgB_s, AlB_s : std_logic;

begin

    A_s <= to_integer(unsigned(A));
    B_s <= to_integer(unsigned(B));


    AeB_s <= '1' when A_s = B_s else '0';
    AgB_s <= '1' when A_s > B_s else '0';
    AlB_s <= '1' when A_s < B_s else '0';

    AeB <= AeB_s after 5 ns;
    AgB <= AgB_s after 5 ns;
    AlB <= AlB_s after 5 ns;
end architecture;


