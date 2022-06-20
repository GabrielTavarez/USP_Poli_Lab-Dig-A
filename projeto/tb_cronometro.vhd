library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.ceil;
use ieee.math_real.log2;
use ieee.numeric_std.all;
entity tb_cronometro is
end tb_cronometro;

architecture tb_cronometro_arch of tb_cronometro is


component cronometro is
    port(
        inicia_b, para_b, reset_b : std_logic;
        clock: in  std_logic;

        display_0 : out std_logic_vector(6 downto 0);
        display_1 : out std_logic_vector(6 downto 0);
        display_2 : out std_logic_vector(6 downto 0);
        display_3 : out std_logic_vector(6 downto 0);
        display_4 : out std_logic_vector(6 downto 0);
        display_5 : out std_logic_vector(6 downto 0)
    );
end component;

	

	signal clock_in: std_logic := '0';
	signal reset_in: std_logic := '0';
	constant clockPeriod: time := 10 us; -- periodo do clock
	signal clock_enable : std_logic := '0';

    signal inicia_b_s, para_b_s, reset_b_s : std_logic := '1';

begin
	DUT: cronometro port map(
        inicia_b => inicia_b_s,
        para_b => para_b_s,
        reset_b => reset_b_s,
        clock => clock_in
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

        wait for 10000*clockPeriod;

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