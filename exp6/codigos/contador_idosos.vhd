-- contador e sinalizador de vagas
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity controlador_vagas is
    port (
        clock, clear, conta, entra_sai, load, entra_sai_idosos: in std_logic; 
        vagas_total, vagas_load: in std_logic_vector (3 downto 0);
        cheio: out std_logic 
    );
end controlador_vagas;

architecture arch of controlador_vagas is 

component comparador is
    port (
        A, B: in std_logic_vector (3 downto 0); 
        maior_igual: out std_logic
    );
end component comparador;

component up_down is
    port (
        clock, zera, conta, carrega, entra_sai: in std_logic;
        
        entrada: in std_logic_vector (3 downto 0);
        contagem: out std_logic_vector (3 downto 0)
    );
end component up_down;

signal cont: std_logic_vector (3 downto 0);


begin

    contador: up_down port map (
       clock    => clock;
       zera     => clear;
       conta    => conta; 
       carrega  => load;
       entra    => entra_sai;
       entrada  => vagas_load;
       contagem => cont
    );
    comp1: comparador  port map (
        A     => cont;
        B     => vagas;
        igual => cheio
    );

end arch;
