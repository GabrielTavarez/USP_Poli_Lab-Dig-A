-- contador hexadecimal 2
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;


entity up_down is
    port (
        clock, zera, conta, carrega, entra_sai: in std_logic; 
        entrada: in std_logic_vector (3 downto 0); 
        contagem: out std_logic_vector (3 downto 0)
    );
end up_down;


architecture comportamental of up_down is
   
    signal IQ: integer range 0 to 15 := 0; 

begin
    process (clock, zera, conta, carrega, entrada, IQ, entra_sai)
    begin
        if zera = '1' then IQ <= 0;
        elsif clock'event and clock = '1' then 
            if carrega = '1' then 
                IQ <= to_integer(unsigned(entrada));
            elsif conta = '1' then
                if entra_sai = '1'then
                    if IQ = 15 then IQ <= 0;
                    else IQ <= IQ + 1;
                    end if;
                else 
                    if IQ = 0 then IQ <= 15;
                    else IQ <= IQ - 1;
                    end if;
                end if;
            else IQ <= IQ;
            end if;
        end if;
    end process; 

    contagem <= std_logic_vector(to_unsigned(IQ, contagem'length));

end comportamental ; 
