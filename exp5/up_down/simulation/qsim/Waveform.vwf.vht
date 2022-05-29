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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/22/2022 13:31:53"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          up_down
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY up_down_vhd_vec_tst IS
END up_down_vhd_vec_tst;
ARCHITECTURE up_down_arch OF up_down_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL carrega : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL conta : STD_LOGIC;
SIGNAL contagem : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL entra : STD_LOGIC;
SIGNAL entrada : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL zera : STD_LOGIC;
COMPONENT up_down
	PORT (
	carrega : IN STD_LOGIC;
	clock : IN STD_LOGIC;
	conta : IN STD_LOGIC;
	contagem : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	entra : IN STD_LOGIC;
	entrada : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	zera : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : up_down
	PORT MAP (
-- list connections between master ports and signals
	carrega => carrega,
	clock => clock,
	conta => conta,
	contagem => contagem,
	entra => entra,
	entrada => entrada,
	zera => zera
	);

-- carrega
t_prcs_carrega: PROCESS
BEGIN
	carrega <= '0';
WAIT;
END PROCESS t_prcs_carrega;

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

-- conta
t_prcs_conta: PROCESS
BEGIN
	conta <= '1';
	WAIT FOR 160000 ps;
	conta <= '0';
	WAIT FOR 120000 ps;
	conta <= '1';
	WAIT FOR 120000 ps;
	conta <= '0';
	WAIT FOR 60000 ps;
	conta <= '1';
	WAIT FOR 100000 ps;
	conta <= '0';
WAIT;
END PROCESS t_prcs_conta;

-- entra
t_prcs_entra: PROCESS
BEGIN
	entra <= '1';
	WAIT FOR 160000 ps;
	entra <= '0';
	WAIT FOR 300000 ps;
	entra <= '1';
	WAIT FOR 100000 ps;
	entra <= '0';
WAIT;
END PROCESS t_prcs_entra;
-- entrada[3]
t_prcs_entrada_3: PROCESS
BEGIN
	entrada(3) <= '0';
WAIT;
END PROCESS t_prcs_entrada_3;
-- entrada[2]
t_prcs_entrada_2: PROCESS
BEGIN
	entrada(2) <= '0';
WAIT;
END PROCESS t_prcs_entrada_2;
-- entrada[1]
t_prcs_entrada_1: PROCESS
BEGIN
	entrada(1) <= '0';
WAIT;
END PROCESS t_prcs_entrada_1;
-- entrada[0]
t_prcs_entrada_0: PROCESS
BEGIN
	entrada(0) <= '0';
WAIT;
END PROCESS t_prcs_entrada_0;

-- zera
t_prcs_zera: PROCESS
BEGIN
	zera <= '0';
	WAIT FOR 600000 ps;
	zera <= '1';
	WAIT FOR 40000 ps;
	zera <= '0';
WAIT;
END PROCESS t_prcs_zera;
END up_down_arch;
