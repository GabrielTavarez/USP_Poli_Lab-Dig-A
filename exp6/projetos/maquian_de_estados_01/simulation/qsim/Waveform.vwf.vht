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
-- Generated on "05/29/2022 12:48:47"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          maquina_estados
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY maquina_estados_vhd_vec_tst IS
END maquina_estados_vhd_vec_tst;
ARCHITECTURE maquina_estados_arch OF maquina_estados_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL CLR : STD_LOGIC;
SIGNAL TOG_EN : STD_LOGIC;
SIGNAL Z1 : STD_LOGIC;
COMPONENT maquina_estados
	PORT (
	CLK : IN STD_LOGIC;
	CLR : IN STD_LOGIC;
	TOG_EN : IN STD_LOGIC;
	Z1 : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : maquina_estados
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	CLR => CLR,
	TOG_EN => TOG_EN,
	Z1 => Z1
	);

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 20000 ps;
	CLK <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;

-- CLR
t_prcs_CLR: PROCESS
BEGIN
	CLR <= '0';
	WAIT FOR 300000 ps;
	CLR <= '1';
	WAIT FOR 80000 ps;
	CLR <= '0';
WAIT;
END PROCESS t_prcs_CLR;

-- TOG_EN
t_prcs_TOG_EN: PROCESS
BEGIN
	TOG_EN <= '0';
	WAIT FOR 90000 ps;
	TOG_EN <= '1';
	WAIT FOR 30000 ps;
	TOG_EN <= '0';
	WAIT FOR 50000 ps;
	TOG_EN <= '1';
	WAIT FOR 30000 ps;
	TOG_EN <= '0';
	WAIT FOR 50000 ps;
	TOG_EN <= '1';
	WAIT FOR 30000 ps;
	TOG_EN <= '0';
WAIT;
END PROCESS t_prcs_TOG_EN;
END maquina_estados_arch;
