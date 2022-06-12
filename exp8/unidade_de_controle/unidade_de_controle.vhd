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
    type state_type is (operacao, configuracao,mudanca_op_conf, mudanca_conf_op);
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
				when mudanca_op_conf => 
					 modo <= '1';
				when mudanca_conf_op =>
					 modo <= '0';
            end case;
        end process update_output;

        update_next_state: process(muda_estado)
        begin
            case CurrentState is 
            when operacao =>
                IF (muda_estado = '1') then
                    NextState <= mudanca_op_conf;
                ELSE
                    NextState <= operacao;
                END IF;
            when mudanca_op_conf =>
                IF (muda_estado = '0') then
                    NextState <= configuracao;
                ELSE
                    NextState <= mudanca_op_conf;
                END IF;
				 when configuracao =>
                IF (muda_estado = '1') then
                    NextState <= mudanca_conf_op;
                ELSE
                    NextState <= configuracao;
                END IF;
				when mudanca_conf_op =>
                IF (muda_estado = '0') then
                    NextState <= operacao;
                ELSE
                    NextState <= mudanca_conf_op;
                END IF;
            end case;
        end process update_next_state;
    end arch;