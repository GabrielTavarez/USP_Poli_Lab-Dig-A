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
-- Generated on "05/22/2022 13:13:20"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          comparador
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY comparador_vhd_vec_tst IS
END comparador_vhd_vec_tst;
ARCHITECTURE comparador_arch OF comparador_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL igual : STD_LOGIC;
COMPONENT comparador
	PORT (
	A : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	igual : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : comparador
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	igual => igual
	);
-- A[1]
t_prcs_A_1: PROCESS
BEGIN
	A(1) <= '0';
	WAIT FOR 40000 ps;
	A(1) <= '1';
	WAIT FOR 40000 ps;
	A(1) <= '0';
	WAIT FOR 40000 ps;
	A(1) <= '1';
	WAIT FOR 40000 ps;
	A(1) <= '0';
WAIT;
END PROCESS t_prcs_A_1;
-- A[0]
t_prcs_A_0: PROCESS
BEGIN
	A(0) <= '0';
	WAIT FOR 40000 ps;
	A(0) <= '1';
	WAIT FOR 40000 ps;
	A(0) <= '0';
	WAIT FOR 120000 ps;
	A(0) <= '1';
	WAIT FOR 40000 ps;
	A(0) <= '0';
WAIT;
END PROCESS t_prcs_A_0;
-- B[1]
t_prcs_B_1: PROCESS
BEGIN
	B(1) <= '0';
	WAIT FOR 20000 ps;
	B(1) <= '1';
	WAIT FOR 40000 ps;
	B(1) <= '0';
	WAIT FOR 40000 ps;
	B(1) <= '1';
	WAIT FOR 40000 ps;
	B(1) <= '0';
WAIT;
END PROCESS t_prcs_B_1;
-- B[0]
t_prcs_B_0: PROCESS
BEGIN
	B(0) <= '0';
	WAIT FOR 20000 ps;
	B(0) <= '1';
	WAIT FOR 40000 ps;
	B(0) <= '0';
	WAIT FOR 140000 ps;
	B(0) <= '1';
	WAIT FOR 40000 ps;
	B(0) <= '0';
WAIT;
END PROCESS t_prcs_B_0;
END comparador_arch;
