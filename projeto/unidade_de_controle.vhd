-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity unidade_de_controle is 
    port(
        inicia_b, para_b, reset_b : in std_logic;
        clock: in  std_logic;
        ativado, reset : out std_logic
    );
end unidade_de_controle;

-- architecture
architecture arch of unidade_de_controle is
    type state_type is (zera, parado, contando);
    signal CurrentState, NextState : state_type;
begin  
    update_state: process (clock, reset_b) --talvez dê errado
    begin
        if (reset_b = '0') then
            CurrentState <= zera;
        elsif (rising_edge(clock)) then 
            CurrentState <= NextState;
        end if;
    end process update_state;
    
    update_output: process (CurrentState)
    begin
        case CurrentState is 
            when zera =>
                ativado <= '0';
                reset <= '1';
            when parado =>
                ativado <= '0';
                reset <= '0';
            when contando => 
                ativado <= '1';
                reset <= '0';
            end case;
        end process update_output;

    update_next_state: process(inicia_b, para_b, reset_b)
    begin
        case CurrentState is 
            when zera =>
                NextState <= parado;
            when parado =>
                if inicia_b = '0' then
                    NextState <= contando;
                else 
                    NextState <= parado;
                end if;
            when contando => 
                if para_b = '0' then
                    NextState <= parado;
                else
                    NextState <= contando;
                end if;
        end case;
    end process update_next_state;
end arch;