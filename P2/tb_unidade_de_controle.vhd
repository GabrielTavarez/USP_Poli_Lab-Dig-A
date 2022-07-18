library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.ceil;
use ieee.math_real.log2;
use ieee.numeric_std.all;
entity tb_unidade_de_controle is
end tb_unidade_de_controle;

architecture tb_unidade_de_controle_arch of tb_unidade_de_controle is


component unidade_de_controle is 
    port(
        clock : std_logic;
        programa_s, clear_b, grava_b, inibe_b : in std_logic;
        grava, conta, zera : out std_logic
    );
end component;

	
	signal clock_in: std_logic := '0';
	signal clock_enable : std_logic := '0';
	constant clockPeriod: time := 10 us; -- periodo do clock

	signal grava_s, conta_s, zera_s: std_logic := '0';
	signal programa_s_s, clear_b_s, grava_b_s, inibe_b_s : std_logic := '1';

    

begin
	DUT: unidade_de_controle port map(
        clock => clock_in,
        programa_s => programa_s_s,
        clear_b => clear_b_s,
        grava_b => grava_b_s,
        inibe_b => inibe_b_s,
        grava => grava_s,
        conta => conta_s,
        zera => zera_s
    );
	
    clock_in <= (clock_enable and (not clock_in)) after clockPeriod/2;
	
	estimulos: process is
	begin
        clock_enable <= '1';
        wait for 20*clockPeriod;

        -- fica em clear
        programa_s_s <= '1';
        clear_b_s <= '0';
        grava_b_s <= '1';
        inibe_b_s <= '1';
        wait for 20*clockPeriod;

        
        -- operação
        programa_s_s <= '1';
        clear_b_s <= '1';
        grava_b_s <= '1';
        inibe_b_s <= '1';
        wait for 20*clockPeriod;

        
        -- vai pra prgamação
        programa_s_s <= '0';
        clear_b_s <= '1';
        grava_b_s <= '1';
        inibe_b_s <= '1';
        wait for 20*clockPeriod;

        
        -- Volta pra operação
        programa_s_s <= '1';
        clear_b_s <= '1';
        grava_b_s <= '1';
        inibe_b_s <= '1';
        wait for 20*clockPeriod;

        
        -- vai pra programação
        programa_s_s <= '0';
        clear_b_s <= '1';
        grava_b_s <= '1';
        inibe_b_s <= '1';
        wait for 20*clockPeriod;

        
        -- vai pra gravar
        programa_s_s <= '0';
        clear_b_s <= '1';
        grava_b_s <= '0';
        inibe_b_s <= '1';
        wait for 20*clockPeriod;

        
        -- vai pra programação
        programa_s_s <= '0';
        clear_b_s <= '1';
        grava_b_s <= '1';
        inibe_b_s <= '1';
        wait for 20*clockPeriod;

        
        -- vai pra operação
        programa_s_s <= '1';
        clear_b_s <= '1';
        grava_b_s <= '1';
        inibe_b_s <= '1';
        wait for 20*clockPeriod;

        -- vai pra inibe
        programa_s_s <= '1';
        clear_b_s <= '1';
        grava_b_s <= '1';
        inibe_b_s <= '0';
        wait for 20*clockPeriod;
        
        -- vai pra operação
        programa_s_s <= '1';
        clear_b_s <= '1';
        grava_b_s <= '1';
        inibe_b_s <= '1';
        wait for 20*clockPeriod;

        -- vai pra reset
        programa_s_s <= '1';
        clear_b_s <= '0';
        grava_b_s <= '1';
        inibe_b_s <= '0';
        wait for 20*clockPeriod;

		clock_enable <= '0'; -- Desabilita clock		
		wait;  -- para a execução do simulador, caso contrário este process é reexecutado indefinidamente.
	end process;
end architecture;