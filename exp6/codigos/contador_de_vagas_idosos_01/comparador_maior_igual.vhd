--comparador maior ou igual
library IEEE;
use IEEE.std_logic_1164.all;


entity comparador is
    port (
        A, B: in std_logic_vector (3 downto 0); 
        maior_igual: out STD_LOGIC 
    );
end comparador;



architecture comportamental of comparador is
    signal intA, intB: integer range 0 to 15;
    begin
        intA <= to_integer(unsigned(A));
        intB <= to_integer(unsigned(B));

        maior_igual <= '1' when ((intA = intB) or (intA > intB)) else '0';
    end comportamental;