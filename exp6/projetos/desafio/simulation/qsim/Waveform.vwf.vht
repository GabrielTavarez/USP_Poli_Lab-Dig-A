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
-- Generated on "05/30/2022 17:53:12"
                                                             
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
SIGNAL cheio_geral : STD_LOGIC;
SIGNAL cheio_idosos_dp_sm : STD_LOGIC;
SIGNAL cheio_normal_dp_sm : STD_LOGIC;
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
SIGNAL vagas_ocupadas_idosos : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL vagas_ocupadas_normal : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL vagas_total_geral : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL vagas_total_idosos : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT controlador_de_vagas
	PORT (
	cheio_geral : OUT STD_LOGIC;
	cheio_idosos_dp_sm : OUT STD_LOGIC;
	cheio_normal_dp_sm : OUT STD_LOGIC;
	clear : IN STD_LOGIC;
	clear_sm_dp : OUT STD_LOGIC;
	clock : IN STD_LOGIC;
	conta_idosos : IN STD_LOGIC;
	conta_idosos_sm_dp : OUT STD_LOGIC;
	conta_normal : IN STD_LOGIC;
	conta_normal_sm_dp : OUT STD_LOGIC;
	entra_sai_idosos : IN STD_LOGIC;
	entra_sai_idosos_sm_dp : OUT STD_LOGIC;
	entra_sai_normal : IN STD_LOGIC;
	entra_sai_normal_sm_dp : OUT STD_LOGIC;
	vagas_ocupadas_idosos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	vagas_ocupadas_normal : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	vagas_total_geral : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	vagas_total_idosos : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : controlador_de_vagas
	PORT MAP (
-- list connections between master ports and signals
	cheio_geral => cheio_geral,
	cheio_idosos_dp_sm => cheio_idosos_dp_sm,
	cheio_normal_dp_sm => cheio_normal_dp_sm,
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
	vagas_ocupadas_idosos => vagas_ocupadas_idosos,
	vagas_ocupadas_normal => vagas_ocupadas_normal,
	vagas_total_geral => vagas_total_geral,
	vagas_total_idosos => vagas_total_idosos
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

-- clear
t_prcs_clear: PROCESS
BEGIN
	clear <= '1';
WAIT;
END PROCESS t_prcs_clear;

-- conta_idosos
t_prcs_conta_idosos: PROCESS
BEGIN
	conta_idosos <= '0';
	WAIT FOR 160000 ps;
	conta_idosos <= '1';
	WAIT FOR 40000 ps;
	conta_idosos <= '0';
	WAIT FOR 200000 ps;
	conta_idosos <= '1';
	WAIT FOR 40000 ps;
	conta_idosos <= '0';
	WAIT FOR 80000 ps;
	conta_idosos <= '1';
	WAIT FOR 40000 ps;
	conta_idosos <= '0';
	WAIT FOR 200000 ps;
	conta_idosos <= '1';
	WAIT FOR 40000 ps;
	conta_idosos <= '0';
WAIT;
END PROCESS t_prcs_conta_idosos;

-- conta_normal
t_prcs_conta_normal: PROCESS
BEGIN
	conta_normal <= '0';
	WAIT FOR 50000 ps;
	conta_normal <= '1';
	WAIT FOR 30000 ps;
	conta_normal <= '0';
	WAIT FOR 320000 ps;
	conta_normal <= '1';
	WAIT FOR 40000 ps;
	conta_normal <= '0';
	WAIT FOR 80000 ps;
	conta_normal <= '1';
	WAIT FOR 40000 ps;
	conta_normal <= '0';
	WAIT FOR 120000 ps;
	conta_normal <= '1';
	WAIT FOR 40000 ps;
	conta_normal <= '0';
WAIT;
END PROCESS t_prcs_conta_normal;

-- entra_sai_idosos
t_prcs_entra_sai_idosos: PROCESS
BEGIN
	entra_sai_idosos <= '1';
	WAIT FOR 640000 ps;
	entra_sai_idosos <= '0';
	WAIT FOR 350000 ps;
	entra_sai_idosos <= '1';
WAIT;
END PROCESS t_prcs_entra_sai_idosos;

-- entra_sai_normal
t_prcs_entra_sai_normal: PROCESS
BEGIN
	entra_sai_normal <= '1';
	WAIT FOR 640000 ps;
	entra_sai_normal <= '0';
	WAIT FOR 350000 ps;
	entra_sai_normal <= '1';
WAIT;
END PROCESS t_prcs_entra_sai_normal;
-- vagas_total_geral[3]
t_prcs_vagas_total_geral_3: PROCESS
BEGIN
	vagas_total_geral(3) <= '0';
WAIT;
END PROCESS t_prcs_vagas_total_geral_3;
-- vagas_total_geral[2]
t_prcs_vagas_total_geral_2: PROCESS
BEGIN
	vagas_total_geral(2) <= '1';
WAIT;
END PROCESS t_prcs_vagas_total_geral_2;
-- vagas_total_geral[1]
t_prcs_vagas_total_geral_1: PROCESS
BEGIN
	vagas_total_geral(1) <= '0';
WAIT;
END PROCESS t_prcs_vagas_total_geral_1;
-- vagas_total_geral[0]
t_prcs_vagas_total_geral_0: PROCESS
BEGIN
	vagas_total_geral(0) <= '0';
WAIT;
END PROCESS t_prcs_vagas_total_geral_0;
-- vagas_total_idosos[3]
t_prcs_vagas_total_idosos_3: PROCESS
BEGIN
	vagas_total_idosos(3) <= '0';
WAIT;
END PROCESS t_prcs_vagas_total_idosos_3;
-- vagas_total_idosos[2]
t_prcs_vagas_total_idosos_2: PROCESS
BEGIN
	vagas_total_idosos(2) <= '0';
WAIT;
END PROCESS t_prcs_vagas_total_idosos_2;
-- vagas_total_idosos[1]
t_prcs_vagas_total_idosos_1: PROCESS
BEGIN
	vagas_total_idosos(1) <= '1';
WAIT;
END PROCESS t_prcs_vagas_total_idosos_1;
-- vagas_total_idosos[0]
t_prcs_vagas_total_idosos_0: PROCESS
BEGIN
	vagas_total_idosos(0) <= '0';
WAIT;
END PROCESS t_prcs_vagas_total_idosos_0;
END controlador_de_vagas_arch;
