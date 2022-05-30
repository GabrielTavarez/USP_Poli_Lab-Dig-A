-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"

-- DATE "05/29/2022 21:34:59"

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
	vagas_total : IN std_logic_vector(3 DOWNTO 0);
	vagas_load : IN std_logic_vector(3 DOWNTO 0);
	vagas_out_total : BUFFER std_logic_vector(3 DOWNTO 0);
	vagas_out_idosos : BUFFER std_logic_vector(3 DOWNTO 0);
	cheio : BUFFER std_logic;
	entra_sai_idosos_sm_dp : BUFFER std_logic;
	entra_sai_normal_sm_dp : BUFFER std_logic;
	conta_idosos_sm_dp : BUFFER std_logic;
	conta_normal_sm_dp : BUFFER std_logic;
	clear_sm_dp : BUFFER std_logic;
	cheio_dp_sm : BUFFER std_logic
	);
END controlador_de_vagas;

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
SIGNAL ww_vagas_total : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_vagas_load : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_vagas_out_total : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_vagas_out_idosos : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_cheio : std_logic;
SIGNAL ww_entra_sai_idosos_sm_dp : std_logic;
SIGNAL ww_entra_sai_normal_sm_dp : std_logic;
SIGNAL ww_conta_idosos_sm_dp : std_logic;
SIGNAL ww_conta_normal_sm_dp : std_logic;
SIGNAL ww_clear_sm_dp : std_logic;
SIGNAL ww_cheio_dp_sm : std_logic;
SIGNAL \vagas_load[0]~input_o\ : std_logic;
SIGNAL \vagas_load[1]~input_o\ : std_logic;
SIGNAL \vagas_load[2]~input_o\ : std_logic;
SIGNAL \vagas_load[3]~input_o\ : std_logic;
SIGNAL \vagas_out_total[0]~output_o\ : std_logic;
SIGNAL \vagas_out_total[1]~output_o\ : std_logic;
SIGNAL \vagas_out_total[2]~output_o\ : std_logic;
SIGNAL \vagas_out_total[3]~output_o\ : std_logic;
SIGNAL \vagas_out_idosos[0]~output_o\ : std_logic;
SIGNAL \vagas_out_idosos[1]~output_o\ : std_logic;
SIGNAL \vagas_out_idosos[2]~output_o\ : std_logic;
SIGNAL \vagas_out_idosos[3]~output_o\ : std_logic;
SIGNAL \cheio~output_o\ : std_logic;
SIGNAL \entra_sai_idosos_sm_dp~output_o\ : std_logic;
SIGNAL \entra_sai_normal_sm_dp~output_o\ : std_logic;
SIGNAL \conta_idosos_sm_dp~output_o\ : std_logic;
SIGNAL \conta_normal_sm_dp~output_o\ : std_logic;
SIGNAL \clear_sm_dp~output_o\ : std_logic;
SIGNAL \cheio_dp_sm~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \FD|cont_total|IQ[0]~3_combout\ : std_logic;
SIGNAL \clear~input_o\ : std_logic;
SIGNAL \entra_sai_idosos~input_o\ : std_logic;
SIGNAL \entra_sai_normal~input_o\ : std_logic;
SIGNAL \FD|entra_sai_total_s~combout\ : std_logic;
SIGNAL \FD|cont_total|IQ~0_combout\ : std_logic;
SIGNAL \vagas_total[1]~input_o\ : std_logic;
SIGNAL \vagas_total[0]~input_o\ : std_logic;
SIGNAL \FD|comp1|maior_igual~0_combout\ : std_logic;
SIGNAL \conta_normal~input_o\ : std_logic;
SIGNAL \FD|cont_total|IQ~1_combout\ : std_logic;
SIGNAL \FD|cont_total|IQ~2_combout\ : std_logic;
SIGNAL \vagas_total[3]~input_o\ : std_logic;
SIGNAL \vagas_total[2]~input_o\ : std_logic;
SIGNAL \FD|comp1|maior_igual~1_combout\ : std_logic;
SIGNAL \FD|comp1|maior_igual~2_combout\ : std_logic;
SIGNAL \conta_idosos~input_o\ : std_logic;
SIGNAL \UC|Selector5~0_combout\ : std_logic;
SIGNAL \UC|Selector5~1_combout\ : std_logic;
SIGNAL \UC|CurrentState.cheio~q\ : std_logic;
SIGNAL \UC|Selector3~0_combout\ : std_logic;
SIGNAL \UC|Selector3~1_combout\ : std_logic;
SIGNAL \UC|CurrentState.inc_idosos~q\ : std_logic;
SIGNAL \UC|Selector2~0_combout\ : std_logic;
SIGNAL \UC|CurrentState.zera_vagas~q\ : std_logic;
SIGNAL \UC|Selector2~1_combout\ : std_logic;
SIGNAL \UC|Selector2~2_combout\ : std_logic;
SIGNAL \UC|CurrentState.vazio~q\ : std_logic;
SIGNAL \UC|Selector4~0_combout\ : std_logic;
SIGNAL \UC|Selector4~1_combout\ : std_logic;
SIGNAL \UC|CurrentState.inc_normal~q\ : std_logic;
SIGNAL \UC|NextState~0_combout\ : std_logic;
SIGNAL \FD|cont_idosos|IQ[0]~3_combout\ : std_logic;
SIGNAL \FD|cont_idosos|IQ~0_combout\ : std_logic;
SIGNAL \FD|cont_idosos|IQ~1_combout\ : std_logic;
SIGNAL \FD|cont_idosos|IQ~2_combout\ : std_logic;
SIGNAL \FD|comp1|maior_igual~3_combout\ : std_logic;
SIGNAL \UC|Selector1~0_combout\ : std_logic;
SIGNAL \FD|cont_total|IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \FD|cont_idosos|IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_conta_idosos~input_o\ : std_logic;
SIGNAL \ALT_INV_conta_normal~input_o\ : std_logic;
SIGNAL \ALT_INV_clear~input_o\ : std_logic;
SIGNAL \ALT_INV_clock~input_o\ : std_logic;
SIGNAL \ALT_INV_entra_sai_normal~input_o\ : std_logic;
SIGNAL \ALT_INV_entra_sai_idosos~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[1]~input_o\ : std_logic;
SIGNAL \UC|ALT_INV_Selector5~0_combout\ : std_logic;
SIGNAL \UC|ALT_INV_Selector2~1_combout\ : std_logic;
SIGNAL \UC|ALT_INV_Selector2~0_combout\ : std_logic;
SIGNAL \UC|ALT_INV_Selector3~0_combout\ : std_logic;
SIGNAL \UC|ALT_INV_Selector4~0_combout\ : std_logic;
SIGNAL \UC|ALT_INV_CurrentState.cheio~q\ : std_logic;
SIGNAL \UC|ALT_INV_CurrentState.vazio~q\ : std_logic;
SIGNAL \FD|ALT_INV_entra_sai_total_s~combout\ : std_logic;
SIGNAL \UC|ALT_INV_NextState~0_combout\ : std_logic;
SIGNAL \UC|ALT_INV_CurrentState.zera_vagas~q\ : std_logic;
SIGNAL \UC|ALT_INV_CurrentState.inc_idosos~q\ : std_logic;
SIGNAL \UC|ALT_INV_CurrentState.inc_normal~q\ : std_logic;
SIGNAL \FD|comp1|ALT_INV_maior_igual~2_combout\ : std_logic;
SIGNAL \FD|comp1|ALT_INV_maior_igual~1_combout\ : std_logic;
SIGNAL \FD|comp1|ALT_INV_maior_igual~0_combout\ : std_logic;
SIGNAL \FD|cont_idosos|ALT_INV_IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \FD|cont_total|ALT_INV_IQ\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_entra_sai_idosos <= entra_sai_idosos;
ww_entra_sai_normal <= entra_sai_normal;
ww_conta_idosos <= conta_idosos;
ww_conta_normal <= conta_normal;
ww_clock <= clock;
ww_clear <= clear;
ww_vagas_total <= vagas_total;
ww_vagas_load <= vagas_load;
vagas_out_total <= ww_vagas_out_total;
vagas_out_idosos <= ww_vagas_out_idosos;
cheio <= ww_cheio;
entra_sai_idosos_sm_dp <= ww_entra_sai_idosos_sm_dp;
entra_sai_normal_sm_dp <= ww_entra_sai_normal_sm_dp;
conta_idosos_sm_dp <= ww_conta_idosos_sm_dp;
conta_normal_sm_dp <= ww_conta_normal_sm_dp;
clear_sm_dp <= ww_clear_sm_dp;
cheio_dp_sm <= ww_cheio_dp_sm;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_conta_idosos~input_o\ <= NOT \conta_idosos~input_o\;
\ALT_INV_conta_normal~input_o\ <= NOT \conta_normal~input_o\;
\ALT_INV_clear~input_o\ <= NOT \clear~input_o\;
\ALT_INV_clock~input_o\ <= NOT \clock~input_o\;
\ALT_INV_entra_sai_normal~input_o\ <= NOT \entra_sai_normal~input_o\;
\ALT_INV_entra_sai_idosos~input_o\ <= NOT \entra_sai_idosos~input_o\;
\ALT_INV_vagas_total[2]~input_o\ <= NOT \vagas_total[2]~input_o\;
\ALT_INV_vagas_total[3]~input_o\ <= NOT \vagas_total[3]~input_o\;
\ALT_INV_vagas_total[0]~input_o\ <= NOT \vagas_total[0]~input_o\;
\ALT_INV_vagas_total[1]~input_o\ <= NOT \vagas_total[1]~input_o\;
\UC|ALT_INV_Selector5~0_combout\ <= NOT \UC|Selector5~0_combout\;
\UC|ALT_INV_Selector2~1_combout\ <= NOT \UC|Selector2~1_combout\;
\UC|ALT_INV_Selector2~0_combout\ <= NOT \UC|Selector2~0_combout\;
\UC|ALT_INV_Selector3~0_combout\ <= NOT \UC|Selector3~0_combout\;
\UC|ALT_INV_Selector4~0_combout\ <= NOT \UC|Selector4~0_combout\;
\UC|ALT_INV_CurrentState.cheio~q\ <= NOT \UC|CurrentState.cheio~q\;
\UC|ALT_INV_CurrentState.vazio~q\ <= NOT \UC|CurrentState.vazio~q\;
\FD|ALT_INV_entra_sai_total_s~combout\ <= NOT \FD|entra_sai_total_s~combout\;
\UC|ALT_INV_NextState~0_combout\ <= NOT \UC|NextState~0_combout\;
\UC|ALT_INV_CurrentState.zera_vagas~q\ <= NOT \UC|CurrentState.zera_vagas~q\;
\UC|ALT_INV_CurrentState.inc_idosos~q\ <= NOT \UC|CurrentState.inc_idosos~q\;
\UC|ALT_INV_CurrentState.inc_normal~q\ <= NOT \UC|CurrentState.inc_normal~q\;
\FD|comp1|ALT_INV_maior_igual~2_combout\ <= NOT \FD|comp1|maior_igual~2_combout\;
\FD|comp1|ALT_INV_maior_igual~1_combout\ <= NOT \FD|comp1|maior_igual~1_combout\;
\FD|comp1|ALT_INV_maior_igual~0_combout\ <= NOT \FD|comp1|maior_igual~0_combout\;
\FD|cont_idosos|ALT_INV_IQ\(3) <= NOT \FD|cont_idosos|IQ\(3);
\FD|cont_idosos|ALT_INV_IQ\(2) <= NOT \FD|cont_idosos|IQ\(2);
\FD|cont_idosos|ALT_INV_IQ\(1) <= NOT \FD|cont_idosos|IQ\(1);
\FD|cont_total|ALT_INV_IQ\(2) <= NOT \FD|cont_total|IQ\(2);
\FD|cont_total|ALT_INV_IQ\(3) <= NOT \FD|cont_total|IQ\(3);
\FD|cont_idosos|ALT_INV_IQ\(0) <= NOT \FD|cont_idosos|IQ\(0);
\FD|cont_total|ALT_INV_IQ\(0) <= NOT \FD|cont_total|IQ\(0);
\FD|cont_total|ALT_INV_IQ\(1) <= NOT \FD|cont_total|IQ\(1);

\vagas_out_total[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_total|IQ\(0),
	devoe => ww_devoe,
	o => \vagas_out_total[0]~output_o\);

\vagas_out_total[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_total|IQ\(1),
	devoe => ww_devoe,
	o => \vagas_out_total[1]~output_o\);

\vagas_out_total[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_total|IQ\(2),
	devoe => ww_devoe,
	o => \vagas_out_total[2]~output_o\);

\vagas_out_total[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_total|IQ\(3),
	devoe => ww_devoe,
	o => \vagas_out_total[3]~output_o\);

\vagas_out_idosos[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_idosos|IQ\(0),
	devoe => ww_devoe,
	o => \vagas_out_idosos[0]~output_o\);

\vagas_out_idosos[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_idosos|IQ\(1),
	devoe => ww_devoe,
	o => \vagas_out_idosos[1]~output_o\);

\vagas_out_idosos[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_idosos|IQ\(2),
	devoe => ww_devoe,
	o => \vagas_out_idosos[2]~output_o\);

\vagas_out_idosos[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|cont_idosos|IQ\(3),
	devoe => ww_devoe,
	o => \vagas_out_idosos[3]~output_o\);

\cheio~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|comp1|maior_igual~3_combout\,
	devoe => ww_devoe,
	o => \cheio~output_o\);

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
	o => \entra_sai_idosos_sm_dp~output_o\);

\entra_sai_normal_sm_dp~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \UC|Selector1~0_combout\,
	devoe => ww_devoe,
	o => \entra_sai_normal_sm_dp~output_o\);

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
	o => \conta_idosos_sm_dp~output_o\);

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
	o => \conta_normal_sm_dp~output_o\);

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
	o => \clear_sm_dp~output_o\);

\cheio_dp_sm~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FD|comp1|maior_igual~3_combout\,
	devoe => ww_devoe,
	o => \cheio_dp_sm~output_o\);

\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

\FD|cont_total|IQ[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_total|IQ[0]~3_combout\ = !\FD|cont_total|IQ\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_total|ALT_INV_IQ\(0),
	combout => \FD|cont_total|IQ[0]~3_combout\);

\clear~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clear,
	o => \clear~input_o\);

\entra_sai_idosos~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entra_sai_idosos,
	o => \entra_sai_idosos~input_o\);

\entra_sai_normal~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entra_sai_normal,
	o => \entra_sai_normal~input_o\);

\FD|entra_sai_total_s\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|entra_sai_total_s~combout\ = (!\entra_sai_idosos~input_o\ & ((!\entra_sai_normal~input_o\) # (!\UC|CurrentState.inc_normal~q\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010100010101000101010001010100010101000101010001010100010101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_idosos~input_o\,
	datab => \ALT_INV_entra_sai_normal~input_o\,
	datac => \UC|ALT_INV_CurrentState.inc_normal~q\,
	combout => \FD|entra_sai_total_s~combout\);

\FD|cont_total|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_total|IQ~0_combout\ = ( \FD|entra_sai_total_s~combout\ & ( !\FD|cont_total|IQ\(0) $ (\FD|cont_total|IQ\(1)) ) ) # ( !\FD|entra_sai_total_s~combout\ & ( !\FD|cont_total|IQ\(0) $ (!\FD|cont_total|IQ\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110100110011001100101100110011001101001100110011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_total|ALT_INV_IQ\(0),
	datab => \FD|cont_total|ALT_INV_IQ\(1),
	datae => \FD|ALT_INV_entra_sai_total_s~combout\,
	combout => \FD|cont_total|IQ~0_combout\);

\FD|cont_total|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \FD|cont_total|IQ~0_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \UC|NextState~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_total|IQ\(1));

\vagas_total[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total(1),
	o => \vagas_total[1]~input_o\);

\vagas_total[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total(0),
	o => \vagas_total[0]~input_o\);

\FD|comp1|maior_igual~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|comp1|maior_igual~0_combout\ = (!\FD|cont_total|IQ\(1) & (((!\FD|cont_total|IQ\(0) & \vagas_total[0]~input_o\)) # (\vagas_total[1]~input_o\))) # (\FD|cont_total|IQ\(1) & (!\FD|cont_total|IQ\(0) & (\vagas_total[1]~input_o\ & \vagas_total[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110010001110000011001000111000001100100011100000110010001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_total|ALT_INV_IQ\(0),
	datab => \FD|cont_total|ALT_INV_IQ\(1),
	datac => \ALT_INV_vagas_total[1]~input_o\,
	datad => \ALT_INV_vagas_total[0]~input_o\,
	combout => \FD|comp1|maior_igual~0_combout\);

\conta_normal~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_conta_normal,
	o => \conta_normal~input_o\);

\FD|cont_total|IQ~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_total|IQ~1_combout\ = ( \FD|entra_sai_total_s~combout\ & ( !\FD|cont_total|IQ\(2) $ (((\FD|cont_total|IQ\(1)) # (\FD|cont_total|IQ\(0)))) ) ) # ( !\FD|entra_sai_total_s~combout\ & ( !\FD|cont_total|IQ\(2) $ (((!\FD|cont_total|IQ\(0)) # 
-- (!\FD|cont_total|IQ\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111000011110100001111000011100011110000111101000011110000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_total|ALT_INV_IQ\(0),
	datab => \FD|cont_total|ALT_INV_IQ\(1),
	datac => \FD|cont_total|ALT_INV_IQ\(2),
	datae => \FD|ALT_INV_entra_sai_total_s~combout\,
	combout => \FD|cont_total|IQ~1_combout\);

\FD|cont_total|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \FD|cont_total|IQ~1_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \UC|NextState~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_total|IQ\(2));

\FD|cont_total|IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_total|IQ~2_combout\ = ( \FD|entra_sai_total_s~combout\ & ( !\FD|cont_total|IQ\(3) $ ((((\FD|cont_total|IQ\(2)) # (\FD|cont_total|IQ\(1))) # (\FD|cont_total|IQ\(0)))) ) ) # ( !\FD|entra_sai_total_s~combout\ & ( !\FD|cont_total|IQ\(3) $ 
-- (((!\FD|cont_total|IQ\(0)) # ((!\FD|cont_total|IQ\(1)) # (!\FD|cont_total|IQ\(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111110100000000111111100000001111111101000000001111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_total|ALT_INV_IQ\(0),
	datab => \FD|cont_total|ALT_INV_IQ\(1),
	datac => \FD|cont_total|ALT_INV_IQ\(2),
	datad => \FD|cont_total|ALT_INV_IQ\(3),
	datae => \FD|ALT_INV_entra_sai_total_s~combout\,
	combout => \FD|cont_total|IQ~2_combout\);

\FD|cont_total|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \FD|cont_total|IQ~2_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \UC|NextState~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_total|IQ\(3));

\vagas_total[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total(3),
	o => \vagas_total[3]~input_o\);

\vagas_total[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total(2),
	o => \vagas_total[2]~input_o\);

\FD|comp1|maior_igual~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|comp1|maior_igual~1_combout\ = (!\FD|cont_total|IQ\(2) & (!\vagas_total[2]~input_o\ & (!\FD|cont_total|IQ\(3) $ (\vagas_total[3]~input_o\)))) # (\FD|cont_total|IQ\(2) & (\vagas_total[2]~input_o\ & (!\FD|cont_total|IQ\(3) $ 
-- (\vagas_total[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001001000001100000100100000110000010010000011000001001000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_total|ALT_INV_IQ\(2),
	datab => \FD|cont_total|ALT_INV_IQ\(3),
	datac => \ALT_INV_vagas_total[3]~input_o\,
	datad => \ALT_INV_vagas_total[2]~input_o\,
	combout => \FD|comp1|maior_igual~1_combout\);

\FD|comp1|maior_igual~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|comp1|maior_igual~2_combout\ = (!\FD|cont_total|IQ\(3) & (\FD|cont_total|IQ\(2) & (!\vagas_total[3]~input_o\ & !\vagas_total[2]~input_o\))) # (\FD|cont_total|IQ\(3) & ((!\vagas_total[3]~input_o\) # ((\FD|cont_total|IQ\(2) & 
-- !\vagas_total[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000100110000011100010011000001110001001100000111000100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_total|ALT_INV_IQ\(2),
	datab => \FD|cont_total|ALT_INV_IQ\(3),
	datac => \ALT_INV_vagas_total[3]~input_o\,
	datad => \ALT_INV_vagas_total[2]~input_o\,
	combout => \FD|comp1|maior_igual~2_combout\);

\conta_idosos~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_conta_idosos,
	o => \conta_idosos~input_o\);

\UC|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector5~0_combout\ = ( \UC|CurrentState.cheio~q\ & ( (!\entra_sai_idosos~input_o\ & (!\conta_idosos~input_o\ & ((!\conta_normal~input_o\) # (\entra_sai_normal~input_o\)))) # (\entra_sai_idosos~input_o\ & (((!\conta_normal~input_o\)) # 
-- (\entra_sai_normal~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100110101000100000000000000001111001101010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_idosos~input_o\,
	datab => \ALT_INV_entra_sai_normal~input_o\,
	datac => \ALT_INV_conta_normal~input_o\,
	datad => \ALT_INV_conta_idosos~input_o\,
	datae => \UC|ALT_INV_CurrentState.cheio~q\,
	combout => \UC|Selector5~0_combout\);

\UC|Selector5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector5~1_combout\ = ( \UC|Selector5~0_combout\ ) # ( !\UC|Selector5~0_combout\ & ( (\UC|NextState~0_combout\ & (((!\FD|comp1|maior_igual~0_combout\ & \FD|comp1|maior_igual~1_combout\)) # (\FD|comp1|maior_igual~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000110011111111111111111100000010001100111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|comp1|ALT_INV_maior_igual~0_combout\,
	datab => \UC|ALT_INV_NextState~0_combout\,
	datac => \FD|comp1|ALT_INV_maior_igual~1_combout\,
	datad => \FD|comp1|ALT_INV_maior_igual~2_combout\,
	datae => \UC|ALT_INV_Selector5~0_combout\,
	combout => \UC|Selector5~1_combout\);

\UC|CurrentState.cheio\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \UC|Selector5~1_combout\,
	clrn => \ALT_INV_clear~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UC|CurrentState.cheio~q\);

\UC|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector3~0_combout\ = (\conta_idosos~input_o\ & (((!\entra_sai_idosos~input_o\ & \UC|CurrentState.cheio~q\)) # (\UC|CurrentState.vazio~q\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100100011000000110010001100000011001000110000001100100011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_idosos~input_o\,
	datab => \ALT_INV_conta_idosos~input_o\,
	datac => \UC|ALT_INV_CurrentState.vazio~q\,
	datad => \UC|ALT_INV_CurrentState.cheio~q\,
	combout => \UC|Selector3~0_combout\);

\UC|Selector3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector3~1_combout\ = ( \FD|comp1|maior_igual~2_combout\ & ( \UC|Selector3~0_combout\ ) ) # ( !\FD|comp1|maior_igual~2_combout\ & ( \UC|Selector3~0_combout\ ) ) # ( !\FD|comp1|maior_igual~2_combout\ & ( !\UC|Selector3~0_combout\ & ( 
-- (\UC|CurrentState.inc_idosos~q\ & (\conta_idosos~input_o\ & ((!\FD|comp1|maior_igual~1_combout\) # (\FD|comp1|maior_igual~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000001000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|comp1|ALT_INV_maior_igual~0_combout\,
	datab => \UC|ALT_INV_CurrentState.inc_idosos~q\,
	datac => \ALT_INV_conta_idosos~input_o\,
	datad => \FD|comp1|ALT_INV_maior_igual~1_combout\,
	datae => \FD|comp1|ALT_INV_maior_igual~2_combout\,
	dataf => \UC|ALT_INV_Selector3~0_combout\,
	combout => \UC|Selector3~1_combout\);

\UC|CurrentState.inc_idosos\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \UC|Selector3~1_combout\,
	clrn => \ALT_INV_clear~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UC|CurrentState.inc_idosos~q\);

\UC|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector2~0_combout\ = (!\UC|CurrentState.inc_normal~q\ & (\UC|CurrentState.inc_idosos~q\ & ((!\conta_idosos~input_o\)))) # (\UC|CurrentState.inc_normal~q\ & ((!\conta_normal~input_o\) # ((\UC|CurrentState.inc_idosos~q\ & !\conta_idosos~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111001101010000011100110101000001110011010100000111001101010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_CurrentState.inc_normal~q\,
	datab => \UC|ALT_INV_CurrentState.inc_idosos~q\,
	datac => \ALT_INV_conta_normal~input_o\,
	datad => \ALT_INV_conta_idosos~input_o\,
	combout => \UC|Selector2~0_combout\);

\UC|CurrentState.zera_vagas\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => VCC,
	clrn => \ALT_INV_clear~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UC|CurrentState.zera_vagas~q\);

\UC|Selector2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector2~1_combout\ = (\UC|CurrentState.zera_vagas~q\ & (((!\UC|CurrentState.vazio~q\) # (\conta_idosos~input_o\)) # (\conta_normal~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100010101010101010001010101010101000101010101010100010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_CurrentState.zera_vagas~q\,
	datab => \ALT_INV_conta_normal~input_o\,
	datac => \ALT_INV_conta_idosos~input_o\,
	datad => \UC|ALT_INV_CurrentState.vazio~q\,
	combout => \UC|Selector2~1_combout\);

\UC|Selector2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector2~2_combout\ = ( \UC|Selector2~1_combout\ & ( (\UC|Selector2~0_combout\ & (!\FD|comp1|maior_igual~2_combout\ & ((!\FD|comp1|maior_igual~1_combout\) # (\FD|comp1|maior_igual~0_combout\)))) ) ) # ( !\UC|Selector2~1_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111001100010000000011111111111111110011000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|comp1|ALT_INV_maior_igual~0_combout\,
	datab => \UC|ALT_INV_Selector2~0_combout\,
	datac => \FD|comp1|ALT_INV_maior_igual~1_combout\,
	datad => \FD|comp1|ALT_INV_maior_igual~2_combout\,
	datae => \UC|ALT_INV_Selector2~1_combout\,
	combout => \UC|Selector2~2_combout\);

\UC|CurrentState.vazio\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \UC|Selector2~2_combout\,
	clrn => \ALT_INV_clear~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UC|CurrentState.vazio~q\);

\UC|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector4~0_combout\ = ( \UC|CurrentState.vazio~q\ & ( \UC|CurrentState.cheio~q\ & ( (\conta_normal~input_o\ & ((!\conta_idosos~input_o\) # ((\entra_sai_idosos~input_o\ & !\entra_sai_normal~input_o\)))) ) ) ) # ( !\UC|CurrentState.vazio~q\ & ( 
-- \UC|CurrentState.cheio~q\ & ( (!\entra_sai_normal~input_o\ & (\conta_normal~input_o\ & ((!\conta_idosos~input_o\) # (\entra_sai_idosos~input_o\)))) ) ) ) # ( \UC|CurrentState.vazio~q\ & ( !\UC|CurrentState.cheio~q\ & ( (\conta_normal~input_o\ & 
-- !\conta_idosos~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000000000001100000001000000111100000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_idosos~input_o\,
	datab => \ALT_INV_entra_sai_normal~input_o\,
	datac => \ALT_INV_conta_normal~input_o\,
	datad => \ALT_INV_conta_idosos~input_o\,
	datae => \UC|ALT_INV_CurrentState.vazio~q\,
	dataf => \UC|ALT_INV_CurrentState.cheio~q\,
	combout => \UC|Selector4~0_combout\);

\UC|Selector4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector4~1_combout\ = ( \FD|comp1|maior_igual~2_combout\ & ( \UC|Selector4~0_combout\ ) ) # ( !\FD|comp1|maior_igual~2_combout\ & ( \UC|Selector4~0_combout\ ) ) # ( !\FD|comp1|maior_igual~2_combout\ & ( !\UC|Selector4~0_combout\ & ( 
-- (\UC|CurrentState.inc_normal~q\ & (\conta_normal~input_o\ & ((!\FD|comp1|maior_igual~1_combout\) # (\FD|comp1|maior_igual~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000001000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|comp1|ALT_INV_maior_igual~0_combout\,
	datab => \UC|ALT_INV_CurrentState.inc_normal~q\,
	datac => \ALT_INV_conta_normal~input_o\,
	datad => \FD|comp1|ALT_INV_maior_igual~1_combout\,
	datae => \FD|comp1|ALT_INV_maior_igual~2_combout\,
	dataf => \UC|ALT_INV_Selector4~0_combout\,
	combout => \UC|Selector4~1_combout\);

\UC|CurrentState.inc_normal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \UC|Selector4~1_combout\,
	clrn => \ALT_INV_clear~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UC|CurrentState.inc_normal~q\);

\UC|NextState~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|NextState~0_combout\ = (\UC|CurrentState.inc_idosos~q\) # (\UC|CurrentState.inc_normal~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111011101110111011101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \UC|ALT_INV_CurrentState.inc_normal~q\,
	datab => \UC|ALT_INV_CurrentState.inc_idosos~q\,
	combout => \UC|NextState~0_combout\);

\FD|cont_total|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \FD|cont_total|IQ[0]~3_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \UC|NextState~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_total|IQ\(0));

\FD|cont_idosos|IQ[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_idosos|IQ[0]~3_combout\ = !\FD|cont_idosos|IQ\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_idosos|ALT_INV_IQ\(0),
	combout => \FD|cont_idosos|IQ[0]~3_combout\);

\FD|cont_idosos|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \FD|cont_idosos|IQ[0]~3_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \UC|CurrentState.inc_idosos~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_idosos|IQ\(0));

\FD|cont_idosos|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_idosos|IQ~0_combout\ = ( \entra_sai_idosos~input_o\ & ( !\FD|cont_idosos|IQ\(0) $ (!\FD|cont_idosos|IQ\(1)) ) ) # ( !\entra_sai_idosos~input_o\ & ( !\FD|cont_idosos|IQ\(0) $ (\FD|cont_idosos|IQ\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001100110011001011001100110011010011001100110010110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_idosos|ALT_INV_IQ\(0),
	datab => \FD|cont_idosos|ALT_INV_IQ\(1),
	datae => \ALT_INV_entra_sai_idosos~input_o\,
	combout => \FD|cont_idosos|IQ~0_combout\);

\FD|cont_idosos|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \FD|cont_idosos|IQ~0_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \UC|CurrentState.inc_idosos~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_idosos|IQ\(1));

\FD|cont_idosos|IQ~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_idosos|IQ~1_combout\ = ( \entra_sai_idosos~input_o\ & ( !\FD|cont_idosos|IQ\(2) $ (((!\FD|cont_idosos|IQ\(0)) # (!\FD|cont_idosos|IQ\(1)))) ) ) # ( !\entra_sai_idosos~input_o\ & ( !\FD|cont_idosos|IQ\(2) $ (((\FD|cont_idosos|IQ\(1)) # 
-- (\FD|cont_idosos|IQ\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000011110000111000111100001111010000111100001110001111000011110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_idosos|ALT_INV_IQ\(0),
	datab => \FD|cont_idosos|ALT_INV_IQ\(1),
	datac => \FD|cont_idosos|ALT_INV_IQ\(2),
	datae => \ALT_INV_entra_sai_idosos~input_o\,
	combout => \FD|cont_idosos|IQ~1_combout\);

\FD|cont_idosos|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \FD|cont_idosos|IQ~1_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \UC|CurrentState.inc_idosos~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_idosos|IQ\(2));

\FD|cont_idosos|IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|cont_idosos|IQ~2_combout\ = ( \entra_sai_idosos~input_o\ & ( !\FD|cont_idosos|IQ\(3) $ (((!\FD|cont_idosos|IQ\(0)) # ((!\FD|cont_idosos|IQ\(1)) # (!\FD|cont_idosos|IQ\(2))))) ) ) # ( !\entra_sai_idosos~input_o\ & ( !\FD|cont_idosos|IQ\(3) $ 
-- ((((\FD|cont_idosos|IQ\(2)) # (\FD|cont_idosos|IQ\(1))) # (\FD|cont_idosos|IQ\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000001111111000000011111111010000000011111110000000111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|cont_idosos|ALT_INV_IQ\(0),
	datab => \FD|cont_idosos|ALT_INV_IQ\(1),
	datac => \FD|cont_idosos|ALT_INV_IQ\(2),
	datad => \FD|cont_idosos|ALT_INV_IQ\(3),
	datae => \ALT_INV_entra_sai_idosos~input_o\,
	combout => \FD|cont_idosos|IQ~2_combout\);

\FD|cont_idosos|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \FD|cont_idosos|IQ~2_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \UC|CurrentState.inc_idosos~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \FD|cont_idosos|IQ\(3));

\FD|comp1|maior_igual~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \FD|comp1|maior_igual~3_combout\ = ((!\FD|comp1|maior_igual~0_combout\ & \FD|comp1|maior_igual~1_combout\)) # (\FD|comp1|maior_igual~2_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010111100101111001011110010111100101111001011110010111100101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FD|comp1|ALT_INV_maior_igual~0_combout\,
	datab => \FD|comp1|ALT_INV_maior_igual~1_combout\,
	datac => \FD|comp1|ALT_INV_maior_igual~2_combout\,
	combout => \FD|comp1|maior_igual~3_combout\);

\UC|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \UC|Selector1~0_combout\ = (!\UC|CurrentState.inc_normal~q\ & (\entra_sai_idosos~input_o\)) # (\UC|CurrentState.inc_normal~q\ & ((\entra_sai_normal~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101001101010011010100110101001101010011010100110101001101010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_idosos~input_o\,
	datab => \ALT_INV_entra_sai_normal~input_o\,
	datac => \UC|ALT_INV_CurrentState.inc_normal~q\,
	combout => \UC|Selector1~0_combout\);

\vagas_load[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(0),
	o => \vagas_load[0]~input_o\);

\vagas_load[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(1),
	o => \vagas_load[1]~input_o\);

\vagas_load[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(2),
	o => \vagas_load[2]~input_o\);

\vagas_load[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(3),
	o => \vagas_load[3]~input_o\);

ww_vagas_out_total(0) <= \vagas_out_total[0]~output_o\;

ww_vagas_out_total(1) <= \vagas_out_total[1]~output_o\;

ww_vagas_out_total(2) <= \vagas_out_total[2]~output_o\;

ww_vagas_out_total(3) <= \vagas_out_total[3]~output_o\;

ww_vagas_out_idosos(0) <= \vagas_out_idosos[0]~output_o\;

ww_vagas_out_idosos(1) <= \vagas_out_idosos[1]~output_o\;

ww_vagas_out_idosos(2) <= \vagas_out_idosos[2]~output_o\;

ww_vagas_out_idosos(3) <= \vagas_out_idosos[3]~output_o\;

ww_cheio <= \cheio~output_o\;

ww_entra_sai_idosos_sm_dp <= \entra_sai_idosos_sm_dp~output_o\;

ww_entra_sai_normal_sm_dp <= \entra_sai_normal_sm_dp~output_o\;

ww_conta_idosos_sm_dp <= \conta_idosos_sm_dp~output_o\;

ww_conta_normal_sm_dp <= \conta_normal_sm_dp~output_o\;

ww_clear_sm_dp <= \clear_sm_dp~output_o\;

ww_cheio_dp_sm <= \cheio_dp_sm~output_o\;
END structure;


