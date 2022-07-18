-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity unidade_de_controle is 
    port(
        clock : std_logic;
        programa_s, clear_b, grava_b, inibe_b : in std_logic;
        grava, conta, zera : out std_logic
    );
end unidade_de_controle;

-- architecture
architecture arch of unidade_de_controle is
    type state_type is (clear_state, oper_state, prog_state, grava_state, para_state);
    signal CurrentState, NextState : state_type;
begin  
    update_state: process (clock, clear_b, inibe_b) --talvez dê errado
    begin
        if (rising_edge(clock)) then 
            if (clear_b = '0') then
                CurrentState <= clear_state;
            elsif (inibe_b = '0') then
                CurrentState <= para_state;
            else  
                CurrentState <= NextState;
            end if;
        end if;
    end process update_state;
    
    update_output: process (CurrentState)
    begin
        case CurrentState is 
            when clear_state =>
                grava <= '1'; -- active LOW
                conta <= '0'; 
                zera <=  '1'; 
            when oper_state =>
                grava <= '1'; -- active LOW
                conta <= '1';
                zera <=  '0';
            when prog_state =>
                grava <= '1'; -- active LOW
                conta <= '1';
                zera <=  '0';
            when grava_state =>
                grava <= '0'; -- active LOW
                conta <= '1';
                zera <=  '0';
            when para_state =>
                grava <= '1'; -- active LOW
                conta <= '0';
                zera <=  '0';
            end case;
        end process update_output;

    update_next_state: process(programa_s, clear_b, grava_b)
    begin
        case CurrentState is 
            when clear_state =>
                if programa_s = '0' then
                    NextState <= prog_state;
                else
                    NextState <= oper_state;
                end if;
            when oper_state =>
                if programa_s = '0' then
                    NextState <= prog_state;
                else 
                    NextState <= oper_state;
                end if;
            when prog_state => 
                if programa_s = '1' then
                    NextState <= oper_state;
                elsif programa_s = '0' and grava_b = '0' then
                    NextState <= grava_state;
                else
                    NextState <= prog_state;
                end if;
            when grava_state => 
                if grava_b = '0' then
                    NextState <= grava_state;
                else
                    NextState <= prog_state;
                end if;
            when para_state => 
                if programa_s = '1' then
                    NextState <= oper_state;
                else
                    NextState <= prog_state;
                end if;
        end case;
    end process update_next_state;
end arch;