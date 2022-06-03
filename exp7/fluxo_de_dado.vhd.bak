-- contador e sinalizador de vagas
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity fluxo_de_dados is
    port (
        clock, reset: in std_logic;
        proximo: in std_logic;
        produto_configurado, setor_configurado: in std_logic_vector(1 downto 0); 
        produto_lido, setor_lido: in std_logic_vector(1 downto 0); 
		setor_determinado : out std_logic_vector (1 downto 0);
        acionamento_setor: out std_logic
    );
end fluxo_de_dados;

architecture arch of fluxo_de_dados is 

component flipflop is
    port (
        clock: in std_logic;
        reset: in std_logic;
        D: in std_logic;
        Q: out std_logic;
        Qn: out std_logic
    );
end component flipflop;

component comparador is
    generic(
	tamanho : natural := 2
	);
    port (
        A, B: in std_logic_vector (tamanho downto 0); 
        maior: out STD_LOGIC;
        igual: out std_logic;
        menor: out std_logic
    );
end component;


signal config_igual_lido_s, vagas_idosos_s : std_logic;


begin

    comp: comparador 
        generic map(
            tamanho =>  2
        )
        port map(
            A => produto_configurado,
            B => produto_lido,
            igual => config_igual_lido_s
        );
    
	 ff: flipflop
        port map(
            D => config_igual_lido_s,
            Q => acionamento_setor,
            clock => clock,
            reset => reset
        );
    
    setor_determinado <= setor_configurado;
end arch;
