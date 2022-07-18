library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fluxo_de_dados IS 
    generic(
        max : integer := 15
    );
    port(
        clock : in std_logic;
        grava, conta, zera : in std_logic;
        Q0_in, Q1_in, Q2_in, Q3_in : in std_logic_vector(3 downto 0);
        Q0_out, Q1_out, Q2_out, Q3_out : out std_logic_vector(3 downto 0)
    );
end fluxo_de_dados;

architecture fluxo_de_dados_arch of fluxo_de_dados is

component contador IS 
    generic(
        max : integer := 15
    );
    port(
        clock : in std_logic;
        load_n : in std_logic;
        Q_in : in std_logic_vector(3 downto 0);
        Q : out std_logic_vector(3 downto 0);
        reset_n : in std_logic
    );
end component;

component comparador IS 
    port(
        A, B : in std_logic_vector(3 downto 0);
        AeB, AgB, AlB : out std_logic
    );
end component;

signal clock0_s, clock1_s, clock2_s, clock3_s: std_logic;
signal reset_s, grava_s : std_logic;
signal reset_0_s, reset_1_s, reset_2_s, reset_3_s : std_logic := '1';
signal f_0, f_1, f_2, f_3 : std_logic;
signal Q0_s, Q1_s, Q2_s, Q3_s : std_logic_vector(3 downto 0);
signal Q0_in_s, Q1_in_s, Q2_in_s, Q3_in_s : std_logic_vector(3 downto 0);

begin

    cont_0 : contador port map(
        clock => clock0_s,
        Q => Q0_s,
        Q_in => Q0_in_s,
        load_n => grava_s,
        reset_n => reset_0_s
    );

    comp_0 : comparador port map(
        A => Q0_s,
        B => "1001",
        AeB => f_0
    );

    cont_1 : contador port map(
        clock => clock1_s,
        Q => Q1_s,
        Q_in => Q1_in,
        load_n => grava_s,
        reset_n => reset_1_s
    );

    comp_1 : comparador port map(
        A => Q1_s,
        B => "1001",
        AeB => f_1
    );

    cont_2 : contador port map(
        clock => clock2_s,
        Q => Q2_s,
        Q_in => Q2_in,
        load_n => grava_s,
        reset_n => reset_2_s
    );

    comp_2 : comparador port map(
        A => Q2_s,
        B => "1001",
        AeB => f_2
    );

    cont_3 : contador port map(
        clock => clock3_s,
        Q => Q3_s,
        Q_in => Q3_in,
        load_n => grava_s,
        reset_n => reset_3_s
    );

    comp_3 : comparador port map(
        A => Q3_s,
        B => "1001",
        AeB => f_3
    );



    clock0_s <= (clock and conta) or reset_s;
    clock1_s <= (clock0_s and f_0) or reset_s;
    clock2_s <= (clock1_s and f_1) or reset_s;
    clock3_s <= (clock2_s and f_2) or reset_s;

    reset_0_s <= not(reset_s or f_0);
    reset_1_s <= not(reset_s or f_1);
    reset_2_s <= not(reset_s or f_2);
    reset_3_s <= not(reset_s or f_3);

    Q0_out <= Q0_s;
    Q1_out <= Q1_s;
    Q2_out <= Q2_s;
    Q3_out <= Q3_s;

    reset_s <= zera;
    grava_s <= grava;

end architecture;