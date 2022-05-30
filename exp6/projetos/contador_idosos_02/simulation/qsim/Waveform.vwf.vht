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
-- Generated on "05/29/2022 21:34:57"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          controlador_de_vagas
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY controlador_de_vagas_vhd_vec_tst IS
END controlador_de_vagas_vhd_vec_tst;
ARCHITECTURE controlador_de_vagas_arch OF controlador_de_vagas_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL cheio : STD_LOGIC;
SIGNAL cheio_dp_sm : STD_LOGIC;
SIGNAL clear : STD_LOGIC;
SIGNAL clear_sm_dp : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL conta_idosos : STD_LOGIC;
SIGNAL conta_idosos_sm_dp : STD_LOGIC;
SIGNAL conta_normal : STD_LOGIC;
SIGNAL conta_normal_sm_dp : STD_LOGIC;
SIGNAL entra_sai_idosos : STD_LOGIC;
SIGNAL entra_sai_idosos_sm_dp : STD_LOGIC;
SIGNAL entra_sai_normal : STD_LOGIC;
SIGNAL entra_sai_normal_sm_dp : STD_LOGIC;
SIGNAL vagas_load : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL vagas_out_idosos : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL vagas_out_total : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL vagas_total : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT controlador_de_vagas
	PORT (
	cheio : BUFFER STD_LOGIC;
	cheio_dp_sm : BUFFER STD_LOGIC;
	clear : IN STD_LOGIC;
	clear_sm_dp : BUFFER STD_LOGIC;
	clock : IN STD_LOGIC;
	conta_idosos : IN STD_LOGIC;
	conta_idosos_sm_dp : BUFFER STD_LOGIC;
	conta_normal : IN STD_LOGIC;
	conta_normal_sm_dp : BUFFER STD_LOGIC;
	entra_sai_idosos : IN STD_LOGIC;
	entra_sai_idosos_sm_dp : BUFFER STD_LOGIC;
	entra_sai_normal : IN STD_LOGIC;
	entra_sai_normal_sm_dp : BUFFER STD_LOGIC;
	vagas_load : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	vagas_out_idosos : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	vagas_out_total : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	vagas_total : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : controlador_de_vagas
	PORT MAP (
-- list connections between master ports and signals
	cheio => cheio,
	cheio_dp_sm => cheio_dp_sm,
	clear => clear,
	clear_sm_dp => clear_sm_dp,
	clock => clock,
	conta_idosos => conta_idosos,
	conta_idosos_sm_dp => conta_idosos_sm_dp,
	conta_normal => conta_normal,
	conta_normal_sm_dp => conta_normal_sm_dp,
	entra_sai_idosos => entra_sai_idosos,
	entra_sai_idosos_sm_dp => entra_sai_idosos_sm_dp,
	entra_sai_normal => entra_sai_normal,
	entra_sai_normal_sm_dp => entra_sai_normal_sm_dp,
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
	WAIT FOR 10000 ps;
	clock <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clock;

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
	WAIT FOR 200000 ps;
	conta_idosos <= '1';
	WAIT FOR 80000 ps;
	conta_idosos <= '0';
	WAIT FOR 60000 ps;
	conta_idosos <= '1';
	WAIT FOR 20000 ps;
	conta_idosos <= '0';
	WAIT FOR 60000 ps;
	conta_idosos <= '1';
	WAIT FOR 60000 ps;
	conta_idosos <= '0';
	WAIT FOR 160000 ps;
	conta_idosos <= '1';
	WAIT FOR 180000 ps;
	conta_idosos <= '0';
	WAIT FOR 60000 ps;
	conta_idosos <= '1';
	WAIT FOR 40000 ps;
	conta_idosos <= '0';
WAIT;
END PROCESS t_prcs_conta_idosos;

-- conta_normal
t_prcs_conta_normal: PROCESS
BEGIN
	conta_normal <= '0';
	WAIT FOR 60000 ps;
	conta_normal <= '1';
	WAIT FOR 80000 ps;
	conta_normal <= '0';
	WAIT FOR 200000 ps;
	conta_normal <= '1';
	WAIT FOR 20000 ps;
	conta_normal <= '0';
	WAIT FOR 160000 ps;
	conta_normal <= '1';
	WAIT FOR 60000 ps;
	conta_normal <= '0';
	WAIT FOR 360000 ps;
	conta_normal <= '1';
	WAIT FOR 20000 ps;
	conta_normal <= '0';
WAIT;
END PROCESS t_prcs_conta_normal;

-- entra_sai_normal
t_prcs_entra_sai_normal: PROCESS
BEGIN
	entra_sai_normal <= '1';
	WAIT FOR 410000 ps;
	entra_sai_normal <= '0';
	WAIT FOR 190000 ps;
	entra_sai_normal <= '1';
	WAIT FOR 280000 ps;
	entra_sai_normal <= '0';
	WAIT FOR 50000 ps;
	entra_sai_normal <= '1';
WAIT;
END PROCESS t_prcs_entra_sai_normal;

-- entra_sai_idosos
t_prcs_entra_sai_idosos: PROCESS
BEGIN
	entra_sai_idosos <= '1';
	WAIT FOR 410000 ps;
	entra_sai_idosos <= '0';
	WAIT FOR 190000 ps;
	entra_sai_idosos <= '1';
	WAIT FOR 280000 ps;
	entra_sai_idosos <= '0';
	WAIT FOR 50000 ps;
	entra_sai_idosos <= '1';
WAIT;
END PROCESS t_prcs_entra_sai_idosos;
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
	vagas_total(0) <= '0';
WAIT;
END PROCESS t_prcs_vagas_total_0;
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
END controlador_de_vagas_arch;
