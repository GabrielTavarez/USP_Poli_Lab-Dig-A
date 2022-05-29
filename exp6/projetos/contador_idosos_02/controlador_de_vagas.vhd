-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity controlador_de_vagas is 
    port(
        entra_sai_idosos, entra_sai_normal, conta_idosos, conta_normal : in  std_logic;
        clock, clear : in  std_logic;
        vagas_total, vagas_load: in std_logic_vector (3 downto 0);
        vagas_out_total, vagas_out_idosos : out std_logic_vector (3 downto 0);
        cheio: out std_logic
    );
end controlador_de_vagas;

-- architecture
architecture arch of controlador_de_vagas is
    
    component unidade_de_controle is 
        port(
            entra_sai_idosos, entra_sai_normal, conta_idosos, conta_normal : in  std_logic;
            clock, clear : in  std_logic;
            cheio_dp_sm : in std_logic;
            entra_sai_idosos_sm_dp, entra_sai_normal_sm_dp, conta_idosos_sm_dp, conta_normal_sm_dp, clear_sm_dp: out std_logic
        );
    end component;

    component fluxo_de_dados is
        port (
            clock, clear: in std_logic;
            conta_idosos, conta_normal, entra_sai_normal, entra_sai_idosos, load: in std_logic; 
            vagas_total, vagas_load: in std_logic_vector (3 downto 0);
            vagas_out_total, vagas_out_idosos : out std_logic_vector (3 downto 0); --saídas de vizualização
            cheio_dp_sm: out std_logic; --saida para unidade de controle
            cheio: out std_logic 
        );
    end component;

    signal entra_sai_idosos_sm_dp_s, entra_sai_normal_sm_dp_s, conta_idosos_sm_dp_s, conta_normal_sm_dp_s, clear_sm_dp_s, cheio_dp_sm_s : std_logic;
    
    
begin  
    
    UC: unidade_de_controle port map(
        entra_sai_idosos => entra_sai_idosos,
        entra_sai_normal => entra_sai_normal, 
        conta_idosos => conta_idosos, 
        conta_normal => conta_normal,
        clock => clock, 
        clear => clear,
        cheio_dp_sm => cheio_dp_sm_s,
        entra_sai_idosos_sm_dp => entra_sai_idosos_sm_dp_s, 
        entra_sai_normal_sm_dp => entra_sai_normal_sm_dp_s, 
        conta_idosos_sm_dp => conta_idosos_sm_dp_s, 
        conta_normal_sm_dp => conta_normal_sm_dp_s, 
        clear_sm_dp => clear_sm_dp_s
    );

    FD: fluxo_De_dados port map(
        clock => clock,
        clear => clear,
        conta_idosos => conta_idosos_sm_dp_s,
        conta_normal => conta_normal_sm_dp_s,
        entra_sai_normal => entra_sai_normal_sm_dp_s,
        entra_sai_idosos => entra_sai_idosos_sm_dp_s,
        load => '0',
        vagas_total => vagas_total,
        vagas_load => vagas_load,
        vagas_out_total => vagas_out_total,
        vagas_out_idosos => vagas_out_idosos,
        cheio_dp_sm => cheio_dp_sm_s,
        cheio  => cheio
    );


    end arch;