-- contador e sinalizador de vagas
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity fluxo_de_dados is
    port (
        clock, clear: in std_logic;
        conta_idosos, conta_normal, entra_sai_normal, entra_sai_idosos: in std_logic; 
        vagas_total_geral, vagas_total_idosos : in std_logic_vector (3 downto 0);
		vagas_ocupadas_normal, vagas_ocupadas_idosos : out std_logic_vector (3 downto 0); --saídas de vizualização
        cheio_idosos, cheio_normal, cheio_geral: out std_logic 
    );
end fluxo_de_dados;

architecture arch of fluxo_de_dados is 

component comparador is
    port (
        A, B: in std_logic_vector (3 downto 0); 
        maior_igual: out std_logic
    );
end component comparador;

component up_down is
    port ( --zera assíncrono
        clock, zera, conta, entra_sai: in std_logic;
        contagem: out std_logic_vector (3 downto 0)
    );
end component up_down;



signal vagas_total_s, vagas_ocupadas_idosos_s, vagas_ocupadas_normal_s, vagas_normal_s : std_logic_vector (3 downto 0);
signal entra_sai_total_s, conta_total_s, conta_idosos_s : std_logic;
signal cheio_idosos_s, cheio_normal_s : std_logic;
signal vagas_usadas_geral_integer_s: integer range 0 to 15 := 0; 


begin

	 entra_sai_total_s <= entra_sai_idosos OR entra_sai_normal;
	 conta_total_s <= (conta_idosos OR conta_normal);
	 conta_idosos_s <= conta_idosos;

    cont_idosos: up_down port map (
       clock    => clock,
       zera     => clear,
       conta    => conta_idosos_s, 
       entra_sai    => entra_sai_idosos,
       contagem => vagas_ocupadas_idosos_s
    );
	 
	 cont_normal: up_down port map (
       clock    => clock,
       zera     => clear,
       conta    => conta_normal, 
       entra_sai    => entra_sai_normal,
       contagem => vagas_ocupadas_normal_s
    );
	 
    comp_idosos: comparador  port map (
        A     => vagas_ocupadas_idosos_s,
        B     => vagas_total_idosos,
        maior_igual => cheio_idosos_s
    );
	

    vagas_normal_s <= std_logic_vector(to_unsigned(to_integer(unsigned(vagas_total_geral)) - to_integer(unsigned(vagas_total_idosos)), 4));
    
    comp_normal: comparador  port map (
        A     => vagas_ocupadas_normal_s,
        B     => vagas_normal_s,
        maior_igual => cheio_normal_s
        );
        
    cheio_normal <= cheio_normal_s;
    cheio_idosos <= cheio_idosos_s;
    cheio_geral <= cheio_normal_s AND cheio_idosos_s;	
    vagas_ocupadas_normal <= vagas_ocupadas_normal_s;
	vagas_ocupadas_idosos <= vagas_ocupadas_idosos_s;
	 
end arch;
