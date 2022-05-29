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

-- DATE "05/29/2022 12:17:46"

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

ENTITY 	controlador_vagas IS
    PORT (
	clock : IN std_logic;
	clear : IN std_logic;
	conta_idosos : IN std_logic;
	conta_normal : IN std_logic;
	entra_sai_normal : IN std_logic;
	entra_sai_idosos : IN std_logic;
	load : IN std_logic;
	vagas_total : IN std_logic_vector(3 DOWNTO 0);
	vagas_load : IN std_logic_vector(3 DOWNTO 0);
	vagas_out_total : OUT std_logic_vector(3 DOWNTO 0);
	vagas_out_idosos : OUT std_logic_vector(3 DOWNTO 0);
	cheio : OUT std_logic
	);
END controlador_vagas;

ARCHITECTURE structure OF controlador_vagas IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_clear : std_logic;
SIGNAL ww_conta_idosos : std_logic;
SIGNAL ww_conta_normal : std_logic;
SIGNAL ww_entra_sai_normal : std_logic;
SIGNAL ww_entra_sai_idosos : std_logic;
SIGNAL ww_load : std_logic;
SIGNAL ww_vagas_total : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_vagas_load : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_vagas_out_total : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_vagas_out_idosos : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_cheio : std_logic;
SIGNAL \vagas_out_total[0]~output_o\ : std_logic;
SIGNAL \vagas_out_total[1]~output_o\ : std_logic;
SIGNAL \vagas_out_total[2]~output_o\ : std_logic;
SIGNAL \vagas_out_total[3]~output_o\ : std_logic;
SIGNAL \vagas_out_idosos[0]~output_o\ : std_logic;
SIGNAL \vagas_out_idosos[1]~output_o\ : std_logic;
SIGNAL \vagas_out_idosos[2]~output_o\ : std_logic;
SIGNAL \vagas_out_idosos[3]~output_o\ : std_logic;
SIGNAL \cheio~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \load~input_o\ : std_logic;
SIGNAL \vagas_load[0]~input_o\ : std_logic;
SIGNAL \cont_total|IQ~0_combout\ : std_logic;
SIGNAL \clear~input_o\ : std_logic;
SIGNAL \vagas_load[1]~input_o\ : std_logic;
SIGNAL \entra_sai_normal~input_o\ : std_logic;
SIGNAL \entra_sai_idosos~input_o\ : std_logic;
SIGNAL \entra_sai_total_s~combout\ : std_logic;
SIGNAL \vagas_load[2]~input_o\ : std_logic;
SIGNAL \cont_total|Add0~0_combout\ : std_logic;
SIGNAL \cont_total|IQ~4_combout\ : std_logic;
SIGNAL \cont_total|IQ~5_combout\ : std_logic;
SIGNAL \vagas_load[3]~input_o\ : std_logic;
SIGNAL \cont_total|IQ[3]~6_combout\ : std_logic;
SIGNAL \cont_total|IQ[3]~7_combout\ : std_logic;
SIGNAL \cont_total|IQ~2_combout\ : std_logic;
SIGNAL \cont_total|IQ~3_combout\ : std_logic;
SIGNAL \vagas_total[1]~input_o\ : std_logic;
SIGNAL \vagas_total[0]~input_o\ : std_logic;
SIGNAL \comp1|maior_igual~0_combout\ : std_logic;
SIGNAL \conta_idosos~input_o\ : std_logic;
SIGNAL \conta_normal~input_o\ : std_logic;
SIGNAL \vagas_total[3]~input_o\ : std_logic;
SIGNAL \vagas_total[2]~input_o\ : std_logic;
SIGNAL \comp1|maior_igual~1_combout\ : std_logic;
SIGNAL \comp1|maior_igual~2_combout\ : std_logic;
SIGNAL \cont_total|IQ[0]~1_combout\ : std_logic;
SIGNAL \cont_idosos|IQ~0_combout\ : std_logic;
SIGNAL \cont_idosos|IQ[0]~1_combout\ : std_logic;
SIGNAL \cont_idosos|IQ~7_combout\ : std_logic;
SIGNAL \cont_idosos|IQ~6_combout\ : std_logic;
SIGNAL \cont_idosos|IQ~2_combout\ : std_logic;
SIGNAL \comp1|maior_igual~3_combout\ : std_logic;
SIGNAL \cont_total|IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \cont_idosos|IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_vagas_load[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_load[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_entra_sai_idosos~input_o\ : std_logic;
SIGNAL \ALT_INV_entra_sai_normal~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_load[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_conta_normal~input_o\ : std_logic;
SIGNAL \ALT_INV_conta_idosos~input_o\ : std_logic;
SIGNAL \ALT_INV_clear~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_load[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_load~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[1]~input_o\ : std_logic;
SIGNAL \cont_total|ALT_INV_IQ[3]~6_combout\ : std_logic;
SIGNAL \cont_total|ALT_INV_IQ~5_combout\ : std_logic;
SIGNAL \cont_total|ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \cont_total|ALT_INV_IQ~2_combout\ : std_logic;
SIGNAL \ALT_INV_entra_sai_total_s~combout\ : std_logic;
SIGNAL \cont_total|ALT_INV_IQ[0]~1_combout\ : std_logic;
SIGNAL \comp1|ALT_INV_maior_igual~2_combout\ : std_logic;
SIGNAL \comp1|ALT_INV_maior_igual~1_combout\ : std_logic;
SIGNAL \comp1|ALT_INV_maior_igual~0_combout\ : std_logic;
SIGNAL \cont_idosos|ALT_INV_IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \cont_total|ALT_INV_IQ\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_clock <= clock;
ww_clear <= clear;
ww_conta_idosos <= conta_idosos;
ww_conta_normal <= conta_normal;
ww_entra_sai_normal <= entra_sai_normal;
ww_entra_sai_idosos <= entra_sai_idosos;
ww_load <= load;
ww_vagas_total <= vagas_total;
ww_vagas_load <= vagas_load;
vagas_out_total <= ww_vagas_out_total;
vagas_out_idosos <= ww_vagas_out_idosos;
cheio <= ww_cheio;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_vagas_load[3]~input_o\ <= NOT \vagas_load[3]~input_o\;
\ALT_INV_vagas_load[2]~input_o\ <= NOT \vagas_load[2]~input_o\;
\ALT_INV_entra_sai_idosos~input_o\ <= NOT \entra_sai_idosos~input_o\;
\ALT_INV_entra_sai_normal~input_o\ <= NOT \entra_sai_normal~input_o\;
\ALT_INV_vagas_load[1]~input_o\ <= NOT \vagas_load[1]~input_o\;
\ALT_INV_conta_normal~input_o\ <= NOT \conta_normal~input_o\;
\ALT_INV_conta_idosos~input_o\ <= NOT \conta_idosos~input_o\;
\ALT_INV_clear~input_o\ <= NOT \clear~input_o\;
\ALT_INV_vagas_load[0]~input_o\ <= NOT \vagas_load[0]~input_o\;
\ALT_INV_load~input_o\ <= NOT \load~input_o\;
\ALT_INV_vagas_total[2]~input_o\ <= NOT \vagas_total[2]~input_o\;
\ALT_INV_vagas_total[3]~input_o\ <= NOT \vagas_total[3]~input_o\;
\ALT_INV_vagas_total[0]~input_o\ <= NOT \vagas_total[0]~input_o\;
\ALT_INV_vagas_total[1]~input_o\ <= NOT \vagas_total[1]~input_o\;
\cont_total|ALT_INV_IQ[3]~6_combout\ <= NOT \cont_total|IQ[3]~6_combout\;
\cont_total|ALT_INV_IQ~5_combout\ <= NOT \cont_total|IQ~5_combout\;
\cont_total|ALT_INV_Add0~0_combout\ <= NOT \cont_total|Add0~0_combout\;
\cont_total|ALT_INV_IQ~2_combout\ <= NOT \cont_total|IQ~2_combout\;
\ALT_INV_entra_sai_total_s~combout\ <= NOT \entra_sai_total_s~combout\;
\cont_total|ALT_INV_IQ[0]~1_combout\ <= NOT \cont_total|IQ[0]~1_combout\;
\comp1|ALT_INV_maior_igual~2_combout\ <= NOT \comp1|maior_igual~2_combout\;
\comp1|ALT_INV_maior_igual~1_combout\ <= NOT \comp1|maior_igual~1_combout\;
\comp1|ALT_INV_maior_igual~0_combout\ <= NOT \comp1|maior_igual~0_combout\;
\cont_idosos|ALT_INV_IQ\(3) <= NOT \cont_idosos|IQ\(3);
\cont_idosos|ALT_INV_IQ\(2) <= NOT \cont_idosos|IQ\(2);
\cont_idosos|ALT_INV_IQ\(1) <= NOT \cont_idosos|IQ\(1);
\cont_idosos|ALT_INV_IQ\(0) <= NOT \cont_idosos|IQ\(0);
\cont_total|ALT_INV_IQ\(3) <= NOT \cont_total|IQ\(3);
\cont_total|ALT_INV_IQ\(2) <= NOT \cont_total|IQ\(2);
\cont_total|ALT_INV_IQ\(1) <= NOT \cont_total|IQ\(1);
\cont_total|ALT_INV_IQ\(0) <= NOT \cont_total|IQ\(0);

\vagas_out_total[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \cont_total|IQ\(0),
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
	i => \cont_total|IQ\(1),
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
	i => \cont_total|IQ\(2),
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
	i => \cont_total|IQ\(3),
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
	i => \cont_idosos|IQ\(0),
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
	i => \cont_idosos|IQ\(1),
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
	i => \cont_idosos|IQ\(2),
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
	i => \cont_idosos|IQ\(3),
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
	i => \comp1|maior_igual~3_combout\,
	devoe => ww_devoe,
	o => \cheio~output_o\);

\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

\load~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_load,
	o => \load~input_o\);

\vagas_load[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(0),
	o => \vagas_load[0]~input_o\);

\cont_total|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|IQ~0_combout\ = (!\load~input_o\ & (!\cont_total|IQ\(0))) # (\load~input_o\ & ((\vagas_load[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000101110001011100010111000101110001011100010111000101110001011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cont_total|ALT_INV_IQ\(0),
	datab => \ALT_INV_load~input_o\,
	datac => \ALT_INV_vagas_load[0]~input_o\,
	combout => \cont_total|IQ~0_combout\);

\clear~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clear,
	o => \clear~input_o\);

\vagas_load[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(1),
	o => \vagas_load[1]~input_o\);

\entra_sai_normal~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entra_sai_normal,
	o => \entra_sai_normal~input_o\);

\entra_sai_idosos~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entra_sai_idosos,
	o => \entra_sai_idosos~input_o\);

entra_sai_total_s : cyclonev_lcell_comb
-- Equation(s):
-- \entra_sai_total_s~combout\ = (!\entra_sai_normal~input_o\ & !\entra_sai_idosos~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_normal~input_o\,
	datab => \ALT_INV_entra_sai_idosos~input_o\,
	combout => \entra_sai_total_s~combout\);

\vagas_load[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(2),
	o => \vagas_load[2]~input_o\);

\cont_total|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|Add0~0_combout\ = ( \entra_sai_idosos~input_o\ & ( !\cont_total|IQ\(2) $ (((\cont_total|IQ\(0) & \cont_total|IQ\(1)))) ) ) # ( !\entra_sai_idosos~input_o\ & ( !\cont_total|IQ\(2) $ (((!\cont_total|IQ\(0) & (!\cont_total|IQ\(1) & 
-- !\entra_sai_normal~input_o\)) # (\cont_total|IQ\(0) & (\cont_total|IQ\(1) & \entra_sai_normal~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111100011100001111000011110000101111000111000011110000111100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cont_total|ALT_INV_IQ\(0),
	datab => \cont_total|ALT_INV_IQ\(1),
	datac => \cont_total|ALT_INV_IQ\(2),
	datad => \ALT_INV_entra_sai_normal~input_o\,
	datae => \ALT_INV_entra_sai_idosos~input_o\,
	combout => \cont_total|Add0~0_combout\);

\cont_total|IQ~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|IQ~4_combout\ = ( \cont_total|Add0~0_combout\ & ( (!\load~input_o\ & (\entra_sai_total_s~combout\ & (\cont_total|IQ~2_combout\))) # (\load~input_o\ & (((\vagas_load[2]~input_o\)))) ) ) # ( !\cont_total|Add0~0_combout\ & ( (!\load~input_o\ & 
-- (((!\cont_total|IQ~2_combout\)) # (\entra_sai_total_s~combout\))) # (\load~input_o\ & (((\vagas_load[2]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010001011110111000000100101011110100010111101110000001001010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load~input_o\,
	datab => \ALT_INV_entra_sai_total_s~combout\,
	datac => \cont_total|ALT_INV_IQ~2_combout\,
	datad => \ALT_INV_vagas_load[2]~input_o\,
	datae => \cont_total|ALT_INV_Add0~0_combout\,
	combout => \cont_total|IQ~4_combout\);

\cont_total|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont_total|IQ~4_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \cont_total|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_total|IQ\(2));

\cont_total|IQ~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|IQ~5_combout\ = ( \entra_sai_normal~input_o\ & ( \entra_sai_idosos~input_o\ & ( (\cont_total|IQ\(0) & (\cont_total|IQ\(1) & (\cont_total|IQ\(2) & \cont_total|IQ\(3)))) ) ) ) # ( !\entra_sai_normal~input_o\ & ( \entra_sai_idosos~input_o\ & ( 
-- (\cont_total|IQ\(0) & (\cont_total|IQ\(1) & (\cont_total|IQ\(2) & \cont_total|IQ\(3)))) ) ) ) # ( \entra_sai_normal~input_o\ & ( !\entra_sai_idosos~input_o\ & ( (\cont_total|IQ\(0) & (\cont_total|IQ\(1) & (\cont_total|IQ\(2) & \cont_total|IQ\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cont_total|ALT_INV_IQ\(0),
	datab => \cont_total|ALT_INV_IQ\(1),
	datac => \cont_total|ALT_INV_IQ\(2),
	datad => \cont_total|ALT_INV_IQ\(3),
	datae => \ALT_INV_entra_sai_normal~input_o\,
	dataf => \ALT_INV_entra_sai_idosos~input_o\,
	combout => \cont_total|IQ~5_combout\);

\vagas_load[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(3),
	o => \vagas_load[3]~input_o\);

\cont_total|IQ[3]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|IQ[3]~6_combout\ = ( \entra_sai_normal~input_o\ & ( \entra_sai_idosos~input_o\ & ( (!\cont_total|IQ\(3) & ((!\cont_total|IQ\(0)) # ((!\cont_total|IQ\(1)) # (!\cont_total|IQ\(2))))) ) ) ) # ( !\entra_sai_normal~input_o\ & ( 
-- \entra_sai_idosos~input_o\ & ( (!\cont_total|IQ\(3) & ((!\cont_total|IQ\(0)) # ((!\cont_total|IQ\(1)) # (!\cont_total|IQ\(2))))) ) ) ) # ( \entra_sai_normal~input_o\ & ( !\entra_sai_idosos~input_o\ & ( (!\cont_total|IQ\(3) & ((!\cont_total|IQ\(0)) # 
-- ((!\cont_total|IQ\(1)) # (!\cont_total|IQ\(2))))) ) ) ) # ( !\entra_sai_normal~input_o\ & ( !\entra_sai_idosos~input_o\ & ( !\cont_total|IQ\(3) $ (((!\cont_total|IQ\(0) & (!\cont_total|IQ\(1) & !\cont_total|IQ\(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111110000000111111100000000011111110000000001111111000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cont_total|ALT_INV_IQ\(0),
	datab => \cont_total|ALT_INV_IQ\(1),
	datac => \cont_total|ALT_INV_IQ\(2),
	datad => \cont_total|ALT_INV_IQ\(3),
	datae => \ALT_INV_entra_sai_normal~input_o\,
	dataf => \ALT_INV_entra_sai_idosos~input_o\,
	combout => \cont_total|IQ[3]~6_combout\);

\cont_total|IQ[3]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|IQ[3]~7_combout\ = ( \vagas_load[3]~input_o\ & ( \cont_total|IQ[3]~6_combout\ & ( ((\cont_total|IQ\(3) & !\cont_total|IQ[0]~1_combout\)) # (\load~input_o\) ) ) ) # ( !\vagas_load[3]~input_o\ & ( \cont_total|IQ[3]~6_combout\ & ( 
-- (\cont_total|IQ\(3) & !\cont_total|IQ[0]~1_combout\) ) ) ) # ( \vagas_load[3]~input_o\ & ( !\cont_total|IQ[3]~6_combout\ & ( ((!\cont_total|IQ[0]~1_combout\ & (\cont_total|IQ\(3))) # (\cont_total|IQ[0]~1_combout\ & ((!\cont_total|IQ~5_combout\)))) # 
-- (\load~input_o\) ) ) ) # ( !\vagas_load[3]~input_o\ & ( !\cont_total|IQ[3]~6_combout\ & ( (!\cont_total|IQ[0]~1_combout\ & (\cont_total|IQ\(3))) # (\cont_total|IQ[0]~1_combout\ & (((!\load~input_o\ & !\cont_total|IQ~5_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101110001010000011111110111001101010000010100000111001101110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cont_total|ALT_INV_IQ\(3),
	datab => \ALT_INV_load~input_o\,
	datac => \cont_total|ALT_INV_IQ[0]~1_combout\,
	datad => \cont_total|ALT_INV_IQ~5_combout\,
	datae => \ALT_INV_vagas_load[3]~input_o\,
	dataf => \cont_total|ALT_INV_IQ[3]~6_combout\,
	combout => \cont_total|IQ[3]~7_combout\);

\cont_total|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont_total|IQ[3]~7_combout\,
	clrn => \ALT_INV_clear~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_total|IQ\(3));

\cont_total|IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|IQ~2_combout\ = ( \entra_sai_normal~input_o\ & ( \entra_sai_idosos~input_o\ & ( (\cont_total|IQ\(0) & (\cont_total|IQ\(1) & (\cont_total|IQ\(2) & \cont_total|IQ\(3)))) ) ) ) # ( !\entra_sai_normal~input_o\ & ( \entra_sai_idosos~input_o\ & ( 
-- (\cont_total|IQ\(0) & (\cont_total|IQ\(1) & (\cont_total|IQ\(2) & \cont_total|IQ\(3)))) ) ) ) # ( \entra_sai_normal~input_o\ & ( !\entra_sai_idosos~input_o\ & ( (\cont_total|IQ\(0) & (\cont_total|IQ\(1) & (\cont_total|IQ\(2) & \cont_total|IQ\(3)))) ) ) ) 
-- # ( !\entra_sai_normal~input_o\ & ( !\entra_sai_idosos~input_o\ & ( (!\cont_total|IQ\(0) & (!\cont_total|IQ\(1) & (!\cont_total|IQ\(2) & !\cont_total|IQ\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cont_total|ALT_INV_IQ\(0),
	datab => \cont_total|ALT_INV_IQ\(1),
	datac => \cont_total|ALT_INV_IQ\(2),
	datad => \cont_total|ALT_INV_IQ\(3),
	datae => \ALT_INV_entra_sai_normal~input_o\,
	dataf => \ALT_INV_entra_sai_idosos~input_o\,
	combout => \cont_total|IQ~2_combout\);

\cont_total|IQ~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|IQ~3_combout\ = ( \entra_sai_total_s~combout\ & ( \cont_total|IQ~2_combout\ & ( (!\load~input_o\) # (\vagas_load[1]~input_o\) ) ) ) # ( !\entra_sai_total_s~combout\ & ( \cont_total|IQ~2_combout\ & ( (\load~input_o\ & \vagas_load[1]~input_o\) ) 
-- ) ) # ( \entra_sai_total_s~combout\ & ( !\cont_total|IQ~2_combout\ & ( (!\load~input_o\ & (!\cont_total|IQ\(0) $ ((\cont_total|IQ\(1))))) # (\load~input_o\ & (((\vagas_load[1]~input_o\)))) ) ) ) # ( !\entra_sai_total_s~combout\ & ( 
-- !\cont_total|IQ~2_combout\ & ( (!\load~input_o\ & (!\cont_total|IQ\(0) $ ((!\cont_total|IQ\(1))))) # (\load~input_o\ & (((\vagas_load[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110000001101111100100001001111100000000000011111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cont_total|ALT_INV_IQ\(0),
	datab => \cont_total|ALT_INV_IQ\(1),
	datac => \ALT_INV_load~input_o\,
	datad => \ALT_INV_vagas_load[1]~input_o\,
	datae => \ALT_INV_entra_sai_total_s~combout\,
	dataf => \cont_total|ALT_INV_IQ~2_combout\,
	combout => \cont_total|IQ~3_combout\);

\cont_total|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont_total|IQ~3_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \cont_total|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_total|IQ\(1));

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

\comp1|maior_igual~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comp1|maior_igual~0_combout\ = (!\cont_total|IQ\(1) & (((!\cont_total|IQ\(0) & \vagas_total[0]~input_o\)) # (\vagas_total[1]~input_o\))) # (\cont_total|IQ\(1) & (!\cont_total|IQ\(0) & (\vagas_total[1]~input_o\ & \vagas_total[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110010001110000011001000111000001100100011100000110010001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cont_total|ALT_INV_IQ\(0),
	datab => \cont_total|ALT_INV_IQ\(1),
	datac => \ALT_INV_vagas_total[1]~input_o\,
	datad => \ALT_INV_vagas_total[0]~input_o\,
	combout => \comp1|maior_igual~0_combout\);

\conta_idosos~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_conta_idosos,
	o => \conta_idosos~input_o\);

\conta_normal~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_conta_normal,
	o => \conta_normal~input_o\);

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

\comp1|maior_igual~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comp1|maior_igual~1_combout\ = (!\cont_total|IQ\(2) & (!\vagas_total[2]~input_o\ & (!\cont_total|IQ\(3) $ (\vagas_total[3]~input_o\)))) # (\cont_total|IQ\(2) & (\vagas_total[2]~input_o\ & (!\cont_total|IQ\(3) $ (\vagas_total[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001001000001100000100100000110000010010000011000001001000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cont_total|ALT_INV_IQ\(2),
	datab => \cont_total|ALT_INV_IQ\(3),
	datac => \ALT_INV_vagas_total[3]~input_o\,
	datad => \ALT_INV_vagas_total[2]~input_o\,
	combout => \comp1|maior_igual~1_combout\);

\comp1|maior_igual~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \comp1|maior_igual~2_combout\ = (!\cont_total|IQ\(3) & (\cont_total|IQ\(2) & (!\vagas_total[3]~input_o\ & !\vagas_total[2]~input_o\))) # (\cont_total|IQ\(3) & ((!\vagas_total[3]~input_o\) # ((\cont_total|IQ\(2) & !\vagas_total[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000100110000011100010011000001110001001100000111000100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cont_total|ALT_INV_IQ\(2),
	datab => \cont_total|ALT_INV_IQ\(3),
	datac => \ALT_INV_vagas_total[3]~input_o\,
	datad => \ALT_INV_vagas_total[2]~input_o\,
	combout => \comp1|maior_igual~2_combout\);

\cont_total|IQ[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|IQ[0]~1_combout\ = ( \comp1|maior_igual~1_combout\ & ( \comp1|maior_igual~2_combout\ & ( \load~input_o\ ) ) ) # ( !\comp1|maior_igual~1_combout\ & ( \comp1|maior_igual~2_combout\ & ( \load~input_o\ ) ) ) # ( \comp1|maior_igual~1_combout\ & ( 
-- !\comp1|maior_igual~2_combout\ & ( ((\comp1|maior_igual~0_combout\ & ((\conta_normal~input_o\) # (\conta_idosos~input_o\)))) # (\load~input_o\) ) ) ) # ( !\comp1|maior_igual~1_combout\ & ( !\comp1|maior_igual~2_combout\ & ( ((\conta_normal~input_o\) # 
-- (\conta_idosos~input_o\)) # (\load~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111111111111001101110111011100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comp1|ALT_INV_maior_igual~0_combout\,
	datab => \ALT_INV_load~input_o\,
	datac => \ALT_INV_conta_idosos~input_o\,
	datad => \ALT_INV_conta_normal~input_o\,
	datae => \comp1|ALT_INV_maior_igual~1_combout\,
	dataf => \comp1|ALT_INV_maior_igual~2_combout\,
	combout => \cont_total|IQ[0]~1_combout\);

\cont_total|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont_total|IQ~0_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \cont_total|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_total|IQ\(0));

\cont_idosos|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_idosos|IQ~0_combout\ = (!\load~input_o\ & (!\cont_idosos|IQ\(0))) # (\load~input_o\ & ((\vagas_load[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000101110001011100010111000101110001011100010111000101110001011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cont_idosos|ALT_INV_IQ\(0),
	datab => \ALT_INV_load~input_o\,
	datac => \ALT_INV_vagas_load[0]~input_o\,
	combout => \cont_idosos|IQ~0_combout\);

\cont_idosos|IQ[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_idosos|IQ[0]~1_combout\ = (\conta_idosos~input_o\) # (\load~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111011101110111011101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load~input_o\,
	datab => \ALT_INV_conta_idosos~input_o\,
	combout => \cont_idosos|IQ[0]~1_combout\);

\cont_idosos|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont_idosos|IQ~0_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \cont_idosos|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_idosos|IQ\(0));

\cont_idosos|IQ~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_idosos|IQ~7_combout\ = ( \cont_idosos|IQ\(0) & ( (!\load~input_o\ & (!\entra_sai_idosos~input_o\ $ (((!\cont_idosos|IQ\(1)))))) # (\load~input_o\ & (((\vagas_load[1]~input_o\)))) ) ) # ( !\cont_idosos|IQ\(0) & ( (!\load~input_o\ & 
-- (!\entra_sai_idosos~input_o\ $ (((\cont_idosos|IQ\(1)))))) # (\load~input_o\ & (((\vagas_load[1]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010001101010011010100111010001110100011010100110101001110100011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_idosos~input_o\,
	datab => \ALT_INV_vagas_load[1]~input_o\,
	datac => \ALT_INV_load~input_o\,
	datad => \cont_idosos|ALT_INV_IQ\(1),
	datae => \cont_idosos|ALT_INV_IQ\(0),
	combout => \cont_idosos|IQ~7_combout\);

\cont_idosos|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont_idosos|IQ~7_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \cont_idosos|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_idosos|IQ\(1));

\cont_idosos|IQ~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_idosos|IQ~6_combout\ = ( \entra_sai_idosos~input_o\ & ( \load~input_o\ & ( \vagas_load[2]~input_o\ ) ) ) # ( !\entra_sai_idosos~input_o\ & ( \load~input_o\ & ( \vagas_load[2]~input_o\ ) ) ) # ( \entra_sai_idosos~input_o\ & ( !\load~input_o\ & ( 
-- !\cont_idosos|IQ\(2) $ (((!\cont_idosos|IQ\(1)) # (!\cont_idosos|IQ\(0)))) ) ) ) # ( !\entra_sai_idosos~input_o\ & ( !\load~input_o\ & ( !\cont_idosos|IQ\(2) $ (((\cont_idosos|IQ\(0)) # (\cont_idosos|IQ\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001010110010101010101100101011000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cont_idosos|ALT_INV_IQ\(2),
	datab => \cont_idosos|ALT_INV_IQ\(1),
	datac => \cont_idosos|ALT_INV_IQ\(0),
	datad => \ALT_INV_vagas_load[2]~input_o\,
	datae => \ALT_INV_entra_sai_idosos~input_o\,
	dataf => \ALT_INV_load~input_o\,
	combout => \cont_idosos|IQ~6_combout\);

\cont_idosos|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont_idosos|IQ~6_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \cont_idosos|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_idosos|IQ\(2));

\cont_idosos|IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_idosos|IQ~2_combout\ = ( !\load~input_o\ & ( !\cont_idosos|IQ\(3) $ (((!\cont_idosos|IQ\(2) & (((\entra_sai_idosos~input_o\) # (\cont_idosos|IQ\(0))) # (\cont_idosos|IQ\(1)))) # (\cont_idosos|IQ\(2) & ((!\cont_idosos|IQ\(1)) # 
-- ((!\cont_idosos|IQ\(0)) # (!\entra_sai_idosos~input_o\)))))) ) ) # ( \load~input_o\ & ( (((\vagas_load[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "1000011100001111000011110000111100001111000111100000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cont_idosos|ALT_INV_IQ\(2),
	datab => \cont_idosos|ALT_INV_IQ\(1),
	datac => \ALT_INV_vagas_load[3]~input_o\,
	datad => \cont_idosos|ALT_INV_IQ\(0),
	datae => \ALT_INV_load~input_o\,
	dataf => \ALT_INV_entra_sai_idosos~input_o\,
	datag => \cont_idosos|ALT_INV_IQ\(3),
	combout => \cont_idosos|IQ~2_combout\);

\cont_idosos|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \cont_idosos|IQ~2_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \cont_idosos|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_idosos|IQ\(3));

\comp1|maior_igual~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \comp1|maior_igual~3_combout\ = ((!\comp1|maior_igual~0_combout\ & \comp1|maior_igual~1_combout\)) # (\comp1|maior_igual~2_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010111100101111001011110010111100101111001011110010111100101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \comp1|ALT_INV_maior_igual~0_combout\,
	datab => \comp1|ALT_INV_maior_igual~1_combout\,
	datac => \comp1|ALT_INV_maior_igual~2_combout\,
	combout => \comp1|maior_igual~3_combout\);

ww_vagas_out_total(0) <= \vagas_out_total[0]~output_o\;

ww_vagas_out_total(1) <= \vagas_out_total[1]~output_o\;

ww_vagas_out_total(2) <= \vagas_out_total[2]~output_o\;

ww_vagas_out_total(3) <= \vagas_out_total[3]~output_o\;

ww_vagas_out_idosos(0) <= \vagas_out_idosos[0]~output_o\;

ww_vagas_out_idosos(1) <= \vagas_out_idosos[1]~output_o\;

ww_vagas_out_idosos(2) <= \vagas_out_idosos[2]~output_o\;

ww_vagas_out_idosos(3) <= \vagas_out_idosos[3]~output_o\;

ww_cheio <= \cheio~output_o\;
END structure;


