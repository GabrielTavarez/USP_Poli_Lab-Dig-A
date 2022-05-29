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

-- DATE "05/22/2022 14:41:42"

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

ENTITY 	contador_hexadecimal IS
    PORT (
	clock : IN std_logic;
	zera : IN std_logic;
	conta : IN std_logic;
	carrega : IN std_logic;
	entrada : IN std_logic_vector(3 DOWNTO 0);
	contagem : OUT std_logic_vector(3 DOWNTO 0);
	fim : OUT std_logic
	);
END contador_hexadecimal;

-- Design Ports Information
-- contagem[0]	=>  Location: PIN_R22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- contagem[1]	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- contagem[2]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- contagem[3]	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fim	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carrega	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entrada[0]	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- zera	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- conta	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entrada[1]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entrada[2]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entrada[3]	=>  Location: PIN_P19,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF contador_hexadecimal IS
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
SIGNAL ww_zera : std_logic;
SIGNAL ww_conta : std_logic;
SIGNAL ww_carrega : std_logic;
SIGNAL ww_entrada : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_contagem : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_fim : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \entrada[0]~input_o\ : std_logic;
SIGNAL \carrega~input_o\ : std_logic;
SIGNAL \IQ~0_combout\ : std_logic;
SIGNAL \zera~input_o\ : std_logic;
SIGNAL \conta~input_o\ : std_logic;
SIGNAL \IQ[0]~1_combout\ : std_logic;
SIGNAL \entrada[1]~input_o\ : std_logic;
SIGNAL \IQ~2_combout\ : std_logic;
SIGNAL \entrada[2]~input_o\ : std_logic;
SIGNAL \IQ~3_combout\ : std_logic;
SIGNAL \entrada[3]~input_o\ : std_logic;
SIGNAL \IQ~4_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL IQ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_zera~input_o\ : std_logic;
SIGNAL \ALT_INV_conta~input_o\ : std_logic;
SIGNAL \ALT_INV_entrada[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_entrada[2]~input_o\ : std_logic;
SIGNAL ALT_INV_IQ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_carrega~input_o\ : std_logic;
SIGNAL \ALT_INV_entrada[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_entrada[3]~input_o\ : std_logic;

BEGIN

ww_clock <= clock;
ww_zera <= zera;
ww_conta <= conta;
ww_carrega <= carrega;
ww_entrada <= entrada;
contagem <= ww_contagem;
fim <= ww_fim;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_zera~input_o\ <= NOT \zera~input_o\;
\ALT_INV_conta~input_o\ <= NOT \conta~input_o\;
\ALT_INV_entrada[1]~input_o\ <= NOT \entrada[1]~input_o\;
\ALT_INV_entrada[2]~input_o\ <= NOT \entrada[2]~input_o\;
ALT_INV_IQ(0) <= NOT IQ(0);
ALT_INV_IQ(1) <= NOT IQ(1);
ALT_INV_IQ(2) <= NOT IQ(2);
ALT_INV_IQ(3) <= NOT IQ(3);
\ALT_INV_carrega~input_o\ <= NOT \carrega~input_o\;
\ALT_INV_entrada[0]~input_o\ <= NOT \entrada[0]~input_o\;
\ALT_INV_entrada[3]~input_o\ <= NOT \entrada[3]~input_o\;

-- Location: IOOBUF_X54_Y15_N56
\contagem[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => IQ(0),
	devoe => ww_devoe,
	o => ww_contagem(0));

-- Location: IOOBUF_X54_Y16_N39
\contagem[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => IQ(1),
	devoe => ww_devoe,
	o => ww_contagem(1));

-- Location: IOOBUF_X54_Y19_N39
\contagem[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => IQ(2),
	devoe => ww_devoe,
	o => ww_contagem(2));

-- Location: IOOBUF_X54_Y15_N22
\contagem[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => IQ(3),
	devoe => ww_devoe,
	o => ww_contagem(3));

-- Location: IOOBUF_X54_Y15_N5
\fim~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal0~0_combout\,
	devoe => ww_devoe,
	o => ww_fim);

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

-- Location: IOIBUF_X54_Y17_N55
\entrada[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entrada(0),
	o => \entrada[0]~input_o\);

-- Location: IOIBUF_X54_Y18_N95
\carrega~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_carrega,
	o => \carrega~input_o\);

-- Location: LABCELL_X53_Y17_N39
\IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \IQ~0_combout\ = ( IQ(0) & ( (\entrada[0]~input_o\ & \carrega~input_o\) ) ) # ( !IQ(0) & ( (!\carrega~input_o\) # (\entrada[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111010111110101000001010000010111110101111101010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entrada[0]~input_o\,
	datac => \ALT_INV_carrega~input_o\,
	datae => ALT_INV_IQ(0),
	combout => \IQ~0_combout\);

-- Location: IOIBUF_X54_Y17_N21
\zera~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_zera,
	o => \zera~input_o\);

-- Location: IOIBUF_X54_Y18_N78
\conta~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_conta,
	o => \conta~input_o\);

-- Location: LABCELL_X53_Y17_N48
\IQ[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \IQ[0]~1_combout\ = ( \carrega~input_o\ & ( \conta~input_o\ ) ) # ( !\carrega~input_o\ & ( \conta~input_o\ ) ) # ( \carrega~input_o\ & ( !\conta~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_carrega~input_o\,
	dataf => \ALT_INV_conta~input_o\,
	combout => \IQ[0]~1_combout\);

-- Location: FF_X53_Y17_N41
\IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \IQ~0_combout\,
	clrn => \ALT_INV_zera~input_o\,
	ena => \IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IQ(0));

-- Location: IOIBUF_X54_Y17_N4
\entrada[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entrada(1),
	o => \entrada[1]~input_o\);

-- Location: LABCELL_X53_Y17_N12
\IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \IQ~2_combout\ = ( IQ(0) & ( (!\carrega~input_o\ & ((!IQ(1)))) # (\carrega~input_o\ & (\entrada[1]~input_o\)) ) ) # ( !IQ(0) & ( (!\carrega~input_o\ & ((IQ(1)))) # (\carrega~input_o\ & (\entrada[1]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111110011000000111111001111110011000000111111001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_entrada[1]~input_o\,
	datac => \ALT_INV_carrega~input_o\,
	datad => ALT_INV_IQ(1),
	dataf => ALT_INV_IQ(0),
	combout => \IQ~2_combout\);

-- Location: FF_X53_Y17_N14
\IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \IQ~2_combout\,
	clrn => \ALT_INV_zera~input_o\,
	ena => \IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IQ(1));

-- Location: IOIBUF_X54_Y19_N4
\entrada[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entrada(2),
	o => \entrada[2]~input_o\);

-- Location: LABCELL_X53_Y17_N33
\IQ~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \IQ~3_combout\ = ( IQ(2) & ( IQ(1) & ( (!\carrega~input_o\ & ((!IQ(0)))) # (\carrega~input_o\ & (\entrada[2]~input_o\)) ) ) ) # ( !IQ(2) & ( IQ(1) & ( (!\carrega~input_o\ & ((IQ(0)))) # (\carrega~input_o\ & (\entrada[2]~input_o\)) ) ) ) # ( IQ(2) & ( 
-- !IQ(1) & ( (!\carrega~input_o\) # (\entrada[2]~input_o\) ) ) ) # ( !IQ(2) & ( !IQ(1) & ( (\carrega~input_o\ & \entrada[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001101110111011101100011011000110111011000110110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_carrega~input_o\,
	datab => \ALT_INV_entrada[2]~input_o\,
	datac => ALT_INV_IQ(0),
	datae => ALT_INV_IQ(2),
	dataf => ALT_INV_IQ(1),
	combout => \IQ~3_combout\);

-- Location: FF_X53_Y17_N35
\IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \IQ~3_combout\,
	clrn => \ALT_INV_zera~input_o\,
	ena => \IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IQ(2));

-- Location: IOIBUF_X54_Y17_N38
\entrada[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entrada(3),
	o => \entrada[3]~input_o\);

-- Location: LABCELL_X53_Y17_N42
\IQ~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \IQ~4_combout\ = ( IQ(3) & ( IQ(1) & ( (!\carrega~input_o\ & (((!IQ(2)) # (!IQ(0))))) # (\carrega~input_o\ & (\entrada[3]~input_o\)) ) ) ) # ( !IQ(3) & ( IQ(1) & ( (!\carrega~input_o\ & (((IQ(2) & IQ(0))))) # (\carrega~input_o\ & (\entrada[3]~input_o\)) ) 
-- ) ) # ( IQ(3) & ( !IQ(1) & ( (!\carrega~input_o\) # (\entrada[3]~input_o\) ) ) ) # ( !IQ(3) & ( !IQ(1) & ( (\entrada[3]~input_o\ & \carrega~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001110111011101110100010001000111011101110111010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_entrada[3]~input_o\,
	datab => \ALT_INV_carrega~input_o\,
	datac => ALT_INV_IQ(2),
	datad => ALT_INV_IQ(0),
	datae => ALT_INV_IQ(3),
	dataf => ALT_INV_IQ(1),
	combout => \IQ~4_combout\);

-- Location: FF_X53_Y17_N44
\IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \IQ~4_combout\,
	clrn => \ALT_INV_zera~input_o\,
	ena => \IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IQ(3));

-- Location: LABCELL_X53_Y17_N15
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( IQ(3) & ( (IQ(0) & (IQ(1) & IQ(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001010000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_IQ(0),
	datac => ALT_INV_IQ(1),
	datad => ALT_INV_IQ(2),
	dataf => ALT_INV_IQ(3),
	combout => \Equal0~0_combout\);

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


