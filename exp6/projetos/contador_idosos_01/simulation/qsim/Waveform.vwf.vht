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
-- Generated on "05/29/2022 12:17:42"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          controlador_vagas
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY controlador_vagas_vhd_vec_tst IS
END controlador_vagas_vhd_vec_tst;
ARCHITECTURE controlador_vagas_arch OF controlador_vagas_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL cheio : STD_LOGIC;
SIGNAL clear : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL conta_idosos : STD_LOGIC;
SIGNAL conta_normal : STD_LOGIC;
SIGNAL entra_sai_idosos : STD_LOGIC;
SIGNAL entra_sai_normal : STD_LOGIC;
SIGNAL load : STD_LOGIC;
SIGNAL vagas_load : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL vagas_out_idosos : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL vagas_out_total : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL vagas_total : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT controlador_vagas
	PORT (
	cheio : OUT STD_LOGIC;
	clear : IN STD_LOGIC;
	clock : IN STD_LOGIC;
	conta_idosos : IN STD_LOGIC;
	conta_normal : IN STD_LOGIC;
	entra_sai_idosos : IN STD_LOGIC;
	entra_sai_normal : IN STD_LOGIC;
	load : IN STD_LOGIC;
	vagas_load : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	vagas_out_idosos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	vagas_out_total : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	vagas_total : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : controlador_vagas
	PORT MAP (
-- list connections between master ports and signals
	cheio => cheio,
	clear => clear,
	clock => clock,
	conta_idosos => conta_idosos,
	conta_normal => conta_normal,
	entra_sai_idosos => entra_sai_idosos,
	entra_sai_normal => entra_sai_normal,
	load => load,
	vagas_load => vagas_load,
	vagas_out_idosos => vagas_out_idosos,
	vagas_out_total => vagas_out_total,
	vagas_total => vagas_total
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

-- load
t_prcs_load: PROCESS
BEGIN
	load <= '0';
WAIT;
END PROCESS t_prcs_load;
-- vagas_load[3]
t_prcs_vagas_load_3: PROCESS
BEGIN
	vagas_load(3) <= '0';
WAIT;
END PROCESS t_prcs_vagas_load_3;
-- vagas_load[2]
t_prcs_vagas_load_2: PROCESS
BEGIN
	vagas_load(2) <= '0';
WAIT;
END PROCESS t_prcs_vagas_load_2;
-- vagas_load[1]
t_prcs_vagas_load_1: PROCESS
BEGIN
	vagas_load(1) <= '0';
WAIT;
END PROCESS t_prcs_vagas_load_1;
-- vagas_load[0]
t_prcs_vagas_load_0: PROCESS
BEGIN
	vagas_load(0) <= '0';
WAIT;
END PROCESS t_prcs_vagas_load_0;

-- clear
t_prcs_clear: PROCESS
BEGIN
	clear <= '0';
WAIT;
END PROCESS t_prcs_clear;

-- conta_idosos
t_prcs_conta_idosos: PROCESS
BEGIN
	conta_idosos <= '0';
	WAIT FOR 170000 ps;
	conta_idosos <= '1';
	WAIT FOR 110000 ps;
	conta_idosos <= '0';
	WAIT FOR 90000 ps;
	conta_idosos <= '1';
	WAIT FOR 80000 ps;
	conta_idosos <= '0';
	WAIT FOR 80000 ps;
	conta_idosos <= '1';
	WAIT FOR 80000 ps;
	conta_idosos <= '0';
	WAIT FOR 120000 ps;
	conta_idosos <= '1';
	WAIT FOR 160000 ps;
	conta_idosos <= '0';
WAIT;
END PROCESS t_prcs_conta_idosos;

-- conta_normal
t_prcs_conta_normal: PROCESS
BEGIN
	conta_normal <= '1';
	WAIT FOR 130000 ps;
	conta_normal <= '0';
	WAIT FOR 160000 ps;
	conta_normal <= '1';
	WAIT FOR 80000 ps;
	conta_normal <= '0';
	WAIT FOR 80000 ps;
	conta_normal <= '1';
	WAIT FOR 80000 ps;
	conta_normal <= '0';
	WAIT FOR 80000 ps;
	conta_normal <= '1';
	WAIT FOR 120000 ps;
	conta_normal <= '0';
WAIT;
END PROCESS t_prcs_conta_normal;

-- entra_sai_idosos
t_prcs_entra_sai_idosos: PROCESS
BEGIN
	entra_sai_idosos <= '1';
	WAIT FOR 450000 ps;
	entra_sai_idosos <= '0';
	WAIT FOR 160000 ps;
	entra_sai_idosos <= '1';
WAIT;
END PROCESS t_prcs_entra_sai_idosos;

-- entra_sai_normal
t_prcs_entra_sai_normal: PROCESS
BEGIN
	entra_sai_normal <= '1';
	WAIT FOR 450000 ps;
	entra_sai_normal <= '0';
	WAIT FOR 160000 ps;
	entra_sai_normal <= '1';
WAIT;
END PROCESS t_prcs_entra_sai_normal;
-- vagas_total[3]
t_prcs_vagas_total_3: PROCESS
BEGIN
	vagas_total(3) <= '1';
WAIT;
END PROCESS t_prcs_vagas_total_3;
-- vagas_total[2]
t_prcs_vagas_total_2: PROCESS
BEGIN
	vagas_total(2) <= '0';
WAIT;
END PROCESS t_prcs_vagas_total_2;
-- vagas_total[1]
t_prcs_vagas_total_1: PROCESS
BEGIN
	vagas_total(1) <= '1';
WAIT;
END PROCESS t_prcs_vagas_total_1;
-- vagas_total[0]
t_prcs_vagas_total_0: PROCESS
BEGIN
	vagas_total(0) <= '1';
WAIT;
END PROCESS t_prcs_vagas_total_0;
END controlador_vagas_arch;
