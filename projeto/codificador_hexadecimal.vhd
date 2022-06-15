library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

ENTITY codificador_hexadecimal IS 
    PORT(
        entrada_bin : in std_logic_vector(3 downto 0);
        saida_hexa : out std_logic_vector(6 downto 0);
    );
END codificador_hexadecimal;

ARCHITECTURE codificador_hexadecimal_arch of codificador_hexadecimal is

begin

    PROCESS (entrada_bin)
        CASE entrada_bin is
            WHEN entrada_bin = "000"
                saida_hexa <= "";
            WHEN entrada_bin = "000"
                saida_hexa <= "";
            WHEN entrada_bin = "000"
                saida_hexa <= "";
            WHEN entrada_bin = "000"
                saida_hexa <= "";
            WHEN entrada_bin = "000"
                saida_hexa <= "";
            WHEN entrada_bin = "000"
                saida_hexa <= "";
            WHEN entrada_bin = "000"
                saida_hexa <= "";
            WHEN entrada_bin = "000"
                saida_hexa <= "";
            WHEN entrada_bin = "000"
                saida_hexa <= "";
        END CASE;
    END PROCESS;

END ARCHITECTURE;


