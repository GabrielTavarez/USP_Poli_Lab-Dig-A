library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity relogio IS 
    generic(
        max : integer := 15
    );
    port(
        clock : in std_logic;
        programa_s, clear_b, grava_b, inibe_b : in std_logic;
        Q0_in, Q1_in, Q2_in, Q3_in : in std_logic_vector(3 downto 0);
        Q0_out, Q1_out, Q2_out, Q3_out : out std_logic_vector(3 downto 0)
    );
end relogio;

architecture relogio_arch of relogio is

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

component unidade_de_controle is 
    port(
        clock : std_logic;
        programa_s, clear_b, grava_b, inibe_b : in std_logic;
        grava, conta, zera : out std_logic
    );
end component;

signal grava_s, conta_s, zera_s : std_logic;


begin

    FD: fluxo_de_dados port map(
        clock => clock,
        grava => grava_s,
        conta => conta_s,
        zera => zera_s,
        Q0_in => Q0_in,
        Q1_in => Q1_in,
        Q2_in => Q2_in,
        Q3_in => Q3_in,
        Q0_out => Q0_out,
        Q1_out => Q1_out,
        Q2_out => Q2_out,
        Q3_out => Q3_out
    );

    UC: unidade_de_controle port map(
        clock => clock,
        programa_s => programa_s,
        clear_b => clear_b,
        grava_b => grava_b,
        inibe_b => inibe_b,
        grava => grava_s,
        conta => conta_s,
        zera => zera_s
    );

    

end architecture;