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

-- DATE "06/03/2022 20:44:00"

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

ENTITY 	fluxo_de_dados IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	proximo : IN std_logic;
	produto_configurado : IN std_logic_vector(1 DOWNTO 0);
	setor_configurado : IN std_logic_vector(1 DOWNTO 0);
	produto_lido : IN std_logic_vector(1 DOWNTO 0);
	setor_lido : IN std_logic_vector(1 DOWNTO 0);
	setor_determinado : OUT std_logic_vector(1 DOWNTO 0);
	acionamento_setor : OUT std_logic
	);
END fluxo_de_dados;

-- Design Ports Information
-- proximo	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- setor_lido[0]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- setor_lido[1]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- setor_determinado[0]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- setor_determinado[1]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acionamento_setor	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- setor_configurado[0]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- setor_configurado[1]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- produto_configurado[1]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- produto_lido[1]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- produto_configurado[0]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- produto_lido[0]	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_J8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_H8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF fluxo_de_dados IS
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
SIGNAL ww_reset : std_logic;
SIGNAL ww_proximo : std_logic;
SIGNAL ww_produto_configurado : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_setor_configurado : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_produto_lido : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_setor_lido : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_setor_determinado : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_acionamento_setor : std_logic;
SIGNAL \proximo~input_o\ : std_logic;
SIGNAL \setor_lido[0]~input_o\ : std_logic;
SIGNAL \setor_lido[1]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \setor_configurado[0]~input_o\ : std_logic;
SIGNAL \setor_configurado[1]~input_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \produto_lido[0]~input_o\ : std_logic;
SIGNAL \produto_lido[1]~input_o\ : std_logic;
SIGNAL \produto_configurado[0]~input_o\ : std_logic;
SIGNAL \produto_configurado[1]~input_o\ : std_logic;
SIGNAL \comp|LessThan1~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \ff|Q~q\ : std_logic;
SIGNAL \ALT_INV_produto_lido[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_produto_configurado[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_produto_configurado[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_produto_lido[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_proximo <= proximo;
ww_produto_configurado <= produto_configurado;
ww_setor_configurado <= setor_configurado;
ww_produto_lido <= produto_lido;
ww_setor_lido <= setor_lido;
setor_determinado <= ww_setor_determinado;
acionamento_setor <= ww_acionamento_setor;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_produto_lido[1]~input_o\ <= NOT \produto_lido[1]~input_o\;
\ALT_INV_produto_configurado[1]~input_o\ <= NOT \produto_configurado[1]~input_o\;
\ALT_INV_produto_configurado[0]~input_o\ <= NOT \produto_configurado[0]~input_o\;
\ALT_INV_produto_lido[0]~input_o\ <= NOT \produto_lido[0]~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;

-- Location: IOOBUF_X16_Y45_N42
\setor_determinado[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \setor_configurado[0]~input_o\,
	devoe => ww_devoe,
	o => ww_setor_determinado(0));

-- Location: IOOBUF_X54_Y21_N39
\setor_determinado[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \setor_configurado[1]~input_o\,
	devoe => ww_devoe,
	o => ww_setor_determinado(1));

-- Location: IOOBUF_X22_Y45_N36
\acionamento_setor~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ff|Q~q\,
	devoe => ww_devoe,
	o => ww_acionamento_setor);

-- Location: IOIBUF_X16_Y45_N92
\setor_configurado[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_setor_configurado(0),
	o => \setor_configurado[0]~input_o\);

-- Location: IOIBUF_X54_Y21_N55
\setor_configurado[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_setor_configurado(1),
	o => \setor_configurado[1]~input_o\);

-- Location: IOIBUF_X20_Y45_N18
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: IOIBUF_X20_Y45_N1
\produto_lido[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_produto_lido(0),
	o => \produto_lido[0]~input_o\);

-- Location: IOIBUF_X20_Y45_N52
\produto_lido[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_produto_lido(1),
	o => \produto_lido[1]~input_o\);

-- Location: IOIBUF_X22_Y45_N1
\produto_configurado[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_produto_configurado(0),
	o => \produto_configurado[0]~input_o\);

-- Location: IOIBUF_X22_Y45_N18
\produto_configurado[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_produto_configurado(1),
	o => \produto_configurado[1]~input_o\);

-- Location: LABCELL_X20_Y44_N3
\comp|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comp|LessThan1~0_combout\ = ( !\produto_configurado[0]~input_o\ & ( \produto_configurado[1]~input_o\ & ( (\produto_lido[0]~input_o\ & \produto_lido[1]~input_o\) ) ) ) # ( \produto_configurado[0]~input_o\ & ( !\produto_configurado[1]~input_o\ & ( 
-- \produto_lido[1]~input_o\ ) ) ) # ( !\produto_configurado[0]~input_o\ & ( !\produto_configurado[1]~input_o\ & ( (\produto_lido[1]~input_o\) # (\produto_lido[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011111000011110000111100000101000001010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_produto_lido[0]~input_o\,
	datac => \ALT_INV_produto_lido[1]~input_o\,
	datae => \ALT_INV_produto_configurado[0]~input_o\,
	dataf => \ALT_INV_produto_configurado[1]~input_o\,
	combout => \comp|LessThan1~0_combout\);

-- Location: IOIBUF_X20_Y45_N35
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X20_Y44_N4
\ff|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \comp|LessThan1~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ff|Q~q\);

-- Location: IOIBUF_X19_Y0_N52
\proximo~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_proximo,
	o => \proximo~input_o\);

-- Location: IOIBUF_X16_Y0_N92
\setor_lido[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_setor_lido(0),
	o => \setor_lido[0]~input_o\);

-- Location: IOIBUF_X11_Y0_N18
\setor_lido[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_setor_lido(1),
	o => \setor_lido[1]~input_o\);

-- Location: MLABCELL_X4_Y27_N0
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


