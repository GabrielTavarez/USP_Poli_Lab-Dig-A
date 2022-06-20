library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

ENTITY cronometro IS 
    PORT(
        inicia_b, para_b, reset_b : std_logic;
        clock: in  std_logic;

        display_0 : out std_logic_vector(6 downto 0);
        display_1 : out std_logic_vector(6 downto 0);
        display_2 : out std_logic_vector(6 downto 0);
        display_3 : out std_logic_vector(6 downto 0);
        display_4 : out std_logic_vector(6 downto 0);
        display_5 : out std_logic_vector(6 downto 0)
    );
END cronometro;

architecture cronometro_arch of cronometro is

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

component unidade_de_controle is 
    port(
        inicia_b, para_b, reset_b :in std_logic;
        clock: in  std_logic;
        ativado, reset : out std_logic
    );
end component;

signal Q0_s : std_logic_vector(3 downto 0);
signal Q1_s : std_logic_vector(3 downto 0);
signal Q2_s : std_logic_vector(3 downto 0);
signal Q3_s : std_logic_vector(3 downto 0);
signal Q4_s : std_logic_vector(3 downto 0);
signal Q5_s : std_logic_vector(3 downto 0);

signal ativado_s : std_logic;
signal reset_s : std_logic;

begin

    FD: fluxo_de_dados
    port map(
        clock => clock,
        reset => reset_s,
        ativado => ativado_s,

        Q0 => Q0_s,
        Q1 => Q1_s,
        Q2 => Q2_s,
        Q3 => Q3_s,
        Q4 => Q4_s,
        Q5 => Q5_s,

        display_0 => display_0,
        display_1 => display_1,
        display_2 => display_2,
        display_3 => display_3,
        display_4 => display_4,
        display_5 => display_5
    );

    UC : unidade_de_controle
    port map(
        inicia_b => inicia_b,
        para_b => para_b,
        reset_b => reset_b,
        clock => clock,
        ativado => ativado_s, 
        reset => reset_s
    );


end architecture;