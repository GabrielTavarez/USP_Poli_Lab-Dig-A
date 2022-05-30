-- contador e sinalizador de vagas
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity fluxo_de_dados is
    port (
        clock, clear: in std_logic;
        conta_idosos, conta_normal, entra_sai_normal, entra_sai_idosos, load: in std_logic; 
        vagas_total, vagas_load: in std_logic_vector (3 downto 0);
		vagas_out_total, vagas_out_idosos : out std_logic_vector (3 downto 0); --saídas de vizualização
        cheio_dp_sm: out std_logic; --saida para unidade de controle
        cheio: out std_logic 
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
        clock, zera, conta, carrega, entra_sai: in std_logic;
        
        entrada: in std_logic_vector (3 downto 0);
        contagem: out std_logic_vector (3 downto 0)
    );
end component up_down;



signal vagas_total_s, vagas_idosos_s : std_logic_vector (3 downto 0);
signal entra_sai_total_s, conta_total_s, conta_idosos_s, cheio_s : std_logic;


begin

	 entra_sai_total_s <= entra_sai_idosos OR entra_sai_normal;
	 conta_total_s <= (conta_idosos OR conta_normal);
	 conta_idosos_s <= conta_idosos;

    cont_idosos: up_down port map (
       clock    => clock,
       zera     => clear,
       conta    => conta_idosos_s, 
       carrega  => load,
       entra_sai    => entra_sai_idosos,
       entrada  => vagas_load,
       contagem => vagas_idosos_s
    );
	 
	 cont_total: up_down port map (
       clock    => clock,
       zera     => clear,
       conta    => conta_total_s, 
       carrega  => load,
       entra_sai    => entra_sai_total_s,
       entrada  => vagas_load,
       contagem => vagas_total_s
    );
	 
    comp1: comparador  port map (
        A     => vagas_total_s,
        B     => vagas_total,
        maior_igual => cheio_s
    );
	 
	 
	 vagas_out_total <= vagas_total_s;
	 vagas_out_idosos <= vagas_idosos_s;
	 cheio <= cheio_s;
	 cheio_dp_sm <= cheio_s;
	 
end arch;
