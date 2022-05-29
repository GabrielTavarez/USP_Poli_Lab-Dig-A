-- contador e sinalizador de vagas
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity controlador_vagas is
    port (
        clock, clear, conta_normal, conta_idosos, entra_sai_normal, entra_sai_idosos, load: in std_logic; 
        vagas_total, vagas_load: in std_logic_vector (3 downto 0);
        vagas_out_total, vagas_out_idosos : out std_logic_vector (3 downto 0);
        cheio: out std_logic 
    );
end controlador_vagas;

architecture arch of controlador_vagas is 

component comparador is
    port (
        A, B: in std_logic_vector (3 downto 0); 
        igual: out std_logic
    );
end component comparador;

component up_down is
    port (
        clock, zera, conta, carrega, entra_sai: in std_logic;
        entrada: in std_logic_vector (3 downto 0);
        contagem: out std_logic_vector (3 downto 0)
    );
end component up_down;
--
signal vagas_total_s, vagas_idosos_s: std_logic_vector (3 downto 0);
signal conta_total_s, entra_sai_total_s : std_logic;

begin	 

    conta_total_s <= conta_normal OR conta_idosos;
    entra_sai_total_s <= entra_sai_normal OR entra_sai_idosos;

    contador_total: up_down port map (
        clock    => clock,
        zera     => clear,
        conta    => conta_total_s, 
        carrega  => load,
        entra_sai    => entra_sai_total_s,
        entrada  => vagas_load,
        contagem => vagas_total_s
    );

    contador_idosos: up_down port map (
        clock    => clock,
        zera     => clear,
        conta    => conta_idosos, 
        carrega  => load,
        entra_sai    => entra_sai_idosos,
        entrada  => vagas_load,
        contagem => vagas_idosos_s
    );      


    comp: comparador  port map (
        A     => vagas_total_s,
        B     => vagas_total,
        igual => cheio
    );


end arch;

    