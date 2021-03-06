-- contador hexadecimal
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- entidade: lista de entradas e saídas que faz a interface do circuito

entity contador_hexadecimal is
    port (
        clock, zera, conta, carrega: in std_logic; -- entrada de 1 bit
        entrada: in std_logic_vector (3 downto 0); -- entrada de 4 bits
        contagem: out std_logic_vector (3 downto 0); -- saída de 4 bits
        fim: out std_logic -- saída de 1 bit
    );
end contador_hexadecimal;

-- arquitetura: descreve a implementação do circuito 

architecture comportamental of contador_hexadecimal is
   
    signal IQ: integer range 0 to 15; 
    -- sinal que varia de 0 a 15

begin
    process (clock, zera, conta, carrega, entrada, IQ)
    -- comando que permite um conjunto de instruções seja executado sequencialmente
    begin
        if zera = '1' then IQ <= 0;
        -- caso zera for igual a '1', o sinal IQ recebe '0'
        elsif clock'event and clock = '1' then 
        -- caso zera for igual a '0', quando ocorre a subida do clock, outros comandos acontecem
            if carrega = '1' then 
                IQ <= to_integer(unsigned(entrada));
        -- caso carrega seja '1', o sinal IQ recebe o valor de 'entrada' convertido de bit para integer
            elsif conta = '1' then
                if IQ = 15 then IQ <= 0;
                -- caso conta seja igual a '1' e o sinal IQ seja igual a 15, esse sinal recebe 0
                else IQ <= IQ + 1;
                -- caso contrário, o sinal IQ é incrementado
                end if;
            else IQ <= IQ;
            -- caso carrega e conta sejam iguais a '0', o sinal IQ recebe ele mesmo
            end if;
        end if;
    end process; -- fim do process

    contagem <= std_logic_vector(to_unsigned(IQ, contagem'length));
    -- a contagem recebe o valor do sinal IQ convertido de integer para logic_vector

    fim <= '1' when IQ = 15 else '0';
    -- a saída fim recebe '1' caso o sinal IQ seja igual a 15, caso contrário, fim recebe '0'
end comportamental ; 
