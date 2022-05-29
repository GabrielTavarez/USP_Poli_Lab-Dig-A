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

-- DATE "05/29/2022 12:48:52"

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

ENTITY 	maquina_estados IS
    PORT (
	TOG_EN : IN std_logic;
	CLK : IN std_logic;
	CLR : IN std_logic;
	Z1 : OUT std_logic
	);
END maquina_estados;

-- Design Ports Information
-- Z1	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TOG_EN	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLR	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF maquina_estados IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_TOG_EN : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_CLR : std_logic;
SIGNAL ww_Z1 : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \TOG_EN~input_o\ : std_logic;
SIGNAL \PS.ST0~0_combout\ : std_logic;
SIGNAL \PS.ST0~feeder_combout\ : std_logic;
SIGNAL \CLR~input_o\ : std_logic;
SIGNAL \PS.ST0~q\ : std_logic;
SIGNAL \ALT_INV_CLR~input_o\ : std_logic;
SIGNAL \ALT_INV_TOG_EN~input_o\ : std_logic;
SIGNAL \ALT_INV_PS.ST0~0_combout\ : std_logic;
SIGNAL \ALT_INV_PS.ST0~q\ : std_logic;

BEGIN

ww_TOG_EN <= TOG_EN;
ww_CLK <= CLK;
ww_CLR <= CLR;
Z1 <= ww_Z1;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_CLR~input_o\ <= NOT \CLR~input_o\;
\ALT_INV_TOG_EN~input_o\ <= NOT \TOG_EN~input_o\;
\ALT_INV_PS.ST0~0_combout\ <= NOT \PS.ST0~0_combout\;
\ALT_INV_PS.ST0~q\ <= NOT \PS.ST0~q\;

-- Location: IOOBUF_X54_Y16_N39
\Z1~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PS.ST0~q\,
	devoe => ww_devoe,
	o => ww_Z1);

-- Location: IOIBUF_X54_Y16_N4
\CLK~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: IOIBUF_X54_Y16_N21
\TOG_EN~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TOG_EN,
	o => \TOG_EN~input_o\);

-- Location: LABCELL_X53_Y16_N51
\PS.ST0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \PS.ST0~0_combout\ = ( !\TOG_EN~input_o\ & ( \PS.ST0~q\ ) ) # ( \TOG_EN~input_o\ & ( !\PS.ST0~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_TOG_EN~input_o\,
	dataf => \ALT_INV_PS.ST0~q\,
	combout => \PS.ST0~0_combout\);

-- Location: LABCELL_X53_Y16_N18
\PS.ST0~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \PS.ST0~feeder_combout\ = ( \PS.ST0~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_PS.ST0~0_combout\,
	combout => \PS.ST0~feeder_combout\);

-- Location: IOIBUF_X54_Y16_N55
\CLR~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLR,
	o => \CLR~input_o\);

-- Location: FF_X53_Y16_N20
\PS.ST0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \PS.ST0~feeder_combout\,
	clrn => \ALT_INV_CLR~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PS.ST0~q\);

-- Location: MLABCELL_X42_Y30_N0
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


