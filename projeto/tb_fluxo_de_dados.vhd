library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.ceil;
use ieee.math_real.log2;
use ieee.numeric_std.all;

entity tb_fluxo_de_dados is
end tb_fluxo_de_dados;

architecture tb_fluxo_de_dados_arch of tb_fluxo_de_dados is

component fluxo_de_dados IS 
    port(
        clock : in std_logic;
        reset : in std_logic;
        ativado : in std_logic;

        Q0 : out std_logic_vector(3 downto 0);
        Q1 : out std_logic_vector(3 downto 0);
        Q2 : out std_logic_vector(3 downto 0);
        Q3 : out std_logic_vector(3 downto 0);
        Q4 : out std_logic_vector(3 downto 0);
        Q5 : out std_logic_vector(3 downto 0);

        display_0 : out std_logic_vector(6 downto 0);
        display_1 : out std_logic_vector(6 downto 0);
        display_2 : out std_logic_vector(6 downto 0);
        display_3 : out std_logic_vector(6 downto 0);
        display_4 : out std_logic_vector(6 downto 0);
        display_5 : out std_logic_vector(6 downto 0)

    );
end component;

	constant clockPeriod: time := 2 ns; -- periodo do clock
	
	signal clock_in: std_logic := '0';
	signal reset_in: std_logic := '0';
	signal ativado_in: std_logic;
	signal clock_enable : std_logic := '0';

    signal Q0_s, Q1_s, Q2_s, Q3_s, Q4_s, Q5_s : std_logic_vector(3 downto 0);
begin
	DUT: fluxo_de_dados
        port map(
            clock => clock_in,
            reset => reset_in,
            ativado => ativado_in,
            Q0 => Q0_s,
            Q1 => Q1_s,
            Q2 => Q2_s,
            Q3 => Q3_s,
            Q4 => Q4_s,
            Q5 => Q5_s
        );
	
    clock_in <= (clock_enable and (not clock_in)) after clockPeriod/2;
	
	estimulos: process is
	begin
        clock_enable <= '1';
        ativado_in <= '1';
        wait for 70000*clockPeriod;

        reset_in <= '1';
        wait for 2*clockPeriod;
        reset_in <= '0';

        wait for 20*clockPeriod;

        clock_enable <= '0';
        wait for 10*clockPeriod;
        clock_enable <= '1';

        wait for 20*clockPeriod;

		clock_enable <= '0'; -- Desabilita clock		
		wait;  -- para a execução do simulador, caso contrário este process é reexecutado indefinidamente.
	end process;
end architecture;