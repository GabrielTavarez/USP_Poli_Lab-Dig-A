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
        inicia_b, para_b, reset_b : std_logic;
        clock: in  std_logic;
        ativado, reset : out std_logic
    );
end component;

	

	signal clock_in: std_logic := '0';
	signal reset_in: std_logic := '0';
	constant clockPeriod: time := 2 ns; -- periodo do clock
	signal clock_enable : std_logic := '0';

    signal inicia_b_s, para_b_s, reset_b_s : std_logic := '1';
    signal ativado_s, reset_s : STD_LOGIC := '0';
begin
	DUT: unidade_de_controle
    port map(
        inicia_b => inicia_b_s,
        para_b => para_b_s,
        reset_b => reset_b_s,
        clock => clock_in,
        reset => reset_s,
        ativado => ativado_s
    );
	
    clock_in <= (clock_enable and (not clock_in)) after clockPeriod/2;
	
	estimulos: process is
	begin
        clock_enable <= '1';
        wait for 20*clockPeriod;

        inicia_b_s <= '0';
        wait for 5*clockPeriod;
        inicia_b_s <= '1';

        wait for 10*clockPeriod;

        para_b_s <= '0';
        wait for 5*clockPeriod;
        para_b_s <= '1';

        wait for 10*clockPeriod;
        
        inicia_b_s <= '0';
        wait for 5*clockPeriod;
        inicia_b_s <= '1';

        wait for 10*clockPeriod;

        reset_b_s <= '0';
        wait for 5*clockPeriod;
        reset_b_s <= '1';

        wait for 10*clockPeriod;

        inicia_b_s <= '0';
        wait for 5*clockPeriod;
        inicia_b_s <= '1';

        wait for 10*clockPeriod;

        para_b_s <= '0';
        wait for 5*clockPeriod;
        para_b_s <= '1';

        wait for 10*clockPeriod;

        reset_b_s <= '0';
        wait for 5*clockPeriod;
        reset_b_s <= '1';

        wait for 10*clockPeriod;


		clock_enable <= '0'; -- Desabilita clock		
		wait;  -- para a execução do simulador, caso contrário este process é reexecutado indefinidamente.
	end process;
end architecture;