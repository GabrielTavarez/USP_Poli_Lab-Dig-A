-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity unidade_de_controle is 
    port(
        muda_estado  : in  std_logic; -- 1 : Config | 0 : Operação
        clock : in std_logic;
        modo: out std_logic
    );
end unidade_de_controle;

-- architecture
architecture arch of unidade_de_controle is
    type state_type is (operacao, configuracao);
    signal CurrentState, NextState : state_type;
begin  
    update_state: process (clock) 
    begin
        if (rising_edge(clock)) then 
            CurrentState <= NextState;
        end if;
    end process update_state;
    
    update_output: process (CurrentState)
    begin
        case CurrentState is 
            when operacao =>
                modo <= '0';
            when configuracao =>
                modo <= '1';
            end case;
        end process update_output;

        update_next_state: process(muda_estado)
        begin
            case CurrentState is 
            when operacao =>
                IF (muda_estado = '1') then
                    NextState <= configuracao;
                ELSE
                    NextState <= operacao;
                END IF;
            when configuracao =>
                IF (muda_estado = '1') then
                    NextState <= operacao;
                ELSE
                    NextState <= configuracao;
                END IF;
            end case;
        end process update_next_state;
    end arch;