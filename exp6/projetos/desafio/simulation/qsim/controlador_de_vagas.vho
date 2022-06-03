-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "05/30/2022 17:53:14"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	controlador_de_vagas IS
    PORT (
	entra_sai_idosos : IN std_logic;
	entra_sai_normal : IN std_logic;
	conta_idosos : IN std_logic;
	conta_normal : IN std_logic;
	clock : IN std_logic;
	clear : IN std_logic;
	vagas_total_geral : IN std_logic_vector(3 DOWNTO 0);
	vagas_total_idosos : IN std_logic_vector(3 DOWNTO 0);
	vagas_ocupadas_normal : OUT std_logic_vector(3 DOWNTO 0);
	vagas_ocupadas_idosos : OUT std_logic_vector(3 DOWNTO 0);
	cheio_geral : OUT std_logic;
	entra_sai_idosos_sm_dp : OUT std_logic;
	entra_sai_normal_sm_dp : OUT std_logic;
	conta_idosos_sm_dp : OUT std_logic;
	conta_normal_sm_dp : OUT std_logic;
	clear_sm_dp : OUT std_logic;
	cheio_normal_dp_sm : OUT std_logic;
	cheio_idosos_dp_sm : OUT std_logic
	);
END controlador_de_vagas;

-- Design Ports Information
-- vagas_ocupadas_normal[0]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_ocupadas_normal[1]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_ocupadas_normal[2]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_ocupadas_normal[3]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_ocupadas_idosos[0]	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_ocupadas_idosos[1]	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_ocupadas_idosos[2]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_ocupadas_idosos[3]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cheio_geral	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entra_sai_idosos_sm_dp	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entra_sai_normal_sm_dp	=>  Location: PIN_Y9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- conta_idosos_sm_dp	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- conta_normal_sm_dp	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clear_sm_dp	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cheio_normal_dp_sm	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cheio_idosos_dp_sm	=>  Location: PIN_P7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total_idosos[1]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total_idosos[0]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total_idosos[3]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total_idosos[2]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entra_sai_idosos	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entra_sai_normal	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clear	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total_geral[3]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total_geral[2]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total_geral[0]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total_geral[1]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- conta_idosos	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- conta_normal	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF controlador_de_vagas IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_entra_sai_idosos : std_logic;
SIGNAL ww_entra_sai_normal : std_logic;
SIGNAL ww_conta_idosos : std_logic;
SIGNAL ww_conta_normal : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_clear : std_logic;
SIGNAL ww_vagas_total_geral : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_vagas_total_idosos : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_vagas_ocupadas_normal : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_vagas_ocupadas_idosos : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_cheio_geral : std_logic;
SIGNAL ww_entra_sai_idosos_sm_dp : std_logic;
SIGNAL ww_entra_sai_normal_sm_dp : std_logic;
SIGNAL ww_conta_idosos_sm_dp : std_logic;
SIGNAL ww_conta_normal_sm_dp : std_logic;
SIGNAL ww_clear_sm_dp : std_logic;
SIGNAL ww_cheio_normal_dp_sm : std_logic;
SIGNAL ww_cheio_idosos_dp_sm : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \entra_sai_normal~input_o\ : std_logic;
SIGNAL \FD|cont_normal|IQ~1_combout\ : std_logic;
SIGNAL \clear~input_o\ : std_logic;
SIGNAL \conta_normal~input_o\ : std_logic;
SIGNAL \vagas_total_geral[3]~input_o\ : std_logic;
SIGNAL \vagas_total_idosos[3]~input_o\ : std_logic;
SIGNAL \vagas_total_idosos[2]~input_o\ : std_logic;
SIGNAL \vagas_total_geral[2]~input_o\ : std_logic;
SIGNAL \vagas_total_geral[1]~input_o\ : std_logic;
SIGNAL \vagas_total_idosos[1]~input_o\ : std_logic;
SIGNAL \vagas_total_idosos[0]~input_o\ : std_logic;
SIGNAL \vagas_total_geral[0]~input_o\ : std_logic;
SIGNAL \FD|vagas_normal_s[0]~10\ : std_logic;
SIGNAL \FD|vagas_normal_s[0]~11\ : std_logic;
SIGNAL \FD|vagas_normal_s[1]~14\ : std_logic;
SIGNAL \FD|vagas_normal_s[1]~15\ : std_logic;
SIGNAL \FD|vagas_normal_s[2]~6\ : std_logic;
SIGNAL \FD|vagas_normal_s[2]~7\ : std_logic;
SIGNAL \FD|vagas_normal_s[3]~1_sumout\ : std_logic;
SIGNAL \FD|vagas_normal_s[2]~5_sumout\ : std_logic;
SIGNAL \FD|vagas_normal_s[0]~9_sumout\ : std_logic;
SIGNAL \FD|vagas_normal_s[1]~13_sumout\ : std_logic;
SIGNAL \FD|comp_normal|maior_igual~2_combout\ : std_logic;
SIGNAL \UC|Selector2~0_combout\ : std_logic;
SIGNAL \conta_idosos~input_o\ : std_logic;
SIGNAL \entra_sai_idosos~input_o\ : std_logic;
SIGNAL \FD|cont_idosos|IQ~2_combout\ : std_logic;
SIGNAL \FD|comp_idosos|maior_igual~2_combout\ : std_logic;
SIGNAL \FD|comp_idosos|maior_igual~1_combout\ : std_logic;
SIGNAL \FD|comp_idosos|maior_igual~3_combout\ : std_logic;
SIGNAL \UC|Selector3~0_combout\ : std_logic;
SIGNAL \UC|CurrentState.inc_idosos~q\ : std_logic;
SIGNAL \FD|cont_idosos|IQ~1_combout\ : std_logic;
SIGNAL \FD|cont_idosos|IQ~3_combout\ : std_logic;
SIGNAL \FD|cont_idosos|IQ~0_combout\ : std_logic;
SIGNAL \FD|comp_idosos|maior_igual~0_combout\ : std_logic;
SIGNAL \UC|Selector3~1_combout\ : std_logic;
SIGNAL \FD|comp_normal|LessThan0~1_combout\ : std_logic;
SIGNAL \FD|comp_normal|maior_igual~0_combout\ : std_logic;
SIGNAL \UC|Selector4~1_combout\ : std_logic;
SIGNAL \UC|update_next_state~0_combout\ : std_logic;
SIGNAL \UC|Selector2~1_combout\ : std_logic;
SIGNAL \UC|CurrentState.espera~q\ : std_logic;
SIGNAL \FD|comp_normal|maior_igual~3_combout\ : std_logic;
SIGNAL \UC|Selector4~0_combout\ : std_logic;
SIGNAL \UC|CurrentState.inc_normal~q\ : std_logic;
SIGNAL \FD|cont_normal|IQ~2_combout\ : std_logic;
SIGNAL \FD|cont_normal|IQ~3_combout\ : std_logic;
SIGNAL \FD|cont_normal|IQ~0_combout\ : std_logic;
SIGNAL \FD|comp_normal|maior_igual~1_combout\ : std_logic;
SIGNAL \FD|comp_normal|LessThan0~0_combout\ : std_logic;
SIGNAL \FD|cheio_geral~combout\ : std_logic;
SIGNAL \UC|CurrentState.zera_vagas~feeder_combout\ : std_logic;
SIGNAL \UC|CurrentState.zera_vagas~q\ : std_logic;
SIGNAL \FD|cont_normal|IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \FD|cont_idosos|IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \ALT_INV_conta_normal~input_o\ : std_logic;
SIGNAL \ALT_INV_conta_idosos~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total_geral[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total_geral[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total_geral[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total_geral[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_entra_sai_normal~input_o\ : std_logic;
SIGNAL \ALT_INV_entra_sai_idosos~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total_idosos[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total_idosos[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total_idosos[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total_idosos[1]~input_o\ : std_logic;
SIGNAL \UC|ALT_INV_Selector4~1_combout\ : std_logic;
SIGNAL \FD|comp_normal|ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \UC|ALT_INV_Selector2~0_combout\ : std_logic;
SIGNAL \UC|ALT_INV_Selector3~1_combout\ : std_logic;
SIGNAL \UC|ALT_INV_update_next_state~0_combout\ : std_logic;
SIGNAL \UC|ALT_INV_CurrentState.espera~q\ : std_logic;
SIGNAL \FD|comp_idosos|ALT_INV_maior_igual~3_combout\ : std_logic;
SIGNAL \FD|comp_normal|ALT_INV_maior_igual~3_combout\ : std_logic;
SIGNAL \FD|comp_normal|ALT_INV_maior_igual~2_combout\ : std_logic;
SIGNAL \UC|ALT_INV_CurrentState.zera_vagas~q\ : std_logic;
SIGNAL \UC|ALT_INV_CurrentState.inc_normal~q\ : std_logic;
SIGNAL \UC|ALT_INV_CurrentState.inc_idosos~q\ : std_logic;
SIGNAL \FD|comp_idosos|ALT_INV_maior_igual~2_combout\ : std_logic;
SIGNAL \FD|comp_idosos|ALT_INV_maior_igual~1_combout\ : std_logic;
SIGNAL \FD|comp_normal|ALT_INV_maior_igual~1_combout\ : std_logic;
SIGNAL \FD|comp_normal|ALT_INV_maior_igual~0_combout\ : std_logic;
SIGNAL \FD|comp_idosos|ALT_INV_maior_igual~0_combout\ : std_logic;
SIGNAL \FD|comp_normal|ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \FD|cont_idosos|ALT_INV_IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \FD|cont_normal|ALT_INV_IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \FD|ALT_INV_vagas_normal_s[1]~13_sumout\ : std_logic;
SIGNAL \FD|ALT_INV_vagas_normal_s[0]~9_sumout\ : std_logic;
SIGNAL \FD|ALT_INV_vagas_normal_s[2]~5_sumout\ : std_logic;
SIGNAL \FD|ALT_INV_vagas_normal_s[3]~1_sumout\ : std_logic;

BEGIN

ww_entra_sai_idosos <= entra_sai_idosos;
ww_entra_sai_normal <= entra_sai_normal;
ww_conta_idosos <= conta_idosos;
ww_conta_normal <= conta_normal;
ww_clock <= clock;
ww_clear <= clear;
ww_vagas_total_geral <= vagas_total_geral;
ww_vagas_total_idosos <= vagas_total_idosos;
vagas_ocupadas_normal <= ww_vagas_ocupadas_normal;
vagas_ocupadas_idosos <= ww_vagas_ocupadas_idosos;
cheio_geral <= ww_cheio_geral;
entra_sai_idosos_sm_dp <= ww_entra_sai_idosos_sm_dp;
entra_sai_normal_sm_dp <= ww_entra_sai_normal_sm_dp;
conta_idosos_sm_dp <= ww_conta_idosos_sm_dp;
conta_normal_sm_dp <= ww_conta_normal_sm_dp;
clear_sm_dp <= ww_clear_sm_dp;
cheio_normal_dp_sm <= ww_cheio_normal_dp_sm;
cheio_idosos_dp_sm <= ww_cheio_idosos_dp_sm;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_clock~inputCLKENA0_outclk\ <= NOT \clock~inputCLKENA0_outclk\;
\ALT_INV_conta_normal~input_o\ <= NOT \conta_normal~input_o\;
\ALT_INV_conta_idosos~input_o\ <= NOT \conta_idosos~input_o\;
\ALT_INV_vagas_total_geral[1]~input_o\ <= NOT \vagas_total_geral[1]~input_o\;
\ALT_INV_vagas_total_geral[0]~input_o\ <= NOT \vagas_total_geral[0]~input_o\;
\ALT_INV_vagas_total_geral[2]~input_o\ <= NOT \vagas_total_geral[2]~input_o\;
\ALT_INV_vagas_total_geral[3]~input_o\ <= NOT \vagas_total_geral[3]~input_o\;
\ALT_INV_entra_sai_normal~input_o\ <= NOT \entra_sai_normal~input_o\;
\ALT_INV_entra_sai_idosos~input_o\ <= NOT \entra_sai_idosos~input_o\;
\ALT_INV_vagas_total_idosos[2]~input_o\ <= NOT \vagas_total_idosos[2]~input_o\;
\ALT_INV_vagas_total_idosos[3]~input_o\ <= NOT \vagas_total_idosos[3]~input_o\;
\ALT_INV_vagas_total_idosos[0]~input_o\ <= NOT \vagas_total_idosos[0]~input_o\;
\ALT_INV_vagas_total_idosos[1]~input_o\ <= NOT \vagas_total_idosos[1]~input_o\;
\UC|ALT_INV_Selector4~1_combout\ <= NOT \UC|Selector4~1_combout\;
\FD|comp_normal|ALT_INV_LessThan0~1_combout\ <= NOT \FD|comp_normal|LessThan0~1_combout\;
\UC|ALT_INV_Selector2~0_combout\ <= NOT \UC|Selector2~0_combout\;
\UC|ALT_INV_Selector3~1_combout\ <= NOT \UC|Selector3~1_combout\;
\UC|ALT_INV_update_next_state~0_combout\ <= NOT \UC|update_next_state~0_combout\;
\UC|ALT_INV_CurrentState.espera~q\ <= NOT \UC|CurrentState.espera~q\;
\FD|comp_idosos|ALT_INV_maior_igual~3_combout\ <= NOT \FD|comp_idosos|maior_igual~3_combout\;
\FD|comp_normal|ALT_INV_maior_igual~3_combout\ <= NOT \FD|comp_normal|maior_igual~3_combout\;
\FD|comp_normal|ALT_INV_maior_igual~2_combout\ <= NOT \FD|comp_normal|maior_igual~2_combout\;
\UC|ALT_INV_CurrentState.zera_vagas~q\ <= NOT \UC|CurrentState.zera_vagas~q\;
\UC|ALT_INV_CurrentState.inc_normal~q\ <= NOT \UC|CurrentState.inc_normal~q\;
\UC|ALT_INV_CurrentState.inc_idosos~q\ <= NOT \UC|CurrentState.inc_idosos~q\;
\FD|comp_idosos|ALT_INV_maior_igual~2_combout\ <= NOT \FD|comp_idosos|maior_igual~2_combout\;
\FD|comp_idosos|ALT_INV_maior_igual~1_combout\ <= NOT \FD|comp_idosos|maior_igual~1_combout\;
\FD|comp_normal|ALT_INV_maior_igual~1_combout\ <= NOT \FD|comp_normal|maior_igual~1_combout\;
\FD|comp_normal|ALT_INV_maior_igual~0_combout\ <= NOT \FD|comp_normal|maior_igual~0_combout\;
\FD|comp_idosos|ALT_INV_maior_igual~0_combout\ <= NOT \FD|comp_idosos|maior_igual~0_combout\;
\FD|comp_normal|ALT_INV_LessThan0~0_combout\ <= NOT \FD|comp_normal|LessThan0~0_combout\;
\FD|cont_idosos|ALT_INV_IQ\(3) <= NOT \FD|cont_idosos|IQ\(3);
\FD|cont_idosos|ALT_INV_IQ\(2) <= NOT \FD|cont_idosos|IQ\(2);
\FD|cont_idosos|ALT_INV_IQ\(1) <= NOT \FD|cont_idosos|IQ\(1);
\FD|cont_idosos|ALT_INV_IQ\(0) <= NOT \FD|cont_idosos|IQ\(0);
\FD|cont_normal|ALT_INV_IQ\(3) <= NOT \FD|cont_normal|IQ\(3);
\FD|cont_normal|ALT_INV_IQ\(2) <= NOT \FD|cont_normal|IQ\(2);
\FD|cont_normal|ALT_INV_IQ\(1) <= NOT \FD|cont_normal|IQ\(1);
\FD|cont_normal|ALT_INV_IQ\(0) <= NOT \FD|cont_normal|IQ\(0);
\FD|ALT_INV_vagas_normal_s[1]~13_sumout\ <= NOT \FD|vagas_normal_s[1]~13_sumout\;
\FD|ALT_INV_vagas_normal_s[0]~9_sumout\ <= NOT \FD|vagas_normal_s[0]~9_sumout\;
\FD|ALT_INV_vagas_normal_s[2]~5_sumout\ <= NOT \FD|vagas_normal_s[2]~5_sumout\;
\FD|ALT_INV_vagas_normal_s[3]~1_sumout\ <= NOT \FD|vagas_normal_s[3]~1_sumout\;

-- Location: IOOBUF_X0_Y19_N5
\vagas_ocupadas_normal[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_normal|IQ\(0),
	devoe => ww_devoe,
	o => ww_vagas_ocupadas_normal(0));

-- Location: IOOBUF_X0_Y19_N22
\vagas_ocupadas_normal[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_normal|IQ\(1),
	devoe => ww_devoe,
	o => ww_vagas_ocupadas_normal(1));

-- Location: IOOBUF_X0_Y20_N39
\vagas_ocupadas_normal[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_normal|IQ\(2),
	devoe => ww_devoe,
	o => ww_vagas_ocupadas_normal(2));

-- Location: IOOBUF_X0_Y20_N56
\vagas_ocupadas_normal[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_normal|IQ\(3),
	devoe => ww_devoe,
	o => ww_vagas_ocupadas_normal(3));

-- Location: IOOBUF_X0_Y18_N79
\vagas_ocupadas_idosos[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_idosos|IQ\(0),
	devoe => ww_devoe,
	o => ww_vagas_ocupadas_idosos(0));

-- Location: IOOBUF_X0_Y18_N96
\vagas_ocupadas_idosos[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_idosos|IQ\(1),
	devoe => ww_devoe,
	o => ww_vagas_ocupadas_idosos(1));

-- Location: IOOBUF_X0_Y18_N62
\vagas_ocupadas_idosos[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_idosos|IQ\(2),
	devoe => ww_devoe,
	o => ww_vagas_ocupadas_idosos(2));

-- Location: IOOBUF_X0_Y18_N45
\vagas_ocupadas_idosos[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_idosos|IQ\(3),
	devoe => ww_devoe,
	o => ww_vagas_ocupadas_idosos(3));

-- Location: IOOBUF_X0_Y19_N56
\cheio_geral~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cheio_geral~combout\,
	devoe => ww_devoe,
	o => ww_cheio_geral);

-- Location: IOOBUF_X29_Y0_N36
\entra_sai_idosos_sm_dp~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \entra_sai_idosos~input_o\,
	devoe => ww_devoe,
	o => ww_entra_sai_idosos_sm_dp);

-- Location: IOOBUF_X23_Y0_N76
\entra_sai_normal_sm_dp~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \entra_sai_normal~input_o\,
	devoe => ww_devoe,
	o => ww_entra_sai_normal_sm_dp);

-- Location: IOOBUF_X0_Y19_N39
\conta_idosos_sm_dp~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \UC|CurrentState.inc_idosos~q\,
	devoe => ww_devoe,
	o => ww_conta_idosos_sm_dp);

-- Location: IOOBUF_X14_Y0_N19
\conta_normal_sm_dp~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \UC|CurrentState.inc_normal~q\,
	devoe => ww_devoe,
	o => ww_conta_normal_sm_dp);

-- Location: IOOBUF_X12_Y0_N53
\clear_sm_dp~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \UC|ALT_INV_CurrentState.zera_vagas~q\,
	devoe => ww_devoe,
	o => ww_clear_sm_dp);

-- Location: IOOBUF_X14_Y0_N53
\cheio_normal_dp_sm~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|comp_normal|maior_igual~3_combout\,
	devoe => ww_devoe,
	o => ww_cheio_normal_dp_sm);

-- Location: IOOBUF_X14_Y0_N36
\cheio_idosos_dp_sm~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|comp_idosos|maior_igual~3_combout\,
	devoe => ww_devoe,
	o => ww_cheio_idosos_dp_sm);

-- Location: IOIBUF_X36_Y45_N52
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G15
\clock~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clock~input_o\,
	outclk => \clock~inputCLKENA0_outclk\);

-- Location: IOIBUF_X33_Y0_N41
\entra_sai_normal~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entra_sai_normal,
	o => \entra_sai_normal~input_o\);

-- Location: MLABCELL_X13_Y2_N33
\FD|cont_normal|IQ~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_normal|IQ~1_combout\ = ( \FD|cont_normal|IQ\(0) & ( (!\entra_sai_normal~input_o\ & (((\FD|cont_normal|IQ\(1))))) # (\entra_sai_normal~input_o\ & ((!\FD|cont_normal|IQ\(1)) # ((\FD|cont_normal|IQ\(3) & \FD|cont_normal|IQ\(2))))) ) ) # ( 
-- !\FD|cont_normal|IQ\(0) & ( (!\entra_sai_normal~input_o\ & (!\FD|cont_normal|IQ\(1) & ((\FD|cont_normal|IQ\(2)) # (\FD|cont_normal|IQ\(3))))) # (\entra_sai_normal~input_o\ & (((\FD|cont_normal|IQ\(1))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000000001111011100000000111100001111111100010000111111110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_normal|ALT_INV_IQ\(3),
	datab => \FD|cont_normal|ALT_INV_IQ\(2),
	datac => \ALT_INV_entra_sai_normal~input_o\,
	datad => \FD|cont_normal|ALT_INV_IQ\(1),
	dataf => \FD|cont_normal|ALT_INV_IQ\(0),
	combout => \FD|cont_normal|IQ~1_combout\);

-- Location: IOIBUF_X10_Y0_N92
\clear~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clear,
	o => \clear~input_o\);

-- Location: IOIBUF_X11_Y0_N35
\conta_normal~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_conta_normal,
	o => \conta_normal~input_o\);

-- Location: IOIBUF_X33_Y0_N75
\vagas_total_geral[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total_geral(3),
	o => \vagas_total_geral[3]~input_o\);

-- Location: IOIBUF_X36_Y0_N52
\vagas_total_idosos[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total_idosos(3),
	o => \vagas_total_idosos[3]~input_o\);

-- Location: IOIBUF_X36_Y0_N35
\vagas_total_idosos[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total_idosos(2),
	o => \vagas_total_idosos[2]~input_o\);

-- Location: IOIBUF_X33_Y0_N92
\vagas_total_geral[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total_geral(2),
	o => \vagas_total_geral[2]~input_o\);

-- Location: IOIBUF_X34_Y0_N35
\vagas_total_geral[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total_geral(1),
	o => \vagas_total_geral[1]~input_o\);

-- Location: IOIBUF_X34_Y0_N18
\vagas_total_idosos[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total_idosos(1),
	o => \vagas_total_idosos[1]~input_o\);

-- Location: IOIBUF_X34_Y0_N1
\vagas_total_idosos[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total_idosos(0),
	o => \vagas_total_idosos[0]~input_o\);

-- Location: IOIBUF_X34_Y0_N52
\vagas_total_geral[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total_geral(0),
	o => \vagas_total_geral[0]~input_o\);

-- Location: LABCELL_X14_Y2_N30
\FD|vagas_normal_s[0]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|vagas_normal_s[0]~9_sumout\ = SUM(( !\vagas_total_idosos[0]~input_o\ $ (!\vagas_total_geral[0]~input_o\) ) + ( !VCC ) + ( !VCC ))
-- \FD|vagas_normal_s[0]~10\ = CARRY(( !\vagas_total_idosos[0]~input_o\ $ (!\vagas_total_geral[0]~input_o\) ) + ( !VCC ) + ( !VCC ))
-- \FD|vagas_normal_s[0]~11\ = SHARE((!\vagas_total_idosos[0]~input_o\) # (\vagas_total_geral[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001111111100000000000000000011001111001100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_vagas_total_idosos[0]~input_o\,
	datad => \ALT_INV_vagas_total_geral[0]~input_o\,
	cin => GND,
	sharein => GND,
	sumout => \FD|vagas_normal_s[0]~9_sumout\,
	cout => \FD|vagas_normal_s[0]~10\,
	shareout => \FD|vagas_normal_s[0]~11\);

-- Location: LABCELL_X14_Y2_N33
\FD|vagas_normal_s[1]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|vagas_normal_s[1]~13_sumout\ = SUM(( !\vagas_total_geral[1]~input_o\ $ (\vagas_total_idosos[1]~input_o\) ) + ( \FD|vagas_normal_s[0]~11\ ) + ( \FD|vagas_normal_s[0]~10\ ))
-- \FD|vagas_normal_s[1]~14\ = CARRY(( !\vagas_total_geral[1]~input_o\ $ (\vagas_total_idosos[1]~input_o\) ) + ( \FD|vagas_normal_s[0]~11\ ) + ( \FD|vagas_normal_s[0]~10\ ))
-- \FD|vagas_normal_s[1]~15\ = SHARE((\vagas_total_geral[1]~input_o\ & !\vagas_total_idosos[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100000101000000000000000000001010010110100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_vagas_total_geral[1]~input_o\,
	datac => \ALT_INV_vagas_total_idosos[1]~input_o\,
	cin => \FD|vagas_normal_s[0]~10\,
	sharein => \FD|vagas_normal_s[0]~11\,
	sumout => \FD|vagas_normal_s[1]~13_sumout\,
	cout => \FD|vagas_normal_s[1]~14\,
	shareout => \FD|vagas_normal_s[1]~15\);

-- Location: LABCELL_X14_Y2_N36
\FD|vagas_normal_s[2]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|vagas_normal_s[2]~5_sumout\ = SUM(( !\vagas_total_idosos[2]~input_o\ $ (\vagas_total_geral[2]~input_o\) ) + ( \FD|vagas_normal_s[1]~15\ ) + ( \FD|vagas_normal_s[1]~14\ ))
-- \FD|vagas_normal_s[2]~6\ = CARRY(( !\vagas_total_idosos[2]~input_o\ $ (\vagas_total_geral[2]~input_o\) ) + ( \FD|vagas_normal_s[1]~15\ ) + ( \FD|vagas_normal_s[1]~14\ ))
-- \FD|vagas_normal_s[2]~7\ = SHARE((!\vagas_total_idosos[2]~input_o\ & \vagas_total_geral[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_vagas_total_idosos[2]~input_o\,
	datad => \ALT_INV_vagas_total_geral[2]~input_o\,
	cin => \FD|vagas_normal_s[1]~14\,
	sharein => \FD|vagas_normal_s[1]~15\,
	sumout => \FD|vagas_normal_s[2]~5_sumout\,
	cout => \FD|vagas_normal_s[2]~6\,
	shareout => \FD|vagas_normal_s[2]~7\);

-- Location: LABCELL_X14_Y2_N39
\FD|vagas_normal_s[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|vagas_normal_s[3]~1_sumout\ = SUM(( !\vagas_total_geral[3]~input_o\ $ (\vagas_total_idosos[3]~input_o\) ) + ( \FD|vagas_normal_s[2]~7\ ) + ( \FD|vagas_normal_s[2]~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001010010110100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_vagas_total_geral[3]~input_o\,
	datac => \ALT_INV_vagas_total_idosos[3]~input_o\,
	cin => \FD|vagas_normal_s[2]~6\,
	sharein => \FD|vagas_normal_s[2]~7\,
	sumout => \FD|vagas_normal_s[3]~1_sumout\);

-- Location: MLABCELL_X13_Y2_N51
\FD|comp_normal|maior_igual~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|comp_normal|maior_igual~2_combout\ = ( \FD|cont_normal|IQ\(1) & ( (\FD|vagas_normal_s[0]~9_sumout\ & (\FD|vagas_normal_s[1]~13_sumout\ & !\FD|cont_normal|IQ\(0))) ) ) # ( !\FD|cont_normal|IQ\(1) & ( ((\FD|vagas_normal_s[0]~9_sumout\ & 
-- !\FD|cont_normal|IQ\(0))) # (\FD|vagas_normal_s[1]~13_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111001101110011011100110111001100010000000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|ALT_INV_vagas_normal_s[0]~9_sumout\,
	datab => \FD|ALT_INV_vagas_normal_s[1]~13_sumout\,
	datac => \FD|cont_normal|ALT_INV_IQ\(0),
	dataf => \FD|cont_normal|ALT_INV_IQ\(1),
	combout => \FD|comp_normal|maior_igual~2_combout\);

-- Location: MLABCELL_X13_Y2_N24
\UC|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector2~0_combout\ = ( \FD|vagas_normal_s[2]~5_sumout\ & ( \FD|comp_normal|maior_igual~2_combout\ & ( (!\FD|vagas_normal_s[3]~1_sumout\ & (\FD|cont_normal|IQ\(3) & \entra_sai_normal~input_o\)) ) ) ) # ( !\FD|vagas_normal_s[2]~5_sumout\ & ( 
-- \FD|comp_normal|maior_igual~2_combout\ & ( (\entra_sai_normal~input_o\ & ((!\FD|vagas_normal_s[3]~1_sumout\ & ((\FD|cont_normal|IQ\(3)) # (\FD|cont_normal|IQ\(2)))) # (\FD|vagas_normal_s[3]~1_sumout\ & (\FD|cont_normal|IQ\(2) & \FD|cont_normal|IQ\(3))))) 
-- ) ) ) # ( \FD|vagas_normal_s[2]~5_sumout\ & ( !\FD|comp_normal|maior_igual~2_combout\ & ( (\entra_sai_normal~input_o\ & ((!\FD|vagas_normal_s[3]~1_sumout\ & ((\FD|cont_normal|IQ\(3)) # (\FD|cont_normal|IQ\(2)))) # (\FD|vagas_normal_s[3]~1_sumout\ & 
-- (\FD|cont_normal|IQ\(2) & \FD|cont_normal|IQ\(3))))) ) ) ) # ( !\FD|vagas_normal_s[2]~5_sumout\ & ( !\FD|comp_normal|maior_igual~2_combout\ & ( (\entra_sai_normal~input_o\ & ((!\FD|vagas_normal_s[3]~1_sumout\) # (\FD|cont_normal|IQ\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101111000000000010101100000000001010110000000000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|ALT_INV_vagas_normal_s[3]~1_sumout\,
	datab => \FD|cont_normal|ALT_INV_IQ\(2),
	datac => \FD|cont_normal|ALT_INV_IQ\(3),
	datad => \ALT_INV_entra_sai_normal~input_o\,
	datae => \FD|ALT_INV_vagas_normal_s[2]~5_sumout\,
	dataf => \FD|comp_normal|ALT_INV_maior_igual~2_combout\,
	combout => \UC|Selector2~0_combout\);

-- Location: IOIBUF_X14_Y0_N1
\conta_idosos~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_conta_idosos,
	o => \conta_idosos~input_o\);

-- Location: IOIBUF_X33_Y0_N58
\entra_sai_idosos~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entra_sai_idosos,
	o => \entra_sai_idosos~input_o\);

-- Location: LABCELL_X14_Y2_N48
\FD|cont_idosos|IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_idosos|IQ~2_combout\ = ( \FD|cont_idosos|IQ\(3) & ( (!\entra_sai_idosos~input_o\ & (!\FD|cont_idosos|IQ\(2) $ (((\FD|cont_idosos|IQ\(0)) # (\FD|cont_idosos|IQ\(1)))))) # (\entra_sai_idosos~input_o\ & (((\FD|cont_idosos|IQ\(1) & 
-- \FD|cont_idosos|IQ\(0))) # (\FD|cont_idosos|IQ\(2)))) ) ) # ( !\FD|cont_idosos|IQ\(3) & ( (!\entra_sai_idosos~input_o\ & (\FD|cont_idosos|IQ\(2) & ((\FD|cont_idosos|IQ\(0)) # (\FD|cont_idosos|IQ\(1))))) # (\entra_sai_idosos~input_o\ & 
-- (!\FD|cont_idosos|IQ\(2) $ (((!\FD|cont_idosos|IQ\(1)) # (!\FD|cont_idosos|IQ\(0)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101111110000000010111111010000001011111111000000101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_idosos~input_o\,
	datab => \FD|cont_idosos|ALT_INV_IQ\(1),
	datac => \FD|cont_idosos|ALT_INV_IQ\(0),
	datad => \FD|cont_idosos|ALT_INV_IQ\(2),
	dataf => \FD|cont_idosos|ALT_INV_IQ\(3),
	combout => \FD|cont_idosos|IQ~2_combout\);

-- Location: LABCELL_X14_Y2_N45
\FD|comp_idosos|maior_igual~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|comp_idosos|maior_igual~2_combout\ = ( \FD|cont_idosos|IQ\(3) & ( (!\vagas_total_idosos[3]~input_o\) # ((\FD|cont_idosos|IQ\(2) & !\vagas_total_idosos[2]~input_o\)) ) ) # ( !\FD|cont_idosos|IQ\(3) & ( (\FD|cont_idosos|IQ\(2) & 
-- (!\vagas_total_idosos[3]~input_o\ & !\vagas_total_idosos[2]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000000000010100000000000011110101111100001111010111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_idosos|ALT_INV_IQ\(2),
	datac => \ALT_INV_vagas_total_idosos[3]~input_o\,
	datad => \ALT_INV_vagas_total_idosos[2]~input_o\,
	dataf => \FD|cont_idosos|ALT_INV_IQ\(3),
	combout => \FD|comp_idosos|maior_igual~2_combout\);

-- Location: LABCELL_X14_Y2_N57
\FD|comp_idosos|maior_igual~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|comp_idosos|maior_igual~1_combout\ = ( \FD|cont_idosos|IQ\(3) & ( (\vagas_total_idosos[3]~input_o\ & (!\vagas_total_idosos[2]~input_o\ $ (\FD|cont_idosos|IQ\(2)))) ) ) # ( !\FD|cont_idosos|IQ\(3) & ( (!\vagas_total_idosos[3]~input_o\ & 
-- (!\vagas_total_idosos[2]~input_o\ $ (\FD|cont_idosos|IQ\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000001010000101000000101000000001010000001010000101000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_vagas_total_idosos[2]~input_o\,
	datac => \ALT_INV_vagas_total_idosos[3]~input_o\,
	datad => \FD|cont_idosos|ALT_INV_IQ\(2),
	dataf => \FD|cont_idosos|ALT_INV_IQ\(3),
	combout => \FD|comp_idosos|maior_igual~1_combout\);

-- Location: LABCELL_X14_Y2_N15
\FD|comp_idosos|maior_igual~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|comp_idosos|maior_igual~3_combout\ = ( \FD|comp_idosos|maior_igual~1_combout\ & ( (!\FD|comp_idosos|maior_igual~0_combout\) # (\FD|comp_idosos|maior_igual~2_combout\) ) ) # ( !\FD|comp_idosos|maior_igual~1_combout\ & ( 
-- \FD|comp_idosos|maior_igual~2_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111001100111111111100110011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \FD|comp_idosos|ALT_INV_maior_igual~0_combout\,
	datad => \FD|comp_idosos|ALT_INV_maior_igual~2_combout\,
	dataf => \FD|comp_idosos|ALT_INV_maior_igual~1_combout\,
	combout => \FD|comp_idosos|maior_igual~3_combout\);

-- Location: LABCELL_X14_Y2_N24
\UC|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector3~0_combout\ = ( \FD|comp_idosos|maior_igual~3_combout\ & ( (!\entra_sai_idosos~input_o\ & (!\conta_idosos~input_o\ & \UC|CurrentState.espera~q\)) ) ) # ( !\FD|comp_idosos|maior_igual~3_combout\ & ( (!\conta_idosos~input_o\ & 
-- ((\UC|CurrentState.inc_idosos~q\) # (\UC|CurrentState.espera~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110011001100000011001100110000001000000010000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_idosos~input_o\,
	datab => \ALT_INV_conta_idosos~input_o\,
	datac => \UC|ALT_INV_CurrentState.espera~q\,
	datad => \UC|ALT_INV_CurrentState.inc_idosos~q\,
	dataf => \FD|comp_idosos|ALT_INV_maior_igual~3_combout\,
	combout => \UC|Selector3~0_combout\);

-- Location: FF_X14_Y2_N26
\UC|CurrentState.inc_idosos\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \UC|Selector3~0_combout\,
	clrn => \clear~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UC|CurrentState.inc_idosos~q\);

-- Location: FF_X14_Y2_N50
\FD|cont_idosos|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputCLKENA0_outclk\,
	d => \FD|cont_idosos|IQ~2_combout\,
	clrn => \clear~input_o\,
	ena => \UC|CurrentState.inc_idosos~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_idosos|IQ\(2));

-- Location: LABCELL_X14_Y2_N9
\FD|cont_idosos|IQ~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_idosos|IQ~1_combout\ = ( \FD|cont_idosos|IQ\(2) & ( (!\entra_sai_idosos~input_o\ & ((!\FD|cont_idosos|IQ\(0) $ (\FD|cont_idosos|IQ\(1))))) # (\entra_sai_idosos~input_o\ & ((!\FD|cont_idosos|IQ\(0) & ((\FD|cont_idosos|IQ\(1)))) # 
-- (\FD|cont_idosos|IQ\(0) & ((!\FD|cont_idosos|IQ\(1)) # (\FD|cont_idosos|IQ\(3)))))) ) ) # ( !\FD|cont_idosos|IQ\(2) & ( (!\entra_sai_idosos~input_o\ & ((!\FD|cont_idosos|IQ\(0) & (\FD|cont_idosos|IQ\(3) & !\FD|cont_idosos|IQ\(1))) # 
-- (\FD|cont_idosos|IQ\(0) & ((\FD|cont_idosos|IQ\(1)))))) # (\entra_sai_idosos~input_o\ & ((!\FD|cont_idosos|IQ\(0) $ (!\FD|cont_idosos|IQ\(1))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100001100111100010000110011110011000011001111011100001100111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_idosos|ALT_INV_IQ\(3),
	datab => \ALT_INV_entra_sai_idosos~input_o\,
	datac => \FD|cont_idosos|ALT_INV_IQ\(0),
	datad => \FD|cont_idosos|ALT_INV_IQ\(1),
	dataf => \FD|cont_idosos|ALT_INV_IQ\(2),
	combout => \FD|cont_idosos|IQ~1_combout\);

-- Location: FF_X14_Y2_N11
\FD|cont_idosos|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputCLKENA0_outclk\,
	d => \FD|cont_idosos|IQ~1_combout\,
	clrn => \clear~input_o\,
	ena => \UC|CurrentState.inc_idosos~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_idosos|IQ\(1));

-- Location: LABCELL_X14_Y2_N51
\FD|cont_idosos|IQ~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_idosos|IQ~3_combout\ = ( \FD|cont_idosos|IQ\(2) & ( ((\entra_sai_idosos~input_o\ & (\FD|cont_idosos|IQ\(1) & \FD|cont_idosos|IQ\(0)))) # (\FD|cont_idosos|IQ\(3)) ) ) # ( !\FD|cont_idosos|IQ\(2) & ( (\FD|cont_idosos|IQ\(3) & 
-- (((\FD|cont_idosos|IQ\(0)) # (\FD|cont_idosos|IQ\(1))) # (\entra_sai_idosos~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001111111000000000111111100000001111111110000000111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_idosos~input_o\,
	datab => \FD|cont_idosos|ALT_INV_IQ\(1),
	datac => \FD|cont_idosos|ALT_INV_IQ\(0),
	datad => \FD|cont_idosos|ALT_INV_IQ\(3),
	dataf => \FD|cont_idosos|ALT_INV_IQ\(2),
	combout => \FD|cont_idosos|IQ~3_combout\);

-- Location: FF_X14_Y2_N53
\FD|cont_idosos|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputCLKENA0_outclk\,
	d => \FD|cont_idosos|IQ~3_combout\,
	clrn => \clear~input_o\,
	ena => \UC|CurrentState.inc_idosos~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_idosos|IQ\(3));

-- Location: LABCELL_X14_Y2_N6
\FD|cont_idosos|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_idosos|IQ~0_combout\ = ( \FD|cont_idosos|IQ\(2) & ( (!\FD|cont_idosos|IQ\(0)) # ((\FD|cont_idosos|IQ\(3) & (\entra_sai_idosos~input_o\ & \FD|cont_idosos|IQ\(1)))) ) ) # ( !\FD|cont_idosos|IQ\(2) & ( (!\FD|cont_idosos|IQ\(0) & 
-- (((\FD|cont_idosos|IQ\(1)) # (\entra_sai_idosos~input_o\)) # (\FD|cont_idosos|IQ\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111100000000011111110000000011111111000000011111111100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_idosos|ALT_INV_IQ\(3),
	datab => \ALT_INV_entra_sai_idosos~input_o\,
	datac => \FD|cont_idosos|ALT_INV_IQ\(1),
	datad => \FD|cont_idosos|ALT_INV_IQ\(0),
	dataf => \FD|cont_idosos|ALT_INV_IQ\(2),
	combout => \FD|cont_idosos|IQ~0_combout\);

-- Location: FF_X14_Y2_N8
\FD|cont_idosos|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputCLKENA0_outclk\,
	d => \FD|cont_idosos|IQ~0_combout\,
	clrn => \clear~input_o\,
	ena => \UC|CurrentState.inc_idosos~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_idosos|IQ\(0));

-- Location: LABCELL_X14_Y2_N42
\FD|comp_idosos|maior_igual~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|comp_idosos|maior_igual~0_combout\ = ( \FD|cont_idosos|IQ\(1) & ( (!\FD|cont_idosos|IQ\(0) & (\vagas_total_idosos[0]~input_o\ & \vagas_total_idosos[1]~input_o\)) ) ) # ( !\FD|cont_idosos|IQ\(1) & ( ((!\FD|cont_idosos|IQ\(0) & 
-- \vagas_total_idosos[0]~input_o\)) # (\vagas_total_idosos[1]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110011111111000011001111111100000000000011000000000000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \FD|cont_idosos|ALT_INV_IQ\(0),
	datac => \ALT_INV_vagas_total_idosos[0]~input_o\,
	datad => \ALT_INV_vagas_total_idosos[1]~input_o\,
	dataf => \FD|cont_idosos|ALT_INV_IQ\(1),
	combout => \FD|comp_idosos|maior_igual~0_combout\);

-- Location: LABCELL_X14_Y2_N12
\UC|Selector3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector3~1_combout\ = ( \FD|comp_idosos|maior_igual~1_combout\ & ( (!\conta_idosos~input_o\ & (\FD|comp_idosos|maior_igual~0_combout\ & (\UC|CurrentState.inc_idosos~q\ & !\FD|comp_idosos|maior_igual~2_combout\))) ) ) # ( 
-- !\FD|comp_idosos|maior_igual~1_combout\ & ( (!\conta_idosos~input_o\ & (\UC|CurrentState.inc_idosos~q\ & !\FD|comp_idosos|maior_igual~2_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000000000010000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_conta_idosos~input_o\,
	datab => \FD|comp_idosos|ALT_INV_maior_igual~0_combout\,
	datac => \UC|ALT_INV_CurrentState.inc_idosos~q\,
	datad => \FD|comp_idosos|ALT_INV_maior_igual~2_combout\,
	dataf => \FD|comp_idosos|ALT_INV_maior_igual~1_combout\,
	combout => \UC|Selector3~1_combout\);

-- Location: MLABCELL_X13_Y2_N42
\FD|comp_normal|LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|comp_normal|LessThan0~1_combout\ = ( \FD|cont_normal|IQ\(2) & ( !\FD|vagas_normal_s[2]~5_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|ALT_INV_vagas_normal_s[2]~5_sumout\,
	dataf => \FD|cont_normal|ALT_INV_IQ\(2),
	combout => \FD|comp_normal|LessThan0~1_combout\);

-- Location: MLABCELL_X13_Y2_N0
\FD|comp_normal|maior_igual~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|comp_normal|maior_igual~0_combout\ = ( \FD|vagas_normal_s[1]~13_sumout\ & ( \FD|cont_normal|IQ\(0) & ( (\FD|cont_normal|IQ\(1) & (!\FD|vagas_normal_s[2]~5_sumout\ $ (\FD|cont_normal|IQ\(2)))) ) ) ) # ( !\FD|vagas_normal_s[1]~13_sumout\ & ( 
-- \FD|cont_normal|IQ\(0) & ( !\FD|vagas_normal_s[2]~5_sumout\ $ (\FD|cont_normal|IQ\(2)) ) ) ) # ( \FD|vagas_normal_s[1]~13_sumout\ & ( !\FD|cont_normal|IQ\(0) & ( (!\FD|vagas_normal_s[0]~9_sumout\ & (\FD|cont_normal|IQ\(1) & 
-- (!\FD|vagas_normal_s[2]~5_sumout\ $ (\FD|cont_normal|IQ\(2))))) ) ) ) # ( !\FD|vagas_normal_s[1]~13_sumout\ & ( !\FD|cont_normal|IQ\(0) & ( (!\FD|vagas_normal_s[0]~9_sumout\ & (!\FD|vagas_normal_s[2]~5_sumout\ $ (((\FD|cont_normal|IQ\(2)))))) # 
-- (\FD|vagas_normal_s[0]~9_sumout\ & (\FD|cont_normal|IQ\(1) & (!\FD|vagas_normal_s[2]~5_sumout\ $ (\FD|cont_normal|IQ\(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000110000100011000010000000001011001100001100110000110000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|ALT_INV_vagas_normal_s[0]~9_sumout\,
	datab => \FD|ALT_INV_vagas_normal_s[2]~5_sumout\,
	datac => \FD|cont_normal|ALT_INV_IQ\(1),
	datad => \FD|cont_normal|ALT_INV_IQ\(2),
	datae => \FD|ALT_INV_vagas_normal_s[1]~13_sumout\,
	dataf => \FD|cont_normal|ALT_INV_IQ\(0),
	combout => \FD|comp_normal|maior_igual~0_combout\);

-- Location: MLABCELL_X13_Y2_N54
\UC|Selector4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector4~1_combout\ = ( !\FD|comp_normal|maior_igual~0_combout\ & ( \FD|cont_normal|IQ\(3) & ( (\FD|vagas_normal_s[3]~1_sumout\ & (!\conta_normal~input_o\ & (\UC|CurrentState.inc_normal~q\ & !\FD|comp_normal|LessThan0~1_combout\))) ) ) ) # ( 
-- \FD|comp_normal|maior_igual~0_combout\ & ( !\FD|cont_normal|IQ\(3) & ( (\FD|vagas_normal_s[3]~1_sumout\ & (!\conta_normal~input_o\ & \UC|CurrentState.inc_normal~q\)) ) ) ) # ( !\FD|comp_normal|maior_igual~0_combout\ & ( !\FD|cont_normal|IQ\(3) & ( 
-- (!\conta_normal~input_o\ & (\UC|CurrentState.inc_normal~q\ & ((!\FD|comp_normal|LessThan0~1_combout\) # (\FD|vagas_normal_s[3]~1_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000000100000001000000010000000100000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|ALT_INV_vagas_normal_s[3]~1_sumout\,
	datab => \ALT_INV_conta_normal~input_o\,
	datac => \UC|ALT_INV_CurrentState.inc_normal~q\,
	datad => \FD|comp_normal|ALT_INV_LessThan0~1_combout\,
	datae => \FD|comp_normal|ALT_INV_maior_igual~0_combout\,
	dataf => \FD|cont_normal|ALT_INV_IQ\(3),
	combout => \UC|Selector4~1_combout\);

-- Location: LABCELL_X14_Y2_N27
\UC|update_next_state~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|update_next_state~0_combout\ = ( \FD|comp_idosos|maior_igual~1_combout\ & ( (!\conta_idosos~input_o\ & ((!\entra_sai_idosos~input_o\) # ((\FD|comp_idosos|maior_igual~0_combout\ & !\FD|comp_idosos|maior_igual~2_combout\)))) ) ) # ( 
-- !\FD|comp_idosos|maior_igual~1_combout\ & ( (!\conta_idosos~input_o\ & ((!\entra_sai_idosos~input_o\) # (!\FD|comp_idosos|maior_igual~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110010001000110011001000100010001100100010001000110010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_idosos~input_o\,
	datab => \ALT_INV_conta_idosos~input_o\,
	datac => \FD|comp_idosos|ALT_INV_maior_igual~0_combout\,
	datad => \FD|comp_idosos|ALT_INV_maior_igual~2_combout\,
	dataf => \FD|comp_idosos|ALT_INV_maior_igual~1_combout\,
	combout => \UC|update_next_state~0_combout\);

-- Location: LABCELL_X14_Y2_N21
\UC|Selector2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector2~1_combout\ = ( !\UC|CurrentState.espera~q\ & ( \UC|update_next_state~0_combout\ & ( (!\UC|Selector3~1_combout\ & !\UC|Selector4~1_combout\) ) ) ) # ( \UC|CurrentState.espera~q\ & ( !\UC|update_next_state~0_combout\ & ( 
-- (!\UC|Selector3~1_combout\ & (!\UC|Selector4~1_combout\ & ((\UC|Selector2~0_combout\) # (\conta_normal~input_o\)))) ) ) ) # ( !\UC|CurrentState.espera~q\ & ( !\UC|update_next_state~0_combout\ & ( (!\UC|Selector3~1_combout\ & !\UC|Selector4~1_combout\) ) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000011100000000000011110000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_conta_normal~input_o\,
	datab => \UC|ALT_INV_Selector2~0_combout\,
	datac => \UC|ALT_INV_Selector3~1_combout\,
	datad => \UC|ALT_INV_Selector4~1_combout\,
	datae => \UC|ALT_INV_CurrentState.espera~q\,
	dataf => \UC|ALT_INV_update_next_state~0_combout\,
	combout => \UC|Selector2~1_combout\);

-- Location: FF_X14_Y2_N23
\UC|CurrentState.espera\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \UC|Selector2~1_combout\,
	clrn => \clear~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UC|CurrentState.espera~q\);

-- Location: MLABCELL_X13_Y2_N45
\FD|comp_normal|maior_igual~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|comp_normal|maior_igual~3_combout\ = ( \FD|comp_normal|maior_igual~2_combout\ & ( (!\FD|vagas_normal_s[3]~1_sumout\ & (((!\FD|vagas_normal_s[2]~5_sumout\ & \FD|cont_normal|IQ\(2))) # (\FD|cont_normal|IQ\(3)))) # (\FD|vagas_normal_s[3]~1_sumout\ & 
-- (!\FD|vagas_normal_s[2]~5_sumout\ & (\FD|cont_normal|IQ\(2) & \FD|cont_normal|IQ\(3)))) ) ) # ( !\FD|comp_normal|maior_igual~2_combout\ & ( (!\FD|vagas_normal_s[3]~1_sumout\ & ((!\FD|vagas_normal_s[2]~5_sumout\) # ((\FD|cont_normal|IQ\(3)) # 
-- (\FD|cont_normal|IQ\(2))))) # (\FD|vagas_normal_s[3]~1_sumout\ & (\FD|cont_normal|IQ\(3) & ((!\FD|vagas_normal_s[2]~5_sumout\) # (\FD|cont_normal|IQ\(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011000011111011101100001111101100100000111100100010000011110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|ALT_INV_vagas_normal_s[2]~5_sumout\,
	datab => \FD|cont_normal|ALT_INV_IQ\(2),
	datac => \FD|ALT_INV_vagas_normal_s[3]~1_sumout\,
	datad => \FD|cont_normal|ALT_INV_IQ\(3),
	dataf => \FD|comp_normal|ALT_INV_maior_igual~2_combout\,
	combout => \FD|comp_normal|maior_igual~3_combout\);

-- Location: LABCELL_X14_Y2_N0
\UC|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector4~0_combout\ = ( \UC|CurrentState.inc_normal~q\ & ( \UC|update_next_state~0_combout\ & ( (!\conta_normal~input_o\ & !\FD|comp_normal|maior_igual~3_combout\) ) ) ) # ( \UC|CurrentState.inc_normal~q\ & ( !\UC|update_next_state~0_combout\ & ( 
-- (!\conta_normal~input_o\ & ((!\FD|comp_normal|maior_igual~3_combout\) # ((\UC|CurrentState.espera~q\ & !\entra_sai_normal~input_o\)))) ) ) ) # ( !\UC|CurrentState.inc_normal~q\ & ( !\UC|update_next_state~0_combout\ & ( (\UC|CurrentState.espera~q\ & 
-- (!\conta_normal~input_o\ & ((!\FD|comp_normal|maior_igual~3_combout\) # (!\entra_sai_normal~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000000110001001100000000000000000000001100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_CurrentState.espera~q\,
	datab => \ALT_INV_conta_normal~input_o\,
	datac => \FD|comp_normal|ALT_INV_maior_igual~3_combout\,
	datad => \ALT_INV_entra_sai_normal~input_o\,
	datae => \UC|ALT_INV_CurrentState.inc_normal~q\,
	dataf => \UC|ALT_INV_update_next_state~0_combout\,
	combout => \UC|Selector4~0_combout\);

-- Location: FF_X14_Y2_N2
\UC|CurrentState.inc_normal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \UC|Selector4~0_combout\,
	clrn => \clear~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UC|CurrentState.inc_normal~q\);

-- Location: FF_X13_Y2_N35
\FD|cont_normal|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputCLKENA0_outclk\,
	d => \FD|cont_normal|IQ~1_combout\,
	clrn => \clear~input_o\,
	ena => \UC|CurrentState.inc_normal~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_normal|IQ\(1));

-- Location: MLABCELL_X13_Y2_N39
\FD|cont_normal|IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_normal|IQ~2_combout\ = ( \FD|cont_normal|IQ\(2) & ( \FD|cont_normal|IQ\(1) & ( ((!\FD|cont_normal|IQ\(0)) # (!\entra_sai_normal~input_o\)) # (\FD|cont_normal|IQ\(3)) ) ) ) # ( !\FD|cont_normal|IQ\(2) & ( \FD|cont_normal|IQ\(1) & ( 
-- (\FD|cont_normal|IQ\(0) & \entra_sai_normal~input_o\) ) ) ) # ( \FD|cont_normal|IQ\(2) & ( !\FD|cont_normal|IQ\(1) & ( (\entra_sai_normal~input_o\) # (\FD|cont_normal|IQ\(0)) ) ) ) # ( !\FD|cont_normal|IQ\(2) & ( !\FD|cont_normal|IQ\(1) & ( 
-- (\FD|cont_normal|IQ\(3) & (!\FD|cont_normal|IQ\(0) & !\entra_sai_normal~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010000000000001100111111111100000000001100111111111111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_normal|ALT_INV_IQ\(3),
	datab => \FD|cont_normal|ALT_INV_IQ\(0),
	datad => \ALT_INV_entra_sai_normal~input_o\,
	datae => \FD|cont_normal|ALT_INV_IQ\(2),
	dataf => \FD|cont_normal|ALT_INV_IQ\(1),
	combout => \FD|cont_normal|IQ~2_combout\);

-- Location: FF_X13_Y2_N41
\FD|cont_normal|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputCLKENA0_outclk\,
	d => \FD|cont_normal|IQ~2_combout\,
	clrn => \clear~input_o\,
	ena => \UC|CurrentState.inc_normal~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_normal|IQ\(2));

-- Location: MLABCELL_X13_Y2_N18
\FD|cont_normal|IQ~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_normal|IQ~3_combout\ = ( \FD|cont_normal|IQ\(3) & ( \FD|cont_normal|IQ\(1) ) ) # ( !\FD|cont_normal|IQ\(3) & ( \FD|cont_normal|IQ\(1) & ( (\entra_sai_normal~input_o\ & (\FD|cont_normal|IQ\(2) & \FD|cont_normal|IQ\(0))) ) ) ) # ( 
-- \FD|cont_normal|IQ\(3) & ( !\FD|cont_normal|IQ\(1) & ( ((\FD|cont_normal|IQ\(0)) # (\FD|cont_normal|IQ\(2))) # (\entra_sai_normal~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010111111111111100000000000001011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_normal~input_o\,
	datac => \FD|cont_normal|ALT_INV_IQ\(2),
	datad => \FD|cont_normal|ALT_INV_IQ\(0),
	datae => \FD|cont_normal|ALT_INV_IQ\(3),
	dataf => \FD|cont_normal|ALT_INV_IQ\(1),
	combout => \FD|cont_normal|IQ~3_combout\);

-- Location: FF_X13_Y2_N20
\FD|cont_normal|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputCLKENA0_outclk\,
	d => \FD|cont_normal|IQ~3_combout\,
	clrn => \clear~input_o\,
	ena => \UC|CurrentState.inc_normal~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_normal|IQ\(3));

-- Location: MLABCELL_X13_Y2_N12
\FD|cont_normal|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_normal|IQ~0_combout\ = ( \FD|cont_normal|IQ\(1) & ( (!\FD|cont_normal|IQ\(0)) # ((\FD|cont_normal|IQ\(3) & (\entra_sai_normal~input_o\ & \FD|cont_normal|IQ\(2)))) ) ) # ( !\FD|cont_normal|IQ\(1) & ( (!\FD|cont_normal|IQ\(0) & 
-- (((\FD|cont_normal|IQ\(2)) # (\entra_sai_normal~input_o\)) # (\FD|cont_normal|IQ\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111100000000011111110000000011111111000000011111111100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_normal|ALT_INV_IQ\(3),
	datab => \ALT_INV_entra_sai_normal~input_o\,
	datac => \FD|cont_normal|ALT_INV_IQ\(2),
	datad => \FD|cont_normal|ALT_INV_IQ\(0),
	dataf => \FD|cont_normal|ALT_INV_IQ\(1),
	combout => \FD|cont_normal|IQ~0_combout\);

-- Location: FF_X13_Y2_N14
\FD|cont_normal|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputCLKENA0_outclk\,
	d => \FD|cont_normal|IQ~0_combout\,
	clrn => \clear~input_o\,
	ena => \UC|CurrentState.inc_normal~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_normal|IQ\(0));

-- Location: MLABCELL_X13_Y2_N30
\FD|comp_normal|maior_igual~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|comp_normal|maior_igual~1_combout\ = ( \FD|vagas_normal_s[3]~1_sumout\ & ( (\FD|cont_normal|IQ\(3) & (\FD|cont_normal|IQ\(2) & !\FD|vagas_normal_s[2]~5_sumout\)) ) ) # ( !\FD|vagas_normal_s[3]~1_sumout\ & ( ((\FD|cont_normal|IQ\(2) & 
-- !\FD|vagas_normal_s[2]~5_sumout\)) # (\FD|cont_normal|IQ\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101010101011101110101010100010001000000000001000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_normal|ALT_INV_IQ\(3),
	datab => \FD|cont_normal|ALT_INV_IQ\(2),
	datad => \FD|ALT_INV_vagas_normal_s[2]~5_sumout\,
	dataf => \FD|ALT_INV_vagas_normal_s[3]~1_sumout\,
	combout => \FD|comp_normal|maior_igual~1_combout\);

-- Location: MLABCELL_X13_Y2_N15
\FD|comp_normal|LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|comp_normal|LessThan0~0_combout\ = ( \FD|vagas_normal_s[3]~1_sumout\ & ( !\FD|cont_normal|IQ\(3) ) ) # ( !\FD|vagas_normal_s[3]~1_sumout\ & ( \FD|cont_normal|IQ\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_normal|ALT_INV_IQ\(3),
	dataf => \FD|ALT_INV_vagas_normal_s[3]~1_sumout\,
	combout => \FD|comp_normal|LessThan0~0_combout\);

-- Location: MLABCELL_X13_Y2_N9
\FD|cheio_geral\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cheio_geral~combout\ = ( \FD|comp_normal|LessThan0~0_combout\ & ( \FD|comp_idosos|maior_igual~0_combout\ & ( (\FD|comp_idosos|maior_igual~2_combout\ & \FD|comp_normal|maior_igual~1_combout\) ) ) ) # ( !\FD|comp_normal|LessThan0~0_combout\ & ( 
-- \FD|comp_idosos|maior_igual~0_combout\ & ( (\FD|comp_idosos|maior_igual~2_combout\ & ((\FD|comp_normal|maior_igual~0_combout\) # (\FD|comp_normal|maior_igual~1_combout\))) ) ) ) # ( \FD|comp_normal|LessThan0~0_combout\ & ( 
-- !\FD|comp_idosos|maior_igual~0_combout\ & ( (\FD|comp_normal|maior_igual~1_combout\ & ((\FD|comp_idosos|maior_igual~2_combout\) # (\FD|comp_idosos|maior_igual~1_combout\))) ) ) ) # ( !\FD|comp_normal|LessThan0~0_combout\ & ( 
-- !\FD|comp_idosos|maior_igual~0_combout\ & ( (!\FD|comp_idosos|maior_igual~1_combout\ & (\FD|comp_idosos|maior_igual~2_combout\ & ((\FD|comp_normal|maior_igual~0_combout\) # (\FD|comp_normal|maior_igual~1_combout\)))) # 
-- (\FD|comp_idosos|maior_igual~1_combout\ & (((\FD|comp_normal|maior_igual~0_combout\) # (\FD|comp_normal|maior_igual~1_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011101110111000001110000011100000011001100110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|comp_idosos|ALT_INV_maior_igual~1_combout\,
	datab => \FD|comp_idosos|ALT_INV_maior_igual~2_combout\,
	datac => \FD|comp_normal|ALT_INV_maior_igual~1_combout\,
	datad => \FD|comp_normal|ALT_INV_maior_igual~0_combout\,
	datae => \FD|comp_normal|ALT_INV_LessThan0~0_combout\,
	dataf => \FD|comp_idosos|ALT_INV_maior_igual~0_combout\,
	combout => \FD|cheio_geral~combout\);

-- Location: MLABCELL_X13_Y2_N48
\UC|CurrentState.zera_vagas~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|CurrentState.zera_vagas~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \UC|CurrentState.zera_vagas~feeder_combout\);

-- Location: FF_X13_Y2_N49
\UC|CurrentState.zera_vagas\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \UC|CurrentState.zera_vagas~feeder_combout\,
	clrn => \clear~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UC|CurrentState.zera_vagas~q\);

-- Location: LABCELL_X53_Y11_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


