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

-- DATE "05/22/2022 14:29:21"

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
	conta : IN std_logic;
	entra_sai : IN std_logic;
	load : IN std_logic;
	vagas_total : IN std_logic_vector(3 DOWNTO 0);
	vagas_load : IN std_logic_vector(3 DOWNTO 0);
	cheio : OUT std_logic
	);
END controlador_vagas;

-- Design Ports Information
-- cheio	=>  Location: PIN_R22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total[0]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total[1]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total[2]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_total[3]	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- load	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_load[0]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clear	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- conta	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entra_sai	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_load[1]	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_load[2]	=>  Location: PIN_P19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vagas_load[3]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_conta : std_logic;
SIGNAL ww_entra_sai : std_logic;
SIGNAL ww_load : std_logic;
SIGNAL ww_vagas_total : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_vagas_load : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_cheio : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \load~input_o\ : std_logic;
SIGNAL \entra_sai~input_o\ : std_logic;
SIGNAL \vagas_load[2]~input_o\ : std_logic;
SIGNAL \vagas_load[0]~input_o\ : std_logic;
SIGNAL \contador|IQ~0_combout\ : std_logic;
SIGNAL \clear~input_o\ : std_logic;
SIGNAL \conta~input_o\ : std_logic;
SIGNAL \contador|IQ[2]~1_combout\ : std_logic;
SIGNAL \vagas_load[1]~input_o\ : std_logic;
SIGNAL \contador|IQ~2_combout\ : std_logic;
SIGNAL \contador|IQ~3_combout\ : std_logic;
SIGNAL \vagas_load[3]~input_o\ : std_logic;
SIGNAL \contador|IQ~4_combout\ : std_logic;
SIGNAL \vagas_total[2]~input_o\ : std_logic;
SIGNAL \vagas_total[3]~input_o\ : std_logic;
SIGNAL \cheio~0_combout\ : std_logic;
SIGNAL \vagas_total[0]~input_o\ : std_logic;
SIGNAL \vagas_total[1]~input_o\ : std_logic;
SIGNAL \cheio~1_combout\ : std_logic;
SIGNAL \contador|IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \contador|ALT_INV_IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_vagas_load[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_load[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_load[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_entra_sai~input_o\ : std_logic;
SIGNAL \ALT_INV_conta~input_o\ : std_logic;
SIGNAL \ALT_INV_clear~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_load[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_load~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_vagas_total[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_cheio~1_combout\ : std_logic;
SIGNAL \ALT_INV_cheio~0_combout\ : std_logic;

BEGIN

ww_clock <= clock;
ww_clear <= clear;
ww_conta <= conta;
ww_entra_sai <= entra_sai;
ww_load <= load;
ww_vagas_total <= vagas_total;
ww_vagas_load <= vagas_load;
cheio <= ww_cheio;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\contador|ALT_INV_IQ\(0) <= NOT \contador|IQ\(0);
\contador|ALT_INV_IQ\(1) <= NOT \contador|IQ\(1);
\contador|ALT_INV_IQ\(2) <= NOT \contador|IQ\(2);
\ALT_INV_vagas_load[3]~input_o\ <= NOT \vagas_load[3]~input_o\;
\ALT_INV_vagas_load[2]~input_o\ <= NOT \vagas_load[2]~input_o\;
\ALT_INV_vagas_load[1]~input_o\ <= NOT \vagas_load[1]~input_o\;
\ALT_INV_entra_sai~input_o\ <= NOT \entra_sai~input_o\;
\ALT_INV_conta~input_o\ <= NOT \conta~input_o\;
\ALT_INV_clear~input_o\ <= NOT \clear~input_o\;
\ALT_INV_vagas_load[0]~input_o\ <= NOT \vagas_load[0]~input_o\;
\ALT_INV_load~input_o\ <= NOT \load~input_o\;
\ALT_INV_vagas_total[3]~input_o\ <= NOT \vagas_total[3]~input_o\;
\ALT_INV_vagas_total[2]~input_o\ <= NOT \vagas_total[2]~input_o\;
\ALT_INV_vagas_total[1]~input_o\ <= NOT \vagas_total[1]~input_o\;
\ALT_INV_vagas_total[0]~input_o\ <= NOT \vagas_total[0]~input_o\;
\ALT_INV_cheio~1_combout\ <= NOT \cheio~1_combout\;
\ALT_INV_cheio~0_combout\ <= NOT \cheio~0_combout\;
\contador|ALT_INV_IQ\(3) <= NOT \contador|IQ\(3);

-- Location: IOOBUF_X54_Y15_N56
\cheio~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_cheio~1_combout\,
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

-- Location: IOIBUF_X54_Y19_N55
\load~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_load,
	o => \load~input_o\);

-- Location: IOIBUF_X54_Y17_N4
\entra_sai~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entra_sai,
	o => \entra_sai~input_o\);

-- Location: IOIBUF_X54_Y17_N38
\vagas_load[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(2),
	o => \vagas_load[2]~input_o\);

-- Location: IOIBUF_X54_Y19_N4
\vagas_load[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(0),
	o => \vagas_load[0]~input_o\);

-- Location: LABCELL_X53_Y17_N39
\contador|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \contador|IQ~0_combout\ = ( \contador|IQ\(0) & ( (\load~input_o\ & \vagas_load[0]~input_o\) ) ) # ( !\contador|IQ\(0) & ( (!\load~input_o\) # (\vagas_load[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010111110101111000001010000010110101111101011110000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load~input_o\,
	datac => \ALT_INV_vagas_load[0]~input_o\,
	datae => \contador|ALT_INV_IQ\(0),
	combout => \contador|IQ~0_combout\);

-- Location: IOIBUF_X54_Y17_N55
\clear~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clear,
	o => \clear~input_o\);

-- Location: IOIBUF_X54_Y15_N21
\conta~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_conta,
	o => \conta~input_o\);

-- Location: LABCELL_X53_Y17_N33
\contador|IQ[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \contador|IQ[2]~1_combout\ = (\conta~input_o\) # (\load~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011111010111110101111101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load~input_o\,
	datac => \ALT_INV_conta~input_o\,
	combout => \contador|IQ[2]~1_combout\);

-- Location: FF_X53_Y17_N41
\contador|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \contador|IQ~0_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \contador|IQ[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador|IQ\(0));

-- Location: IOIBUF_X54_Y16_N55
\vagas_load[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(1),
	o => \vagas_load[1]~input_o\);

-- Location: LABCELL_X53_Y17_N30
\contador|IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \contador|IQ~2_combout\ = ( \contador|IQ\(0) & ( (!\load~input_o\ & (!\entra_sai~input_o\ $ (((!\contador|IQ\(1)))))) # (\load~input_o\ & (((\vagas_load[1]~input_o\)))) ) ) # ( !\contador|IQ\(0) & ( (!\load~input_o\ & (!\entra_sai~input_o\ $ 
-- (((\contador|IQ\(1)))))) # (\load~input_o\ & (((\vagas_load[1]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000110100100111100011010010011100100111100011010010011110001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load~input_o\,
	datab => \ALT_INV_entra_sai~input_o\,
	datac => \ALT_INV_vagas_load[1]~input_o\,
	datad => \contador|ALT_INV_IQ\(1),
	dataf => \contador|ALT_INV_IQ\(0),
	combout => \contador|IQ~2_combout\);

-- Location: FF_X53_Y17_N32
\contador|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \contador|IQ~2_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \contador|IQ[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador|IQ\(1));

-- Location: LABCELL_X53_Y17_N54
\contador|IQ~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \contador|IQ~3_combout\ = ( \contador|IQ\(2) & ( \contador|IQ\(1) & ( (!\load~input_o\ & ((!\entra_sai~input_o\) # ((!\contador|IQ\(0))))) # (\load~input_o\ & (((\vagas_load[2]~input_o\)))) ) ) ) # ( !\contador|IQ\(2) & ( \contador|IQ\(1) & ( 
-- (!\load~input_o\ & (\entra_sai~input_o\ & ((\contador|IQ\(0))))) # (\load~input_o\ & (((\vagas_load[2]~input_o\)))) ) ) ) # ( \contador|IQ\(2) & ( !\contador|IQ\(1) & ( (!\load~input_o\ & (((\contador|IQ\(0))) # (\entra_sai~input_o\))) # (\load~input_o\ & 
-- (((\vagas_load[2]~input_o\)))) ) ) ) # ( !\contador|IQ\(2) & ( !\contador|IQ\(1) & ( (!\load~input_o\ & (!\entra_sai~input_o\ & ((!\contador|IQ\(0))))) # (\load~input_o\ & (((\vagas_load[2]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000110100000101001001111010111100000101001001111010111110001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load~input_o\,
	datab => \ALT_INV_entra_sai~input_o\,
	datac => \ALT_INV_vagas_load[2]~input_o\,
	datad => \contador|ALT_INV_IQ\(0),
	datae => \contador|ALT_INV_IQ\(2),
	dataf => \contador|ALT_INV_IQ\(1),
	combout => \contador|IQ~3_combout\);

-- Location: FF_X53_Y17_N56
\contador|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \contador|IQ~3_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \contador|IQ[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador|IQ\(2));

-- Location: IOIBUF_X54_Y18_N44
\vagas_load[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_load(3),
	o => \vagas_load[3]~input_o\);

-- Location: LABCELL_X53_Y17_N12
\contador|IQ~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \contador|IQ~4_combout\ = ( !\load~input_o\ & ( !\contador|IQ\(3) $ (((!\contador|IQ\(2) & (((\contador|IQ\(0)) # (\entra_sai~input_o\)) # (\contador|IQ\(1)))) # (\contador|IQ\(2) & ((!\contador|IQ\(1)) # ((!\entra_sai~input_o\) # (!\contador|IQ\(0))))))) 
-- ) ) # ( \load~input_o\ & ( (((\vagas_load[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "1000000000000001000011110000111101111111111111100000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \contador|ALT_INV_IQ\(2),
	datab => \contador|ALT_INV_IQ\(1),
	datac => \ALT_INV_vagas_load[3]~input_o\,
	datad => \contador|ALT_INV_IQ\(0),
	datae => \ALT_INV_load~input_o\,
	dataf => \contador|ALT_INV_IQ\(3),
	datag => \ALT_INV_entra_sai~input_o\,
	combout => \contador|IQ~4_combout\);

-- Location: FF_X53_Y17_N14
\contador|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \contador|IQ~4_combout\,
	clrn => \ALT_INV_clear~input_o\,
	ena => \contador|IQ[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador|IQ\(3));

-- Location: IOIBUF_X54_Y15_N4
\vagas_total[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total(2),
	o => \vagas_total[2]~input_o\);

-- Location: IOIBUF_X54_Y17_N21
\vagas_total[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total(3),
	o => \vagas_total[3]~input_o\);

-- Location: LABCELL_X53_Y17_N48
\cheio~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cheio~0_combout\ = ( \vagas_total[2]~input_o\ & ( \vagas_total[3]~input_o\ & ( (\contador|IQ\(3) & \contador|IQ\(2)) ) ) ) # ( !\vagas_total[2]~input_o\ & ( \vagas_total[3]~input_o\ & ( (\contador|IQ\(3) & !\contador|IQ\(2)) ) ) ) # ( 
-- \vagas_total[2]~input_o\ & ( !\vagas_total[3]~input_o\ & ( (!\contador|IQ\(3) & \contador|IQ\(2)) ) ) ) # ( !\vagas_total[2]~input_o\ & ( !\vagas_total[3]~input_o\ & ( (!\contador|IQ\(3) & !\contador|IQ\(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000000011000000110000110000001100000000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \contador|ALT_INV_IQ\(3),
	datac => \contador|ALT_INV_IQ\(2),
	datae => \ALT_INV_vagas_total[2]~input_o\,
	dataf => \ALT_INV_vagas_total[3]~input_o\,
	combout => \cheio~0_combout\);

-- Location: IOIBUF_X54_Y19_N38
\vagas_total[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total(0),
	o => \vagas_total[0]~input_o\);

-- Location: IOIBUF_X54_Y19_N21
\vagas_total[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_vagas_total(1),
	o => \vagas_total[1]~input_o\);

-- Location: LABCELL_X53_Y17_N42
\cheio~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \cheio~1_combout\ = ( \vagas_total[1]~input_o\ & ( (!\cheio~0_combout\) # ((!\contador|IQ\(1)) # (!\contador|IQ\(0) $ (!\vagas_total[0]~input_o\))) ) ) # ( !\vagas_total[1]~input_o\ & ( (!\cheio~0_combout\) # ((!\contador|IQ\(0) $ 
-- (!\vagas_total[0]~input_o\)) # (\contador|IQ\(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011111111101111101111111110111111111011111111101111101111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_cheio~0_combout\,
	datab => \contador|ALT_INV_IQ\(0),
	datac => \contador|ALT_INV_IQ\(1),
	datad => \ALT_INV_vagas_total[0]~input_o\,
	dataf => \ALT_INV_vagas_total[1]~input_o\,
	combout => \cheio~1_combout\);

-- Location: LABCELL_X41_Y8_N3
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


