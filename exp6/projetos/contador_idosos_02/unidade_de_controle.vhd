-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity unidade_de_controle is 
    port(
        entra_sai_idosos, entra_sai_normal, conta_idosos, conta_normal : in  std_logic;
        clock, clear : in  std_logic;
        cheio_dp_sm : in std_logic;
        entra_sai_idosos_sm_dp, entra_sai_normal_sm_dp, conta_idosos_sm_dp, conta_normal_sm_dp, clear_sm_dp: out std_logic
    );
end unidade_de_controle;

-- architecture
architecture arch of unidade_de_controle is
    type state_type is (zera_vagas, vazio, inc_idosos, inc_normal, cheio);
    signal CurrentState, NextState : state_type;
begin  
    update_state: process (clock, clear) --talvez dê errado
    begin
        if (clear = '1') then
            CurrentState <= zera_vagas;
        elsif (rising_edge(clock)) then 
            CurrentState <= NextState;
        end if;
    end process update_state;
    
    update_output: process (CurrentState)
    begin
        case CurrentState is 
            when zera_vagas =>
                clear_sm_dp <= '1';
                conta_idosos_sm_dp <= '0';
                conta_normal_sm_dp <= '0';
                entra_sai_idosos_sm_dp <= 'X'; --talvez dê errado
                entra_sai_normal_sm_dp <= 'X';
            when vazio =>
                clear_sm_dp <= '0';
                conta_idosos_sm_dp <= '0';
                conta_normal_sm_dp <= '0';
                entra_sai_idosos_sm_dp <= 'X'; --talvez dê errado
                entra_sai_normal_sm_dp <= 'X';
            when inc_idosos => 
                clear_sm_dp <= '0';
                conta_idosos_sm_dp <= '1';
                conta_normal_sm_dp <= '0';
                entra_sai_idosos_sm_dp <= entra_sai_idosos; --talvez dê errado
                entra_sai_normal_sm_dp <= entra_sai_idosos;
            when inc_normal =>
                clear_sm_dp <= '0';
                conta_idosos_sm_dp <= '0';
                conta_normal_sm_dp <= '1';
                entra_sai_idosos_sm_dp <= 'X'; --talvez dê errado
                entra_sai_normal_sm_dp <= entra_sai_normal;
            when cheio =>
                clear_sm_dp <= '0';
                conta_idosos_sm_dp <= '0';
                conta_normal_sm_dp <= '0';
                entra_sai_idosos_sm_dp <= 'X'; --talvez dê errado
                entra_sai_normal_sm_dp <= 'X';
            end case;
        end process update_output;

        update_next_state: process(entra_sai_idosos, entra_sai_normal, conta_idosos, conta_normal,cheio_dp_sm )
        begin
            case CurrentState is 
            when zera_vagas =>
                NextState <= vazio;
            when vazio =>
                IF (conta_idosos = '1') then
                    NextState <= inc_idosos;
                ELSIF (conta_normal = '1') then
                    NextState <= inc_normal;
                ELSE
                    NextState <= vazio;
                END IF;
            when inc_idosos =>
                IF (cheio_dp_sm = '1') then
                    NextState <= cheio;
                ELSIF (conta_idosos = '1') then
						NextState <= inc_idosos;
					 ELSE
                    NextState <= vazio;
                END IF;
            when inc_normal =>
                IF (cheio_dp_sm = '1') then
                    NextState <= cheio;
                ELSIF (conta_normal = '1') then
						NextState <= inc_normal;
					 ELSE
                    NextState <= vazio;
                END IF;
            when cheio =>
                IF (conta_idosos = '1' AND entra_sai_idosos = '0') then --saindo idoso
                    NextState <= inc_idosos;
                ELSIF (conta_normal = '1' AND entra_sai_normal = '0') then --saindo normal
                    NextState <= inc_normal;
                ELSE
                    NextState <= cheio;
                END IF;
            end case;
        end process update_next_state;
    end arch;