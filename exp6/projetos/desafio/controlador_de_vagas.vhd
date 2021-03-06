-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity controlador_de_vagas is 
    port(
        entra_sai_idosos, entra_sai_normal, conta_idosos, conta_normal : in  std_logic;
        clock, clear : in  std_logic;
        vagas_total_geral, vagas_total_idosos: in std_logic_vector (3 downto 0);
        vagas_ocupadas_normal, vagas_ocupadas_idosos : out std_logic_vector (3 downto 0);
        cheio_geral: out std_logic;
        entra_sai_idosos_sm_dp, entra_sai_normal_sm_dp, conta_idosos_sm_dp, conta_normal_sm_dp, clear_sm_dp, cheio_normal_dp_sm, cheio_idosos_dp_sm : out std_logic
		  
    );
end controlador_de_vagas;

-- architecture
architecture arch of controlador_de_vagas is
    
    component unidade_de_controle is 
        port(
            entra_sai_idosos, entra_sai_normal, conta_idosos, conta_normal : in  std_logic;
            clock, clear : in  std_logic;
            cheio_idosos, cheio_normal : in std_logic;
            entra_sai_idosos_sm_dp, entra_sai_normal_sm_dp, conta_idosos_sm_dp, conta_normal_sm_dp, clear_sm_dp: out std_logic
        );
    end component;

    component fluxo_de_dados is
        port (
            clock, clear: in std_logic;
            conta_idosos, conta_normal, entra_sai_normal, entra_sai_idosos: in std_logic; 
            vagas_total_geral, vagas_total_idosos : in std_logic_vector (3 downto 0);
            vagas_ocupadas_normal, vagas_ocupadas_idosos : out std_logic_vector (3 downto 0); --saídas de vizualização
            cheio_idosos, cheio_normal, cheio_geral: out std_logic  
        );
    end component;

    signal entra_sai_idosos_sm_dp_s, entra_sai_normal_sm_dp_s, conta_idosos_sm_dp_s, conta_normal_sm_dp_s: std_logic;
    signal clear_sm_dp_s : std_logic;
    signal cheio_normal_dp_sm_s, cheio_idosos_dp_sm_s : std_logic;
    signal nclear_s: std_logic;
    
begin  
    
	 nclear_s <= NOT(clear);
	 
    UC: unidade_de_controle port map(
        entra_sai_idosos => entra_sai_idosos,
        entra_sai_normal => entra_sai_normal, 
        conta_idosos => NOT(conta_idosos), 
        conta_normal => NOT(conta_normal),
        clock => clock, 
        clear => nclear_s,
        cheio_idosos => cheio_idosos_dp_sm_s,
        cheio_normal => cheio_normal_dp_sm_s,
        entra_sai_idosos_sm_dp => entra_sai_idosos_sm_dp_s, 
        entra_sai_normal_sm_dp => entra_sai_normal_sm_dp_s, 
        conta_idosos_sm_dp => conta_idosos_sm_dp_s, 
        conta_normal_sm_dp => conta_normal_sm_dp_s, 
        clear_sm_dp => clear_sm_dp_s
    );

    FD: fluxo_De_dados port map(
        clock => NOT(clock),
        clear => nclear_s,
        conta_idosos => conta_idosos_sm_dp_s,
        conta_normal => conta_normal_sm_dp_s,
        entra_sai_normal => entra_sai_normal_sm_dp_s,
        entra_sai_idosos => entra_sai_idosos_sm_dp_s,
        vagas_total_geral => vagas_total_geral,
        vagas_total_idosos => vagas_total_idosos,
        vagas_ocupadas_normal => vagas_ocupadas_normal, 
        vagas_ocupadas_idosos => vagas_ocupadas_idosos,
        cheio_idosos => cheio_idosos_dp_sm_s, 
        cheio_normal => cheio_normal_dp_sm_s, 
        cheio_geral => cheio_geral
    );

    entra_sai_idosos_sm_dp <= entra_sai_idosos_sm_dp_s;
    entra_sai_normal_sm_dp <= entra_sai_normal_sm_dp_s;
    conta_idosos_sm_dp <= conta_idosos_sm_dp_s;
    conta_normal_sm_dp <= conta_normal_sm_dp_s;
    clear_sm_dp <= clear_sm_dp_s;
    cheio_normal_dp_sm <= cheio_normal_dp_sm_s;
    cheio_idosos_dp_sm <= cheio_idosos_dp_sm_s;

end arch;