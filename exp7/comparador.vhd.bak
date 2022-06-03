--comparador maior ou igual
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;


entity comparador is
    generic(
	tamanho	: natural  := 2
	);

    port (
        A, B: in std_logic_vector (tamanho downto 0); 
        maior: out STD_LOGIC;
        igual: out std_logic;
        menor: out std_logic
    );
end comparador;



architecture comportamental of comparador is
    signal intA, intB: integer range 0 to 15;
    begin
        intA <= to_integer(unsigned(A));
        intB <= to_integer(unsigned(B));

        maior <= '1' when (intA > intB) else '0';
        igual <= '1' when (intA < intB) else '0';
        menor <= '1' when (intA = intB) else '0';
    end comportamental;