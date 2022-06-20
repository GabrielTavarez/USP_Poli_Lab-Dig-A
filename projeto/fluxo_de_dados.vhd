library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fluxo_de_dados IS 
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
end fluxo_de_dados;

architecture fluxo_de_dados_arch of fluxo_de_dados is

component contador IS 
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

component codificador_hexadecimal IS 
    PORT(
        entrada_bin : in std_logic_vector(3 downto 0);
        saida_hexa : out std_logic_vector(6 downto 0)
    );
END component;


signal Q0_s, Q1_s, Q2_s, Q3_s, Q4_s, Q5_s : std_logic_vector(3 downto 0);
signal full0_s, full1_s, full2_s, full3_s, full4_s, full5_s : std_logic;

signal clock_cont_0_s : std_logic;

begin

    clock_cont_0_s <= clock AND ativado;

    cont_0 : contador
        generic map(
            max => 9
        )
        port map(
            clock => clock_cont_0_s,
            Q => Q0_s,
            full => full0_s,
            reset => reset
        );
    cod_0 : codificador_hexadecimal port map(
        entrada_bin => Q0_s,
        saida_hexa => display_0
    );

    cont_1 : contador
        generic map(
            max => 9
        )
        port map(
            clock => full0_s,
            Q => Q1_s,
            full => full1_s,
            reset => reset
        );
    cod_1 : codificador_hexadecimal port map(
        entrada_bin => Q1_s,
        saida_hexa => display_1
    );

    cont_2 : contador
        generic map(
            max => 9
        )
        port map(
            clock => full1_s,
            Q => Q2_s,
            full => full2_s,
            reset => reset
        );
    cod_2 : codificador_hexadecimal port map(
        entrada_bin => Q2_s,
        saida_hexa => display_2
    );

    cont_3 : contador
        generic map(
            max => 5
        )
        port map(
            clock => full2_s,
            Q => Q3_s,
            full => full3_s,
            reset => reset
        );
    cod_3 : codificador_hexadecimal port map(
        entrada_bin => Q3_s,
        saida_hexa => display_3
    );

    cont_4 : contador
        generic map(
            max => 9
        )
        port map(
            clock => full3_s,
            Q => Q4_s,
            full => full4_s,
            reset => reset
        );
    cod_4 : codificador_hexadecimal port map(
        entrada_bin => Q4_s,
        saida_hexa => display_4
    );

    cont_5 : contador
        generic map(
            max => 5
        )
        port map(
            clock => full4_s,
            Q => Q5_s,
            full => full5_s,
            reset => reset
        );
    cod_5 : codificador_hexadecimal port map(
        entrada_bin => Q5_s,
        saida_hexa => display_5
    );


    Q0 <= Q0_s;
    Q1 <= Q1_s;
    Q2 <= Q2_s;
    Q3 <= Q3_s;
    Q4 <= Q4_s;
    Q5 <= Q5_s;


end architecture;


