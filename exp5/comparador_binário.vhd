-- comparador binário

library IEEE;
use IEEE.std_logic_1164.all;

-- entidade do circuito: lista de entradas e saídas que faz a interface do circuito

entity comparador is
    port (
        A, B: in std_logic_vector (1 downto 0); -- entradas de 2 bits
        igual: out STD_LOGIC -- saída de 1 bit
    );
end comparador;

-- arquitetura: descreve a implementação do circuito 

architecture comportamental of comparador is
    begin

        igual <= '1' when A = B else '0';
        -- caso A seja igual a B, a saída recebe '1', caso contrário, recebe '0'
    end comportamental;

    