-- contador e sinalizador de vagas
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity controlador_vagas is
    port (
        clock, clear, conta, entra_sai, load: in std_logic; 
        vagas_total, vagas_load: in std_logic_vector (3 downto 0);
        cheio: out std_logic 
    );
end controlador_vagas;

architecture arch of controlador_vagas is 

component comparador is
    port (
        A, B: in std_logic_vector (1 downto 0); 
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
signal cont1, cont2, vagas1, vagas2: std_logic_vector(1 downto 0);
signal cont: std_logic_vector (3 downto 0);
signal cheio1, cheio2 : std_logic; 

begin

    cont1  <= cont(1 downto 0);
    cont2  <= cont(3 downto 2);
    vagas1 <= vagas_total(1 downto 0);
    vagas2 <= vagas_total(3 downto 2);
	 

    contador: up_down port map (
       clock    => clock,
       zera     => clear,
       conta    => conta, 
       carrega  => load,
       entra_sai    => entra_sai,
       entrada  => vagas_load,
       contagem => cont
    );
    comp1: comparador  port map (
        A     => cont1,
        B     => vagas1,
        igual => cheio1
    );

    comp2: comparador port map (
        A     => cont2,
        B     => vagas2,
        igual => cheio2
    );

    cheio <= cheio1 and cheio2;

end arch;

    