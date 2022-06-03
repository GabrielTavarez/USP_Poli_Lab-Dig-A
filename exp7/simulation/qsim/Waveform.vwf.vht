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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "06/03/2022 20:43:59"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          fluxo_de_dados
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY fluxo_de_dados_vhd_vec_tst IS
END fluxo_de_dados_vhd_vec_tst;
ARCHITECTURE fluxo_de_dados_arch OF fluxo_de_dados_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL acionamento_setor : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL produto_configurado : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL produto_lido : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL proximo : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL setor_configurado : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL setor_determinado : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL setor_lido : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT fluxo_de_dados
	PORT (
	acionamento_setor : OUT STD_LOGIC;
	clock : IN STD_LOGIC;
	produto_configurado : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	produto_lido : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	proximo : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	setor_configurado : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	setor_determinado : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	setor_lido : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : fluxo_de_dados
	PORT MAP (
-- list connections between master ports and signals
	acionamento_setor => acionamento_setor,
	clock => clock,
	produto_configurado => produto_configurado,
	produto_lido => produto_lido,
	proximo => proximo,
	reset => reset,
	setor_configurado => setor_configurado,
	setor_determinado => setor_determinado,
	setor_lido => setor_lido
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
LOOP
	clock <= '0';
	WAIT FOR 20000 ps;
	clock <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clock;
-- produto_configurado[1]
t_prcs_produto_configurado_1: PROCESS
BEGIN
	produto_configurado(1) <= '0';
WAIT;
END PROCESS t_prcs_produto_configurado_1;
-- produto_configurado[0]
t_prcs_produto_configurado_0: PROCESS
BEGIN
	produto_configurado(0) <= '0';
WAIT;
END PROCESS t_prcs_produto_configurado_0;
-- produto_lido[1]
t_prcs_produto_lido_1: PROCESS
BEGIN
	produto_lido(1) <= '0';
	WAIT FOR 10000 ps;
	produto_lido(1) <= '1';
	WAIT FOR 90000 ps;
	produto_lido(1) <= '0';
WAIT;
END PROCESS t_prcs_produto_lido_1;
-- produto_lido[0]
t_prcs_produto_lido_0: PROCESS
BEGIN
	produto_lido(0) <= '0';
	WAIT FOR 10000 ps;
	produto_lido(0) <= '1';
	WAIT FOR 90000 ps;
	produto_lido(0) <= '0';
WAIT;
END PROCESS t_prcs_produto_lido_0;

-- proximo
t_prcs_proximo: PROCESS
BEGIN
	FOR i IN 1 TO 8
	LOOP
		proximo <= '0';
		WAIT FOR 60000 ps;
		proximo <= '1';
		WAIT FOR 60000 ps;
	END LOOP;
	proximo <= '0';
WAIT;
END PROCESS t_prcs_proximo;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
-- setor_configurado[1]
t_prcs_setor_configurado_1: PROCESS
BEGIN
	setor_configurado(1) <= '0';
WAIT;
END PROCESS t_prcs_setor_configurado_1;
-- setor_configurado[0]
t_prcs_setor_configurado_0: PROCESS
BEGIN
	setor_configurado(0) <= '0';
WAIT;
END PROCESS t_prcs_setor_configurado_0;
-- setor_lido[1]
t_prcs_setor_lido_1: PROCESS
BEGIN
	setor_lido(1) <= '0';
WAIT;
END PROCESS t_prcs_setor_lido_1;
-- setor_lido[0]
t_prcs_setor_lido_0: PROCESS
BEGIN
	setor_lido(0) <= '0';
WAIT;
END PROCESS t_prcs_setor_lido_0;
END fluxo_de_dados_arch;
