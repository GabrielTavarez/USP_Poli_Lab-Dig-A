library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.ceil;
use ieee.math_real.log2;
use ieee.numeric_std.all;
entity tb_fluxo_de_dados is
end tb_fluxo_de_dados;

architecture tb_fluxo_de_dados_arch of tb_fluxo_de_dados is


component fluxo_de_dados IS 
    generic(
        max : integer := 15
    );
    port(
        clock : in std_logic;
        grava, conta, zera : in std_logic;
        Q0_in, Q1_in, Q2_in, Q3_in : in std_logic_vector(3 downto 0);
        Q0_out, Q1_out, Q2_out, Q3_out : out std_logic_vector(3 downto 0)
    );
end component;

	
	signal clock_in: std_logic := '0';
	signal clock_enable : std_logic := '0';
	constant clockPeriod: time := 10 us; -- periodo do clock

	signal grava_s, conta_s, zera_s: std_logic := '0';
	signal Q0_in_s, Q1_in_s, Q2_in_s, Q3_in_s: std_logic_vector(3 downto 0) := "0000";
	signal Q0_out_s, Q1_out_s, Q2_out_s, Q3_out_s: std_logic_vector(3 downto 0);
    

begin
	DUT: fluxo_de_dados port map(
        clock => clock_in,
        grava => grava_s,
        conta => conta_s,
        zera => zera_s,
        Q0_in => Q0_in_s,
        Q1_in => Q1_in_s,
        Q2_in => Q2_in_s,
        Q3_in => Q3_in_s,
        Q0_out => Q0_out_s,
        Q1_out => Q1_out_s,
        Q2_out => Q2_out_s,
        Q3_out => Q3_out_s
    );
	
    clock_in <= (clock_enable and (not clock_in)) after clockPeriod/2;
	
	estimulos: process is
	begin
        clock_enable <= '1';
        wait for 20*clockPeriod;

        grava_s <= '1';
        conta_s <= '0';
        zera_s <= '0';
        wait for 20*clockPeriod;

        -- Conta 70
        grava_s <= '1';
        conta_s <= '1';
        zera_s <= '0';
        wait for 70*clockPeriod;

        -- zera
        grava_s <= '1';
        conta_s <= '1';
        zera_s <= '1';
        wait for 20*clockPeriod;

        -- conta 20
        grava_s <= '1';
        conta_s <= '1';
        zera_s <= '0';
        wait for 20*clockPeriod;

        -- para de contar
        grava_s <= '1';
        conta_s <= '0';
        zera_s <= '0';
        wait for 20*clockPeriod;

        -- conta 20
        grava_s <= '1';
        conta_s <= '1';
        zera_s <= '0';
        wait for 20*clockPeriod;

        -- grava o numero
        Q0_in_s <= "0011";
        Q1_in_s <= "0011";
        Q2_in_s <= "0011";
        Q3_in_s <= "0011";
        grava_s <= '0';
        conta_s <= '1';
        zera_s <= '0';
        wait for 20*clockPeriod;

		clock_enable <= '0'; -- Desabilita clock		
		wait;  -- para a execução do simulador, caso contrário este process é reexecutado indefinidamente.
	end process;
end architecture;