library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.ceil;
use ieee.math_real.log2;
use ieee.numeric_std.all;
entity tb_contador is
end tb_contador;

architecture tb_contador_arch of tb_contador is


component contador is 
    generic(
        max : integer := 15
    );
    port(
        clock : in std_logic;
        Q : out std_logic_vector(3 downto 0);
        full : out std_logic;
        reset : in std_logic
    );
end component;
	
	signal clock_in: std_logic := '0';
	signal reset_in: std_logic := '0';
	constant clockPeriod: time := 2 ns; -- periodo do clock
	signal clock_enable : std_logic := '0';

    signal full_s : STD_LOGIC;
    signal Q_s : std_logic_vector(3 downto 0);
begin
	DUT: contador 
    generic map(
        max => 9
    )
    port map(
        clock => clock_in,
        reset => reset_in,
        full => full_s,
        Q => Q_s
    );
	
    clock_in <= (clock_enable and (not clock_in)) after clockPeriod/2;
	
	estimulos: process is
	begin
        clock_enable <= '1';
        wait for 20*clockPeriod;

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