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

-- DATE "05/29/2022 21:52:40"

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

-- Design Ports Information
-- vagas_out_total[0]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_out_total[1]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_out_total[2]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_out_total[3]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_out_idosos[0]	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_out_idosos[1]	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_out_idosos[2]	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_out_idosos[3]	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cheio	=>  Location: PIN_P19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total[1]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total[0]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total[3]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total[2]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- load	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_load[0]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clear	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entra_sai_normal	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entra_sai_idosos	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- conta_normal	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- conta_idosos	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_load[1]	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_load[2]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_load[3]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \load~input_o\ : std_logic;
SIGNAL \vagas_load[0]~input_o\ : std_logic;
SIGNAL \cont_total|IQ~0_combout\ : std_logic;
SIGNAL \clear~input_o\ : std_logic;
SIGNAL \conta_normal~input_o\ : std_logic;
SIGNAL \conta_idosos~input_o\ : std_logic;
SIGNAL \cont_total|IQ[0]~1_combout\ : std_logic;
SIGNAL \entra_sai_idosos~input_o\ : std_logic;
SIGNAL \entra_sai_normal~input_o\ : std_logic;
SIGNAL \entra_sai_total_s~combout\ : std_logic;
SIGNAL \vagas_total[1]~input_o\ : std_logic;
SIGNAL \vagas_total[0]~input_o\ : std_logic;
SIGNAL \vagas_load[1]~input_o\ : std_logic;
SIGNAL \vagas_load[3]~input_o\ : std_logic;
SIGNAL \vagas_load[2]~input_o\ : std_logic;
SIGNAL \cont_total|Add0~0_combout\ : std_logic;
SIGNAL \cont_total|IQ~5_combout\ : std_logic;
SIGNAL \cont_total|Add0~1_combout\ : std_logic;
SIGNAL \cont_total|IQ~6_combout\ : std_logic;
SIGNAL \cont_total|IQ~3_combout\ : std_logic;
SIGNAL \cont_total|IQ~4_combout\ : std_logic;
SIGNAL \comp1|maior_igual~0_combout\ : std_logic;
SIGNAL \vagas_total[2]~input_o\ : std_logic;
SIGNAL \vagas_total[3]~input_o\ : std_logic;
SIGNAL \comp1|maior_igual~2_combout\ : std_logic;
SIGNAL \comp1|maior_igual~1_combout\ : std_logic;
SIGNAL \cont_total|IQ[0]~2_combout\ : std_logic;
SIGNAL \cont_idosos|IQ~0_combout\ : std_logic;
SIGNAL \cont_idosos|IQ[0]~1_combout\ : std_logic;
SIGNAL \cont_idosos|IQ~7_combout\ : std_logic;
SIGNAL \cont_idosos|IQ~6_combout\ : std_logic;
SIGNAL \cont_idosos|IQ~2_combout\ : std_logic;
SIGNAL \comp1|maior_igual~3_combout\ : std_logic;
SIGNAL \cont_total|IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \cont_idosos|IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \cont_total|ALT_INV_IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \cont_idosos|ALT_INV_IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_vagas_load[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_load[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_load[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_conta_idosos~input_o\ : std_logic;
SIGNAL \ALT_INV_conta_normal~input_o\ : std_logic;
SIGNAL \ALT_INV_entra_sai_idosos~input_o\ : std_logic;
SIGNAL \ALT_INV_entra_sai_normal~input_o\ : std_logic;
SIGNAL \ALT_INV_clear~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_load[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_load~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[1]~input_o\ : std_logic;
SIGNAL \cont_total|ALT_INV_Add0~1_combout\ : std_logic;
SIGNAL \cont_total|ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \cont_total|ALT_INV_IQ~3_combout\ : std_logic;
SIGNAL \cont_total|ALT_INV_IQ[0]~1_combout\ : std_logic;
SIGNAL \ALT_INV_entra_sai_total_s~combout\ : std_logic;
SIGNAL \comp1|ALT_INV_maior_igual~2_combout\ : std_logic;
SIGNAL \comp1|ALT_INV_maior_igual~1_combout\ : std_logic;
SIGNAL \comp1|ALT_INV_maior_igual~0_combout\ : std_logic;

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
\cont_total|ALT_INV_IQ\(3) <= NOT \cont_total|IQ\(3);
\cont_idosos|ALT_INV_IQ\(0) <= NOT \cont_idosos|IQ\(0);
\cont_idosos|ALT_INV_IQ\(1) <= NOT \cont_idosos|IQ\(1);
\cont_total|ALT_INV_IQ\(0) <= NOT \cont_total|IQ\(0);
\cont_total|ALT_INV_IQ\(1) <= NOT \cont_total|IQ\(1);
\cont_total|ALT_INV_IQ\(2) <= NOT \cont_total|IQ\(2);
\ALT_INV_vagas_load[3]~input_o\ <= NOT \vagas_load[3]~input_o\;
\ALT_INV_vagas_load[2]~input_o\ <= NOT \vagas_load[2]~input_o\;
\ALT_INV_vagas_load[1]~input_o\ <= NOT \vagas_load[1]~input_o\;
\ALT_INV_conta_idosos~input_o\ <= NOT \conta_idosos~input_o\;
\ALT_INV_conta_normal~input_o\ <= NOT \conta_normal~input_o\;
\ALT_INV_entra_sai_idosos~input_o\ <= NOT \entra_sai_idosos~input_o\;
\ALT_INV_entra_sai_normal~input_o\ <= NOT \entra_sai_normal~input_o\;
\ALT_INV_clear~input_o\ <= NOT \clear~input_o\;
\ALT_INV_vagas_load[0]~input_o\ <= NOT \vagas_load[0]~input_o\;
\ALT_INV_load~input_o\ <= NOT \load~input_o\;
\ALT_INV_vagas_total[2]~input_o\ <= NOT \vagas_total[2]~input_o\;
\ALT_INV_vagas_total[3]~input_o\ <= NOT \vagas_total[3]~input_o\;
\ALT_INV_vagas_total[0]~input_o\ <= NOT \vagas_total[0]~input_o\;
\ALT_INV_vagas_total[1]~input_o\ <= NOT \vagas_total[1]~input_o\;
\cont_total|ALT_INV_Add0~1_combout\ <= NOT \cont_total|Add0~1_combout\;
\cont_total|ALT_INV_Add0~0_combout\ <= NOT \cont_total|Add0~0_combout\;
\cont_total|ALT_INV_IQ~3_combout\ <= NOT \cont_total|IQ~3_combout\;
\cont_total|ALT_INV_IQ[0]~1_combout\ <= NOT \cont_total|IQ[0]~1_combout\;
\ALT_INV_entra_sai_total_s~combout\ <= NOT \entra_sai_total_s~combout\;
\comp1|ALT_INV_maior_igual~2_combout\ <= NOT \comp1|maior_igual~2_combout\;
\comp1|ALT_INV_maior_igual~1_combout\ <= NOT \comp1|maior_igual~1_combout\;
\comp1|ALT_INV_maior_igual~0_combout\ <= NOT \comp1|maior_igual~0_combout\;
\cont_idosos|ALT_INV_IQ\(3) <= NOT \cont_idosos|IQ\(3);
\cont_idosos|ALT_INV_IQ\(2) <= NOT \cont_idosos|IQ\(2);

-- Location: IOOBUF_X54_Y19_N5
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
	o => ww_vagas_out_total(0));

-- Location: IOOBUF_X54_Y21_N39
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
	o => ww_vagas_out_total(1));

-- Location: IOOBUF_X54_Y21_N5
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
	o => ww_vagas_out_total(2));

-- Location: IOOBUF_X54_Y20_N5
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
	o => ww_vagas_out_total(3));

-- Location: IOOBUF_X54_Y17_N22
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
	o => ww_vagas_out_idosos(0));

-- Location: IOOBUF_X54_Y16_N39
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
	o => ww_vagas_out_idosos(1));

-- Location: IOOBUF_X54_Y16_N56
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
	o => ww_vagas_out_idosos(2));

-- Location: IOOBUF_X54_Y16_N22
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
	o => ww_vagas_out_idosos(3));

-- Location: IOOBUF_X54_Y17_N39
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
	o => ww_cheio);

-- Location: IOIBUF_X54_Y18_N61
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G10
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

-- Location: IOIBUF_X54_Y20_N21
\load~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_load,
	o => \load~input_o\);

-- Location: IOIBUF_X54_Y21_N55
\vagas_load[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(0),
	o => \vagas_load[0]~input_o\);

-- Location: LABCELL_X52_Y20_N24
\cont_total|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|IQ~0_combout\ = ( \vagas_load[0]~input_o\ & ( (!\cont_total|IQ\(0)) # (\load~input_o\) ) ) # ( !\vagas_load[0]~input_o\ & ( (!\load~input_o\ & !\cont_total|IQ\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000011111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_load~input_o\,
	datad => \cont_total|ALT_INV_IQ\(0),
	dataf => \ALT_INV_vagas_load[0]~input_o\,
	combout => \cont_total|IQ~0_combout\);

-- Location: IOIBUF_X54_Y19_N21
\clear~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clear,
	o => \clear~input_o\);

-- Location: IOIBUF_X54_Y17_N4
\conta_normal~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_conta_normal,
	o => \conta_normal~input_o\);

-- Location: IOIBUF_X54_Y20_N38
\conta_idosos~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_conta_idosos,
	o => \conta_idosos~input_o\);

-- Location: LABCELL_X53_Y20_N9
\cont_total|IQ[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|IQ[0]~1_combout\ = ( !\conta_normal~input_o\ & ( !\conta_idosos~input_o\ & ( !\load~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_load~input_o\,
	datae => \ALT_INV_conta_normal~input_o\,
	dataf => \ALT_INV_conta_idosos~input_o\,
	combout => \cont_total|IQ[0]~1_combout\);

-- Location: IOIBUF_X54_Y20_N55
\entra_sai_idosos~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entra_sai_idosos,
	o => \entra_sai_idosos~input_o\);

-- Location: IOIBUF_X54_Y19_N55
\entra_sai_normal~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entra_sai_normal,
	o => \entra_sai_normal~input_o\);

-- Location: LABCELL_X53_Y20_N24
entra_sai_total_s : cyclonev_lcell_comb
-- Equation(s):
-- \entra_sai_total_s~combout\ = ( !\entra_sai_normal~input_o\ & ( !\entra_sai_idosos~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000000000000000000011110000111100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_entra_sai_idosos~input_o\,
	datae => \ALT_INV_entra_sai_normal~input_o\,
	combout => \entra_sai_total_s~combout\);

-- Location: IOIBUF_X54_Y19_N38
\vagas_total[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total(1),
	o => \vagas_total[1]~input_o\);

-- Location: IOIBUF_X54_Y18_N44
\vagas_total[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total(0),
	o => \vagas_total[0]~input_o\);

-- Location: IOIBUF_X54_Y17_N55
\vagas_load[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(1),
	o => \vagas_load[1]~input_o\);

-- Location: IOIBUF_X54_Y21_N21
\vagas_load[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(3),
	o => \vagas_load[3]~input_o\);

-- Location: IOIBUF_X54_Y18_N78
\vagas_load[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(2),
	o => \vagas_load[2]~input_o\);

-- Location: LABCELL_X53_Y20_N42
\cont_total|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|Add0~0_combout\ = ( \cont_total|IQ\(2) & ( \cont_total|IQ\(0) & ( (\cont_total|IQ\(1) & ((\entra_sai_normal~input_o\) # (\entra_sai_idosos~input_o\))) ) ) ) # ( !\cont_total|IQ\(2) & ( \cont_total|IQ\(0) & ( (!\cont_total|IQ\(1)) # 
-- ((!\entra_sai_idosos~input_o\ & !\entra_sai_normal~input_o\)) ) ) ) # ( \cont_total|IQ\(2) & ( !\cont_total|IQ\(0) & ( (!\entra_sai_idosos~input_o\ & (!\entra_sai_normal~input_o\ & !\cont_total|IQ\(1))) ) ) ) # ( !\cont_total|IQ\(2) & ( 
-- !\cont_total|IQ\(0) & ( ((\cont_total|IQ\(1)) # (\entra_sai_normal~input_o\)) # (\entra_sai_idosos~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111111111111101000000000000011111111101000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_idosos~input_o\,
	datac => \ALT_INV_entra_sai_normal~input_o\,
	datad => \cont_total|ALT_INV_IQ\(1),
	datae => \cont_total|ALT_INV_IQ\(2),
	dataf => \cont_total|ALT_INV_IQ\(0),
	combout => \cont_total|Add0~0_combout\);

-- Location: LABCELL_X52_Y20_N12
\cont_total|IQ~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|IQ~5_combout\ = ( \cont_total|IQ~3_combout\ & ( (!\load~input_o\ & (\entra_sai_total_s~combout\)) # (\load~input_o\ & ((\vagas_load[2]~input_o\))) ) ) # ( !\cont_total|IQ~3_combout\ & ( (!\load~input_o\ & ((!\cont_total|Add0~0_combout\))) # 
-- (\load~input_o\ & (\vagas_load[2]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010111100000101101011110000010100100111001001110010011100100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load~input_o\,
	datab => \ALT_INV_entra_sai_total_s~combout\,
	datac => \ALT_INV_vagas_load[2]~input_o\,
	datad => \cont_total|ALT_INV_Add0~0_combout\,
	dataf => \cont_total|ALT_INV_IQ~3_combout\,
	combout => \cont_total|IQ~5_combout\);

-- Location: FF_X52_Y20_N14
\cont_total|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \cont_total|IQ~5_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \cont_total|IQ[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_total|IQ\(2));

-- Location: LABCELL_X53_Y20_N15
\cont_total|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|Add0~1_combout\ = ( \cont_total|IQ\(2) & ( \cont_total|IQ\(0) & ( ((!\entra_sai_normal~input_o\ & !\entra_sai_idosos~input_o\)) # (\cont_total|IQ\(1)) ) ) ) # ( !\cont_total|IQ\(2) & ( \cont_total|IQ\(0) & ( (!\entra_sai_normal~input_o\ & 
-- !\entra_sai_idosos~input_o\) ) ) ) # ( \cont_total|IQ\(2) & ( !\cont_total|IQ\(0) & ( (!\entra_sai_normal~input_o\ & !\entra_sai_idosos~input_o\) ) ) ) # ( !\cont_total|IQ\(2) & ( !\cont_total|IQ\(0) & ( (!\entra_sai_normal~input_o\ & (\cont_total|IQ\(1) 
-- & !\entra_sai_idosos~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000101010100000000010101010000000001010111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_normal~input_o\,
	datac => \cont_total|ALT_INV_IQ\(1),
	datad => \ALT_INV_entra_sai_idosos~input_o\,
	datae => \cont_total|ALT_INV_IQ\(2),
	dataf => \cont_total|ALT_INV_IQ\(0),
	combout => \cont_total|Add0~1_combout\);

-- Location: LABCELL_X52_Y20_N30
\cont_total|IQ~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|IQ~6_combout\ = ( \cont_total|IQ\(3) & ( \cont_total|IQ~3_combout\ & ( (!\load~input_o\ & ((\entra_sai_total_s~combout\))) # (\load~input_o\ & (\vagas_load[3]~input_o\)) ) ) ) # ( !\cont_total|IQ\(3) & ( \cont_total|IQ~3_combout\ & ( 
-- (!\load~input_o\ & ((\entra_sai_total_s~combout\))) # (\load~input_o\ & (\vagas_load[3]~input_o\)) ) ) ) # ( \cont_total|IQ\(3) & ( !\cont_total|IQ~3_combout\ & ( (!\load~input_o\ & ((!\entra_sai_total_s~combout\ $ (\cont_total|Add0~1_combout\)))) # 
-- (\load~input_o\ & (\vagas_load[3]~input_o\)) ) ) ) # ( !\cont_total|IQ\(3) & ( !\cont_total|IQ~3_combout\ & ( (!\load~input_o\ & ((!\entra_sai_total_s~combout\ $ (!\cont_total|Add0~1_combout\)))) # (\load~input_o\ & (\vagas_load[3]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110001010101110000110101010100110011010101010011001101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_vagas_load[3]~input_o\,
	datab => \ALT_INV_entra_sai_total_s~combout\,
	datac => \cont_total|ALT_INV_Add0~1_combout\,
	datad => \ALT_INV_load~input_o\,
	datae => \cont_total|ALT_INV_IQ\(3),
	dataf => \cont_total|ALT_INV_IQ~3_combout\,
	combout => \cont_total|IQ~6_combout\);

-- Location: FF_X52_Y20_N32
\cont_total|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \cont_total|IQ~6_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \cont_total|IQ[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_total|IQ\(3));

-- Location: LABCELL_X53_Y20_N51
\cont_total|IQ~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|IQ~3_combout\ = ( \cont_total|IQ\(2) & ( \cont_total|IQ\(0) & ( (\cont_total|IQ\(1) & (\cont_total|IQ\(3) & ((\entra_sai_idosos~input_o\) # (\entra_sai_normal~input_o\)))) ) ) ) # ( !\cont_total|IQ\(2) & ( !\cont_total|IQ\(0) & ( 
-- (!\entra_sai_normal~input_o\ & (!\cont_total|IQ\(1) & (!\cont_total|IQ\(3) & !\entra_sai_idosos~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_normal~input_o\,
	datab => \cont_total|ALT_INV_IQ\(1),
	datac => \cont_total|ALT_INV_IQ\(3),
	datad => \ALT_INV_entra_sai_idosos~input_o\,
	datae => \cont_total|ALT_INV_IQ\(2),
	dataf => \cont_total|ALT_INV_IQ\(0),
	combout => \cont_total|IQ~3_combout\);

-- Location: LABCELL_X52_Y20_N0
\cont_total|IQ~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|IQ~4_combout\ = ( \cont_total|IQ\(1) & ( \cont_total|IQ\(0) & ( (!\load~input_o\ & ((\entra_sai_total_s~combout\))) # (\load~input_o\ & (\vagas_load[1]~input_o\)) ) ) ) # ( !\cont_total|IQ\(1) & ( \cont_total|IQ\(0) & ( (!\load~input_o\ & 
-- ((!\entra_sai_total_s~combout\ $ (\cont_total|IQ~3_combout\)))) # (\load~input_o\ & (\vagas_load[1]~input_o\)) ) ) ) # ( \cont_total|IQ\(1) & ( !\cont_total|IQ\(0) & ( (!\load~input_o\ & ((!\entra_sai_total_s~combout\ $ (\cont_total|IQ~3_combout\)))) # 
-- (\load~input_o\ & (\vagas_load[1]~input_o\)) ) ) ) # ( !\cont_total|IQ\(1) & ( !\cont_total|IQ\(0) & ( (!\load~input_o\ & ((\entra_sai_total_s~combout\))) # (\load~input_o\ & (\vagas_load[1]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001101010101110000110101010111000011010101010011001101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_vagas_load[1]~input_o\,
	datab => \ALT_INV_entra_sai_total_s~combout\,
	datac => \cont_total|ALT_INV_IQ~3_combout\,
	datad => \ALT_INV_load~input_o\,
	datae => \cont_total|ALT_INV_IQ\(1),
	dataf => \cont_total|ALT_INV_IQ\(0),
	combout => \cont_total|IQ~4_combout\);

-- Location: FF_X52_Y20_N2
\cont_total|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \cont_total|IQ~4_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \cont_total|IQ[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_total|IQ\(1));

-- Location: LABCELL_X52_Y20_N27
\comp1|maior_igual~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comp1|maior_igual~0_combout\ = ( \cont_total|IQ\(0) & ( (\vagas_total[1]~input_o\ & !\cont_total|IQ\(1)) ) ) # ( !\cont_total|IQ\(0) & ( (!\vagas_total[1]~input_o\ & (\vagas_total[0]~input_o\ & !\cont_total|IQ\(1))) # (\vagas_total[1]~input_o\ & 
-- ((!\cont_total|IQ\(1)) # (\vagas_total[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100000011001111110000001100110011000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_vagas_total[1]~input_o\,
	datac => \ALT_INV_vagas_total[0]~input_o\,
	datad => \cont_total|ALT_INV_IQ\(1),
	dataf => \cont_total|ALT_INV_IQ\(0),
	combout => \comp1|maior_igual~0_combout\);

-- Location: IOIBUF_X54_Y18_N95
\vagas_total[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total(2),
	o => \vagas_total[2]~input_o\);

-- Location: IOIBUF_X54_Y16_N4
\vagas_total[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total(3),
	o => \vagas_total[3]~input_o\);

-- Location: LABCELL_X52_Y20_N54
\comp1|maior_igual~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \comp1|maior_igual~2_combout\ = ( \cont_total|IQ\(2) & ( (!\vagas_total[2]~input_o\ & ((!\vagas_total[3]~input_o\) # (\cont_total|IQ\(3)))) # (\vagas_total[2]~input_o\ & (\cont_total|IQ\(3) & !\vagas_total[3]~input_o\)) ) ) # ( !\cont_total|IQ\(2) & ( 
-- (\cont_total|IQ\(3) & !\vagas_total[3]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100110000000010111011001000101011101100100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_vagas_total[2]~input_o\,
	datab => \cont_total|ALT_INV_IQ\(3),
	datad => \ALT_INV_vagas_total[3]~input_o\,
	dataf => \cont_total|ALT_INV_IQ\(2),
	combout => \comp1|maior_igual~2_combout\);

-- Location: LABCELL_X52_Y20_N57
\comp1|maior_igual~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comp1|maior_igual~1_combout\ = ( \cont_total|IQ\(2) & ( (\vagas_total[2]~input_o\ & (!\cont_total|IQ\(3) $ (\vagas_total[3]~input_o\))) ) ) # ( !\cont_total|IQ\(2) & ( (!\vagas_total[2]~input_o\ & (!\cont_total|IQ\(3) $ (\vagas_total[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000001010101000000000101001010000000001010101000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_vagas_total[2]~input_o\,
	datac => \cont_total|ALT_INV_IQ\(3),
	datad => \ALT_INV_vagas_total[3]~input_o\,
	dataf => \cont_total|ALT_INV_IQ\(2),
	combout => \comp1|maior_igual~1_combout\);

-- Location: LABCELL_X52_Y20_N48
\cont_total|IQ[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_total|IQ[0]~2_combout\ = ( \comp1|maior_igual~2_combout\ & ( \comp1|maior_igual~1_combout\ & ( (!\cont_total|IQ[0]~1_combout\ & ((\load~input_o\) # (\entra_sai_total_s~combout\))) ) ) ) # ( !\comp1|maior_igual~2_combout\ & ( 
-- \comp1|maior_igual~1_combout\ & ( (!\cont_total|IQ[0]~1_combout\ & (((\load~input_o\) # (\comp1|maior_igual~0_combout\)) # (\entra_sai_total_s~combout\))) ) ) ) # ( \comp1|maior_igual~2_combout\ & ( !\comp1|maior_igual~1_combout\ & ( 
-- (!\cont_total|IQ[0]~1_combout\ & ((\load~input_o\) # (\entra_sai_total_s~combout\))) ) ) ) # ( !\comp1|maior_igual~2_combout\ & ( !\comp1|maior_igual~1_combout\ & ( !\cont_total|IQ[0]~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010001000101010101000101010101010100010001010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cont_total|ALT_INV_IQ[0]~1_combout\,
	datab => \ALT_INV_entra_sai_total_s~combout\,
	datac => \comp1|ALT_INV_maior_igual~0_combout\,
	datad => \ALT_INV_load~input_o\,
	datae => \comp1|ALT_INV_maior_igual~2_combout\,
	dataf => \comp1|ALT_INV_maior_igual~1_combout\,
	combout => \cont_total|IQ[0]~2_combout\);

-- Location: FF_X52_Y20_N26
\cont_total|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \cont_total|IQ~0_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \cont_total|IQ[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_total|IQ\(0));

-- Location: LABCELL_X52_Y20_N42
\cont_idosos|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_idosos|IQ~0_combout\ = ( \vagas_load[0]~input_o\ & ( (!\cont_idosos|IQ\(0)) # (\load~input_o\) ) ) # ( !\vagas_load[0]~input_o\ & ( (!\load~input_o\ & !\cont_idosos|IQ\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110000000000110011000000000011111111001100111111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_load~input_o\,
	datad => \cont_idosos|ALT_INV_IQ\(0),
	dataf => \ALT_INV_vagas_load[0]~input_o\,
	combout => \cont_idosos|IQ~0_combout\);

-- Location: LABCELL_X52_Y20_N21
\cont_idosos|IQ[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_idosos|IQ[0]~1_combout\ = ( \comp1|maior_igual~2_combout\ & ( \comp1|maior_igual~1_combout\ & ( ((\conta_idosos~input_o\ & !\entra_sai_idosos~input_o\)) # (\load~input_o\) ) ) ) # ( !\comp1|maior_igual~2_combout\ & ( \comp1|maior_igual~1_combout\ & 
-- ( ((\conta_idosos~input_o\ & ((!\entra_sai_idosos~input_o\) # (\comp1|maior_igual~0_combout\)))) # (\load~input_o\) ) ) ) # ( \comp1|maior_igual~2_combout\ & ( !\comp1|maior_igual~1_combout\ & ( ((\conta_idosos~input_o\ & !\entra_sai_idosos~input_o\)) # 
-- (\load~input_o\) ) ) ) # ( !\comp1|maior_igual~2_combout\ & ( !\comp1|maior_igual~1_combout\ & ( (\conta_idosos~input_o\) # (\load~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111011101010111010101110101011101110111010101110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load~input_o\,
	datab => \ALT_INV_conta_idosos~input_o\,
	datac => \ALT_INV_entra_sai_idosos~input_o\,
	datad => \comp1|ALT_INV_maior_igual~0_combout\,
	datae => \comp1|ALT_INV_maior_igual~2_combout\,
	dataf => \comp1|ALT_INV_maior_igual~1_combout\,
	combout => \cont_idosos|IQ[0]~1_combout\);

-- Location: FF_X52_Y20_N44
\cont_idosos|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \cont_idosos|IQ~0_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \cont_idosos|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_idosos|IQ\(0));

-- Location: LABCELL_X52_Y20_N45
\cont_idosos|IQ~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_idosos|IQ~7_combout\ = ( \cont_idosos|IQ\(0) & ( (!\load~input_o\ & ((!\entra_sai_idosos~input_o\ $ (!\cont_idosos|IQ\(1))))) # (\load~input_o\ & (\vagas_load[1]~input_o\)) ) ) # ( !\cont_idosos|IQ\(0) & ( (!\load~input_o\ & 
-- ((!\entra_sai_idosos~input_o\ $ (\cont_idosos|IQ\(1))))) # (\load~input_o\ & (\vagas_load[1]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000100011101110100010001110100011101110100010001110111010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_vagas_load[1]~input_o\,
	datab => \ALT_INV_load~input_o\,
	datac => \ALT_INV_entra_sai_idosos~input_o\,
	datad => \cont_idosos|ALT_INV_IQ\(1),
	dataf => \cont_idosos|ALT_INV_IQ\(0),
	combout => \cont_idosos|IQ~7_combout\);

-- Location: FF_X52_Y20_N47
\cont_idosos|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \cont_idosos|IQ~7_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \cont_idosos|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_idosos|IQ\(1));

-- Location: LABCELL_X52_Y20_N39
\cont_idosos|IQ~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_idosos|IQ~6_combout\ = ( \cont_idosos|IQ\(2) & ( \cont_idosos|IQ\(0) & ( (!\load~input_o\ & ((!\entra_sai_idosos~input_o\) # ((!\cont_idosos|IQ\(1))))) # (\load~input_o\ & (((\vagas_load[2]~input_o\)))) ) ) ) # ( !\cont_idosos|IQ\(2) & ( 
-- \cont_idosos|IQ\(0) & ( (!\load~input_o\ & (\entra_sai_idosos~input_o\ & (\cont_idosos|IQ\(1)))) # (\load~input_o\ & (((\vagas_load[2]~input_o\)))) ) ) ) # ( \cont_idosos|IQ\(2) & ( !\cont_idosos|IQ\(0) & ( (!\load~input_o\ & (((\cont_idosos|IQ\(1))) # 
-- (\entra_sai_idosos~input_o\))) # (\load~input_o\ & (((\vagas_load[2]~input_o\)))) ) ) ) # ( !\cont_idosos|IQ\(2) & ( !\cont_idosos|IQ\(0) & ( (!\load~input_o\ & (!\entra_sai_idosos~input_o\ & (!\cont_idosos|IQ\(1)))) # (\load~input_o\ & 
-- (((\vagas_load[2]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000011010101001010100111111100000010010101111010100011111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load~input_o\,
	datab => \ALT_INV_entra_sai_idosos~input_o\,
	datac => \cont_idosos|ALT_INV_IQ\(1),
	datad => \ALT_INV_vagas_load[2]~input_o\,
	datae => \cont_idosos|ALT_INV_IQ\(2),
	dataf => \cont_idosos|ALT_INV_IQ\(0),
	combout => \cont_idosos|IQ~6_combout\);

-- Location: FF_X52_Y20_N41
\cont_idosos|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \cont_idosos|IQ~6_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \cont_idosos|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_idosos|IQ\(2));

-- Location: LABCELL_X52_Y20_N6
\cont_idosos|IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_idosos|IQ~2_combout\ = ( !\load~input_o\ & ( !\cont_idosos|IQ\(3) $ (((!\entra_sai_idosos~input_o\ & (((\cont_idosos|IQ\(0)) # (\cont_idosos|IQ\(1))) # (\cont_idosos|IQ\(2)))) # (\entra_sai_idosos~input_o\ & ((!\cont_idosos|IQ\(2)) # 
-- ((!\cont_idosos|IQ\(1)) # (!\cont_idosos|IQ\(0))))))) ) ) # ( \load~input_o\ & ( (((\vagas_load[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "1000011100001111000011110000111100001111000111100000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entra_sai_idosos~input_o\,
	datab => \cont_idosos|ALT_INV_IQ\(2),
	datac => \ALT_INV_vagas_load[3]~input_o\,
	datad => \cont_idosos|ALT_INV_IQ\(1),
	datae => \ALT_INV_load~input_o\,
	dataf => \cont_idosos|ALT_INV_IQ\(0),
	datag => \cont_idosos|ALT_INV_IQ\(3),
	combout => \cont_idosos|IQ~2_combout\);

-- Location: FF_X52_Y20_N8
\cont_idosos|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \cont_idosos|IQ~2_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \cont_idosos|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cont_idosos|IQ\(3));

-- Location: LABCELL_X52_Y20_N15
\comp1|maior_igual~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \comp1|maior_igual~3_combout\ = ( \comp1|maior_igual~1_combout\ & ( (!\comp1|maior_igual~0_combout\) # (\comp1|maior_igual~2_combout\) ) ) # ( !\comp1|maior_igual~1_combout\ & ( \comp1|maior_igual~2_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \comp1|ALT_INV_maior_igual~0_combout\,
	datad => \comp1|ALT_INV_maior_igual~2_combout\,
	dataf => \comp1|ALT_INV_maior_igual~1_combout\,
	combout => \comp1|maior_igual~3_combout\);

-- Location: MLABCELL_X37_Y41_N0
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


