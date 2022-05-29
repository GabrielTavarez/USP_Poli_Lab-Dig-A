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
-- Generated on "05/22/2022 14:41:37"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          contador_hexadecimal
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY contador_hexadecimal_vhd_vec_tst IS
END contador_hexadecimal_vhd_vec_tst;
ARCHITECTURE contador_hexadecimal_arch OF contador_hexadecimal_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL carrega : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL conta : STD_LOGIC;
SIGNAL contagem : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL entrada : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL fim : STD_LOGIC;
SIGNAL zera : STD_LOGIC;
COMPONENT contador_hexadecimal
	PORT (
	carrega : IN STD_LOGIC;
	clock : IN STD_LOGIC;
	conta : IN STD_LOGIC;
	contagem : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	entrada : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	fim : OUT STD_LOGIC;
	zera : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : contador_hexadecimal
	PORT MAP (
-- list connections between master ports and signals
	carrega => carrega,
	clock => clock,
	conta => conta,
	contagem => contagem,
	entrada => entrada,
	fim => fim,
	zera => zera
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

-- conta
t_prcs_conta: PROCESS
BEGIN
	conta <= '1';
	WAIT FOR 290000 ps;
	conta <= '0';
	WAIT FOR 190000 ps;
	conta <= '1';
WAIT;
END PROCESS t_prcs_conta;

-- carrega
t_prcs_carrega: PROCESS
BEGIN
	carrega <= '0';
	WAIT FOR 330000 ps;
	carrega <= '1';
	WAIT FOR 60000 ps;
	carrega <= '0';
WAIT;
END PROCESS t_prcs_carrega;
-- entrada[3]
t_prcs_entrada_3: PROCESS
BEGIN
	entrada(3) <= '1';
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
	entrada(1) <= '1';
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
	WAIT FOR 770000 ps;
	zera <= '1';
	WAIT FOR 80000 ps;
	zera <= '0';
WAIT;
END PROCESS t_prcs_zera;
END contador_hexadecimal_arch;
