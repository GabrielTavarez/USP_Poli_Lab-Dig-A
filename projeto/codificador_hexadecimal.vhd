library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

ENTITY codificador_hexadecimal IS 
    PORT(
        entrada_bin : in std_logic_vector(3 downto 0);
        saida_hexa : out std_logic_vector(6 downto 0)
    );
END codificador_hexadecimal;

ARCHITECTURE codificador_hexadecimal_arch of codificador_hexadecimal is

begin

    PROCESS (entrada_bin)
    begin
        CASE entrada_bin is
            WHEN "0000" =>
                saida_hexa <= "0000001";
            WHEN "0001" =>
                saida_hexa <= "1001111";
            WHEN "0010" =>
                saida_hexa <= "0010010";
            WHEN "0011" =>
                saida_hexa <= "0000110";
            WHEN "0100" =>
                saida_hexa <= "1001100";
            WHEN "0101" =>
                saida_hexa <= "0100100";
            WHEN "0110" =>
                saida_hexa <= "0100000";
            WHEN "0111" =>
                saida_hexa <= "0001111";
            WHEN "1000" =>
                saida_hexa <= "0000000";
            WHEN "1001" =>
                saida_hexa <= "0001100";
            WHEN "1010" =>
                saida_hexa <= "0001000";
            WHEN "1011" =>
                saida_hexa <= "1100000";
            WHEN "1100" =>
                saida_hexa <= "0110001";
            WHEN "1101" =>
                saida_hexa <= "1000010";
            WHEN "1110" =>
                saida_hexa <= "0110000";
            WHEN "1111" =>
                saida_hexa <= "0111000";
            WHEN others =>
                saida_hexa <= "1111111";
        END CASE; 
    END PROCESS;

END ARCHITECTURE;


