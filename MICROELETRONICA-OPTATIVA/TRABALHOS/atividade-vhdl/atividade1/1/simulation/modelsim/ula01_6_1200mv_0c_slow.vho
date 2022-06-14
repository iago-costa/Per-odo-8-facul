-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "06/13/2022 18:03:55"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ula01 IS
    PORT (
	a : IN std_logic_vector(7 DOWNTO 0);
	b : IN std_logic_vector(7 DOWNTO 0);
	cin : IN std_logic;
	opcode : IN std_logic_vector(3 DOWNTO 0);
	y : OUT std_logic_vector(7 DOWNTO 0)
	);
END ula01;

-- Design Ports Information
-- y[0]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y[1]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y[2]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y[3]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y[4]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y[5]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y[6]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y[7]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[3]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[1]	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cin	=>  Location: PIN_N13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[2]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[0]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_L12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[4]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[4]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[5]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[5]	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[6]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[6]	=>  Location: PIN_K11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[7]	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[7]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ula01 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_cin : std_logic;
SIGNAL ww_opcode : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_y : std_logic_vector(7 DOWNTO 0);
SIGNAL \y[0]~output_o\ : std_logic;
SIGNAL \y[1]~output_o\ : std_logic;
SIGNAL \y[2]~output_o\ : std_logic;
SIGNAL \y[3]~output_o\ : std_logic;
SIGNAL \y[4]~output_o\ : std_logic;
SIGNAL \y[5]~output_o\ : std_logic;
SIGNAL \y[6]~output_o\ : std_logic;
SIGNAL \y[7]~output_o\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \opcode[1]~input_o\ : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \opcode[0]~input_o\ : std_logic;
SIGNAL \opcode[2]~input_o\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \opcode[3]~input_o\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \Add0~3_combout\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Add6~0_combout\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~5_combout\ : std_logic;
SIGNAL \Add0~7_combout\ : std_logic;
SIGNAL \Add0~9_cout\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux7~2_combout\ : std_logic;
SIGNAL \Mux7~3_combout\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Add0~13_combout\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \Add6~1\ : std_logic;
SIGNAL \Add6~2_combout\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add0~15_combout\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Add0~17_combout\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~19_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux6~2_combout\ : std_logic;
SIGNAL \Mux6~1_combout\ : std_logic;
SIGNAL \Mux6~3_combout\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Add0~23_combout\ : std_logic;
SIGNAL \Add6~3\ : std_logic;
SIGNAL \Add6~4_combout\ : std_logic;
SIGNAL \Add0~21_combout\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \Add0~20\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \Mux5~1_combout\ : std_logic;
SIGNAL \Mux5~2_combout\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \Add6~5\ : std_logic;
SIGNAL \Add6~6_combout\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \Add0~27_combout\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~29_combout\ : std_logic;
SIGNAL \Mux4~1_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux4~2_combout\ : std_logic;
SIGNAL \b[4]~input_o\ : std_logic;
SIGNAL \a[4]~input_o\ : std_logic;
SIGNAL \Add6~7\ : std_logic;
SIGNAL \Add6~8_combout\ : std_logic;
SIGNAL \Add0~31_combout\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \Add0~33_combout\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \Mux3~1_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux3~2_combout\ : std_logic;
SIGNAL \b[5]~input_o\ : std_logic;
SIGNAL \a[5]~input_o\ : std_logic;
SIGNAL \Add6~9\ : std_logic;
SIGNAL \Add6~10_combout\ : std_logic;
SIGNAL \Add0~36_combout\ : std_logic;
SIGNAL \Add0~37_combout\ : std_logic;
SIGNAL \Add0~38_combout\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~39_combout\ : std_logic;
SIGNAL \Mux2~1_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux2~2_combout\ : std_logic;
SIGNAL \b[6]~input_o\ : std_logic;
SIGNAL \a[6]~input_o\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Add6~11\ : std_logic;
SIGNAL \Add6~12_combout\ : std_logic;
SIGNAL \Add0~41_combout\ : std_logic;
SIGNAL \Add0~42_combout\ : std_logic;
SIGNAL \Add0~43_combout\ : std_logic;
SIGNAL \Add0~40\ : std_logic;
SIGNAL \Add0~44_combout\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \Mux1~2_combout\ : std_logic;
SIGNAL \a[7]~input_o\ : std_logic;
SIGNAL \b[7]~input_o\ : std_logic;
SIGNAL \Add6~13\ : std_logic;
SIGNAL \Add6~14_combout\ : std_logic;
SIGNAL \Add0~46_combout\ : std_logic;
SIGNAL \Add0~47_combout\ : std_logic;
SIGNAL \Add0~48_combout\ : std_logic;
SIGNAL \Add0~45\ : std_logic;
SIGNAL \Add0~49_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;

BEGIN

ww_a <= a;
ww_b <= b;
ww_cin <= cin;
ww_opcode <= opcode;
y <= ww_y;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X12_Y0_N9
\y[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~3_combout\,
	devoe => ww_devoe,
	o => \y[0]~output_o\);

-- Location: IOOBUF_X10_Y0_N9
\y[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~3_combout\,
	devoe => ww_devoe,
	o => \y[1]~output_o\);

-- Location: IOOBUF_X12_Y0_N2
\y[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux5~2_combout\,
	devoe => ww_devoe,
	o => \y[2]~output_o\);

-- Location: IOOBUF_X10_Y31_N2
\y[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux4~2_combout\,
	devoe => ww_devoe,
	o => \y[3]~output_o\);

-- Location: IOOBUF_X12_Y31_N2
\y[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux3~2_combout\,
	devoe => ww_devoe,
	o => \y[4]~output_o\);

-- Location: IOOBUF_X33_Y15_N9
\y[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux2~2_combout\,
	devoe => ww_devoe,
	o => \y[5]~output_o\);

-- Location: IOOBUF_X14_Y0_N2
\y[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~2_combout\,
	devoe => ww_devoe,
	o => \y[6]~output_o\);

-- Location: IOOBUF_X14_Y31_N2
\y[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux0~2_combout\,
	devoe => ww_devoe,
	o => \y[7]~output_o\);

-- Location: IOIBUF_X22_Y31_N1
\a[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: IOIBUF_X14_Y0_N8
\opcode[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(1),
	o => \opcode[1]~input_o\);

-- Location: IOIBUF_X33_Y10_N8
\cin~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cin,
	o => \cin~input_o\);

-- Location: LCCOMB_X15_Y13_N8
\Add0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (\opcode[1]~input_o\ & ((\cin~input_o\))) # (!\opcode[1]~input_o\ & (\a[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \a[0]~input_o\,
	datac => \opcode[1]~input_o\,
	datad => \cin~input_o\,
	combout => \Add0~0_combout\);

-- Location: IOIBUF_X22_Y31_N8
\b[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: IOIBUF_X20_Y0_N8
\opcode[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(0),
	o => \opcode[0]~input_o\);

-- Location: IOIBUF_X20_Y0_N1
\opcode[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(2),
	o => \opcode[2]~input_o\);

-- Location: LCCOMB_X15_Y13_N20
\Add0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (\b[0]~input_o\ & ((\opcode[2]~input_o\ & ((\opcode[0]~input_o\))) # (!\opcode[2]~input_o\ & (\opcode[1]~input_o\)))) # (!\b[0]~input_o\ & (\opcode[1]~input_o\ & (\opcode[0]~input_o\ $ (!\opcode[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[0]~input_o\,
	datab => \opcode[1]~input_o\,
	datac => \opcode[0]~input_o\,
	datad => \opcode[2]~input_o\,
	combout => \Add0~2_combout\);

-- Location: IOIBUF_X33_Y12_N8
\opcode[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(3),
	o => \opcode[3]~input_o\);

-- Location: LCCOMB_X15_Y13_N18
\Add0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = (\opcode[2]~input_o\ & (\opcode[1]~input_o\ $ (!\opcode[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \opcode[1]~input_o\,
	datac => \opcode[0]~input_o\,
	datad => \opcode[2]~input_o\,
	combout => \Add0~1_combout\);

-- Location: LCCOMB_X15_Y13_N14
\Add0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~3_combout\ = (\opcode[3]~input_o\ & (\Add0~2_combout\ $ (((!\Add0~1_combout\) # (!\Add0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \Add0~2_combout\,
	datac => \opcode[3]~input_o\,
	datad => \Add0~1_combout\,
	combout => \Add0~3_combout\);

-- Location: LCCOMB_X15_Y13_N12
\Add0~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\opcode[3]~input_o\ & ((\opcode[2]~input_o\) # ((\opcode[0]~input_o\ & !\opcode[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[3]~input_o\,
	datab => \opcode[0]~input_o\,
	datac => \opcode[1]~input_o\,
	datad => \opcode[2]~input_o\,
	combout => \Add0~6_combout\);

-- Location: LCCOMB_X16_Y15_N0
\Add6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add6~0_combout\ = (\a[0]~input_o\ & (\b[0]~input_o\ $ (VCC))) # (!\a[0]~input_o\ & (\b[0]~input_o\ & VCC))
-- \Add6~1\ = CARRY((\a[0]~input_o\ & \b[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[0]~input_o\,
	datab => \b[0]~input_o\,
	datad => VCC,
	combout => \Add6~0_combout\,
	cout => \Add6~1\);

-- Location: LCCOMB_X15_Y13_N24
\Add0~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (\opcode[1]~input_o\ & ((\Add6~0_combout\))) # (!\opcode[1]~input_o\ & (\b[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[0]~input_o\,
	datab => \opcode[1]~input_o\,
	datac => \Add6~0_combout\,
	combout => \Add0~4_combout\);

-- Location: LCCOMB_X15_Y13_N26
\Add0~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~5_combout\ = (\opcode[3]~input_o\ & ((\opcode[0]~input_o\ & (\opcode[1]~input_o\ $ (\opcode[2]~input_o\))) # (!\opcode[0]~input_o\ & (!\opcode[1]~input_o\ & !\opcode[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[3]~input_o\,
	datab => \opcode[0]~input_o\,
	datac => \opcode[1]~input_o\,
	datad => \opcode[2]~input_o\,
	combout => \Add0~5_combout\);

-- Location: LCCOMB_X15_Y13_N22
\Add0~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~7_combout\ = (\Add0~5_combout\ & (\Add0~6_combout\ $ (((\a[0]~input_o\))))) # (!\Add0~5_combout\ & (\Add0~6_combout\ & (\Add0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~6_combout\,
	datab => \Add0~4_combout\,
	datac => \Add0~5_combout\,
	datad => \a[0]~input_o\,
	combout => \Add0~7_combout\);

-- Location: LCCOMB_X15_Y14_N4
\Add0~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~9_cout\ = CARRY(\opcode[2]~input_o\ $ (\opcode[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[2]~input_o\,
	datab => \opcode[1]~input_o\,
	datad => VCC,
	cout => \Add0~9_cout\);

-- Location: LCCOMB_X15_Y14_N6
\Add0~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (\Add0~3_combout\ & ((\Add0~7_combout\ & (\Add0~9_cout\ & VCC)) # (!\Add0~7_combout\ & (!\Add0~9_cout\)))) # (!\Add0~3_combout\ & ((\Add0~7_combout\ & (!\Add0~9_cout\)) # (!\Add0~7_combout\ & ((\Add0~9_cout\) # (GND)))))
-- \Add0~11\ = CARRY((\Add0~3_combout\ & (!\Add0~7_combout\ & !\Add0~9_cout\)) # (!\Add0~3_combout\ & ((!\Add0~9_cout\) # (!\Add0~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~3_combout\,
	datab => \Add0~7_combout\,
	datad => VCC,
	cin => \Add0~9_cout\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X15_Y13_N10
\Mux7~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = (\opcode[1]~input_o\ & !\opcode[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \opcode[1]~input_o\,
	datad => \opcode[2]~input_o\,
	combout => \Mux7~1_combout\);

-- Location: LCCOMB_X15_Y13_N0
\Mux7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\b[0]~input_o\ & (((\opcode[1]~input_o\) # (\a[0]~input_o\)))) # (!\b[0]~input_o\ & (\a[0]~input_o\ & (\opcode[2]~input_o\ $ (!\opcode[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[0]~input_o\,
	datab => \opcode[2]~input_o\,
	datac => \opcode[1]~input_o\,
	datad => \a[0]~input_o\,
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X15_Y13_N28
\Mux7~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~2_combout\ = (\opcode[3]~input_o\ & (\Mux7~1_combout\ & (!\opcode[0]~input_o\))) # (!\opcode[3]~input_o\ & ((\opcode[0]~input_o\ $ (\Mux7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~1_combout\,
	datab => \opcode[0]~input_o\,
	datac => \opcode[3]~input_o\,
	datad => \Mux7~0_combout\,
	combout => \Mux7~2_combout\);

-- Location: LCCOMB_X15_Y13_N30
\Mux7~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~3_combout\ = (\opcode[3]~input_o\ & ((\Mux7~2_combout\ & ((\Add6~0_combout\))) # (!\Mux7~2_combout\ & (\Add0~10_combout\)))) # (!\opcode[3]~input_o\ & (((\Mux7~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~10_combout\,
	datab => \Add6~0_combout\,
	datac => \opcode[3]~input_o\,
	datad => \Mux7~2_combout\,
	combout => \Mux7~3_combout\);

-- Location: IOIBUF_X14_Y31_N8
\a[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: LCCOMB_X16_Y14_N0
\Add0~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = \opcode[2]~input_o\ $ (((!\opcode[1]~input_o\ & \opcode[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \opcode[1]~input_o\,
	datac => \opcode[2]~input_o\,
	datad => \opcode[0]~input_o\,
	combout => \Add0~12_combout\);

-- Location: LCCOMB_X16_Y14_N26
\Add0~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~13_combout\ = (\opcode[2]~input_o\ & ((\opcode[1]~input_o\) # (\opcode[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \opcode[1]~input_o\,
	datac => \opcode[2]~input_o\,
	datad => \opcode[0]~input_o\,
	combout => \Add0~13_combout\);

-- Location: IOIBUF_X20_Y31_N1
\b[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: LCCOMB_X16_Y15_N2
\Add6~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add6~2_combout\ = (\a[1]~input_o\ & ((\b[1]~input_o\ & (\Add6~1\ & VCC)) # (!\b[1]~input_o\ & (!\Add6~1\)))) # (!\a[1]~input_o\ & ((\b[1]~input_o\ & (!\Add6~1\)) # (!\b[1]~input_o\ & ((\Add6~1\) # (GND)))))
-- \Add6~3\ = CARRY((\a[1]~input_o\ & (!\b[1]~input_o\ & !\Add6~1\)) # (!\a[1]~input_o\ & ((!\Add6~1\) # (!\b[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datab => \b[1]~input_o\,
	datad => VCC,
	cin => \Add6~1\,
	combout => \Add6~2_combout\,
	cout => \Add6~3\);

-- Location: LCCOMB_X16_Y14_N12
\Add0~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (\Add0~12_combout\ & ((\Add0~13_combout\ & ((\Add6~2_combout\))) # (!\Add0~13_combout\ & (\b[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \Add0~12_combout\,
	datac => \Add0~13_combout\,
	datad => \Add6~2_combout\,
	combout => \Add0~14_combout\);

-- Location: LCCOMB_X16_Y14_N6
\Add0~15\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~15_combout\ = (\Add0~14_combout\) # ((!\Add0~12_combout\ & (\a[1]~input_o\ $ (\Add0~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datab => \Add0~12_combout\,
	datac => \Add0~13_combout\,
	datad => \Add0~14_combout\,
	combout => \Add0~15_combout\);

-- Location: LCCOMB_X16_Y15_N16
\Add0~16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (\opcode[2]~input_o\ & !\opcode[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \opcode[2]~input_o\,
	datac => \opcode[1]~input_o\,
	combout => \Add0~16_combout\);

-- Location: LCCOMB_X15_Y13_N2
\Add0~17\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~17_combout\ = (\opcode[1]~input_o\ & ((!\opcode[2]~input_o\))) # (!\opcode[1]~input_o\ & (\opcode[0]~input_o\ & \opcode[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \opcode[1]~input_o\,
	datac => \opcode[0]~input_o\,
	datad => \opcode[2]~input_o\,
	combout => \Add0~17_combout\);

-- Location: LCCOMB_X15_Y14_N24
\Add0~18\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (\Add0~17_combout\ & (((\b[1]~input_o\)))) # (!\Add0~17_combout\ & (((\a[1]~input_o\)) # (!\Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~16_combout\,
	datab => \a[1]~input_o\,
	datac => \b[1]~input_o\,
	datad => \Add0~17_combout\,
	combout => \Add0~18_combout\);

-- Location: LCCOMB_X15_Y14_N8
\Add0~19\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~19_combout\ = ((\Add0~15_combout\ $ (\Add0~18_combout\ $ (\Add0~11\)))) # (GND)
-- \Add0~20\ = CARRY((\Add0~15_combout\ & ((!\Add0~11\) # (!\Add0~18_combout\))) # (!\Add0~15_combout\ & (!\Add0~18_combout\ & !\Add0~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~15_combout\,
	datab => \Add0~18_combout\,
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~19_combout\,
	cout => \Add0~20\);

-- Location: LCCOMB_X15_Y13_N16
\Mux6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\opcode[2]~input_o\) # ((\opcode[3]~input_o\ & ((\opcode[0]~input_o\) # (!\opcode[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[3]~input_o\,
	datab => \opcode[0]~input_o\,
	datac => \opcode[1]~input_o\,
	datad => \opcode[2]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X15_Y15_N18
\Mux6~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux6~2_combout\ = (\Mux6~0_combout\ & (\Add0~19_combout\)) # (!\Mux6~0_combout\ & ((\Add6~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~19_combout\,
	datac => \Mux6~0_combout\,
	datad => \Add6~2_combout\,
	combout => \Mux6~2_combout\);

-- Location: LCCOMB_X15_Y15_N16
\Mux6~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux6~1_combout\ = (\b[1]~input_o\ & ((\opcode[1]~input_o\) # ((\a[1]~input_o\)))) # (!\b[1]~input_o\ & (\a[1]~input_o\ & (\opcode[1]~input_o\ $ (!\Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \opcode[1]~input_o\,
	datac => \Mux6~0_combout\,
	datad => \a[1]~input_o\,
	combout => \Mux6~1_combout\);

-- Location: LCCOMB_X15_Y15_N4
\Mux6~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux6~3_combout\ = (\opcode[3]~input_o\ & (\Mux6~2_combout\)) # (!\opcode[3]~input_o\ & ((\opcode[0]~input_o\ $ (\Mux6~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[3]~input_o\,
	datab => \Mux6~2_combout\,
	datac => \opcode[0]~input_o\,
	datad => \Mux6~1_combout\,
	combout => \Mux6~3_combout\);

-- Location: IOIBUF_X33_Y14_N1
\a[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: IOIBUF_X33_Y12_N1
\b[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: LCCOMB_X15_Y15_N14
\Mux5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\a[2]~input_o\ & ((\b[2]~input_o\) # (\Mux6~0_combout\ $ (!\opcode[1]~input_o\)))) # (!\a[2]~input_o\ & (((\b[2]~input_o\ & \opcode[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[2]~input_o\,
	datab => \Mux6~0_combout\,
	datac => \b[2]~input_o\,
	datad => \opcode[1]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X15_Y14_N26
\Add0~23\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~23_combout\ = (\Add0~17_combout\ & (((\b[2]~input_o\)))) # (!\Add0~17_combout\ & (((\a[2]~input_o\)) # (!\Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~16_combout\,
	datab => \Add0~17_combout\,
	datac => \b[2]~input_o\,
	datad => \a[2]~input_o\,
	combout => \Add0~23_combout\);

-- Location: LCCOMB_X16_Y15_N4
\Add6~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add6~4_combout\ = ((\a[2]~input_o\ $ (\b[2]~input_o\ $ (!\Add6~3\)))) # (GND)
-- \Add6~5\ = CARRY((\a[2]~input_o\ & ((\b[2]~input_o\) # (!\Add6~3\))) # (!\a[2]~input_o\ & (\b[2]~input_o\ & !\Add6~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[2]~input_o\,
	datab => \b[2]~input_o\,
	datad => VCC,
	cin => \Add6~3\,
	combout => \Add6~4_combout\,
	cout => \Add6~5\);

-- Location: LCCOMB_X16_Y14_N8
\Add0~21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~21_combout\ = (\Add0~12_combout\ & ((\Add0~13_combout\ & ((\Add6~4_combout\))) # (!\Add0~13_combout\ & (\b[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[2]~input_o\,
	datab => \Add0~12_combout\,
	datac => \Add0~13_combout\,
	datad => \Add6~4_combout\,
	combout => \Add0~21_combout\);

-- Location: LCCOMB_X16_Y14_N10
\Add0~22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (\Add0~21_combout\) # ((!\Add0~12_combout\ & (\a[2]~input_o\ $ (\Add0~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[2]~input_o\,
	datab => \Add0~21_combout\,
	datac => \Add0~13_combout\,
	datad => \Add0~12_combout\,
	combout => \Add0~22_combout\);

-- Location: LCCOMB_X15_Y14_N10
\Add0~24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = (\Add0~23_combout\ & ((\Add0~22_combout\ & (!\Add0~20\)) # (!\Add0~22_combout\ & ((\Add0~20\) # (GND))))) # (!\Add0~23_combout\ & ((\Add0~22_combout\ & (\Add0~20\ & VCC)) # (!\Add0~22_combout\ & (!\Add0~20\))))
-- \Add0~25\ = CARRY((\Add0~23_combout\ & ((!\Add0~20\) # (!\Add0~22_combout\))) # (!\Add0~23_combout\ & (!\Add0~22_combout\ & !\Add0~20\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~23_combout\,
	datab => \Add0~22_combout\,
	datad => VCC,
	cin => \Add0~20\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

-- Location: LCCOMB_X15_Y15_N0
\Mux5~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux5~1_combout\ = (\Mux6~0_combout\ & (\Add0~24_combout\)) # (!\Mux6~0_combout\ & ((\Add6~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~24_combout\,
	datab => \Add6~4_combout\,
	datac => \Mux6~0_combout\,
	combout => \Mux5~1_combout\);

-- Location: LCCOMB_X15_Y15_N2
\Mux5~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux5~2_combout\ = (\opcode[3]~input_o\ & (((\Mux5~1_combout\)))) # (!\opcode[3]~input_o\ & (\Mux5~0_combout\ $ ((\opcode[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[3]~input_o\,
	datab => \Mux5~0_combout\,
	datac => \opcode[0]~input_o\,
	datad => \Mux5~1_combout\,
	combout => \Mux5~2_combout\);

-- Location: IOIBUF_X16_Y31_N1
\b[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: IOIBUF_X16_Y31_N8
\a[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: LCCOMB_X15_Y14_N30
\Add0~28\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = (\Add0~17_combout\ & (\b[3]~input_o\)) # (!\Add0~17_combout\ & (((\a[3]~input_o\) # (!\Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datab => \Add0~17_combout\,
	datac => \a[3]~input_o\,
	datad => \Add0~16_combout\,
	combout => \Add0~28_combout\);

-- Location: LCCOMB_X16_Y15_N6
\Add6~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add6~6_combout\ = (\a[3]~input_o\ & ((\b[3]~input_o\ & (\Add6~5\ & VCC)) # (!\b[3]~input_o\ & (!\Add6~5\)))) # (!\a[3]~input_o\ & ((\b[3]~input_o\ & (!\Add6~5\)) # (!\b[3]~input_o\ & ((\Add6~5\) # (GND)))))
-- \Add6~7\ = CARRY((\a[3]~input_o\ & (!\b[3]~input_o\ & !\Add6~5\)) # (!\a[3]~input_o\ & ((!\Add6~5\) # (!\b[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[3]~input_o\,
	datab => \b[3]~input_o\,
	datad => VCC,
	cin => \Add6~5\,
	combout => \Add6~6_combout\,
	cout => \Add6~7\);

-- Location: LCCOMB_X16_Y14_N28
\Add0~26\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (\Add0~12_combout\ & ((\Add0~13_combout\ & ((\Add6~6_combout\))) # (!\Add0~13_combout\ & (\b[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~13_combout\,
	datab => \Add0~12_combout\,
	datac => \b[3]~input_o\,
	datad => \Add6~6_combout\,
	combout => \Add0~26_combout\);

-- Location: LCCOMB_X16_Y14_N14
\Add0~27\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~27_combout\ = (\Add0~26_combout\) # ((!\Add0~12_combout\ & (\a[3]~input_o\ $ (\Add0~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[3]~input_o\,
	datab => \Add0~26_combout\,
	datac => \Add0~13_combout\,
	datad => \Add0~12_combout\,
	combout => \Add0~27_combout\);

-- Location: LCCOMB_X15_Y14_N12
\Add0~29\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~29_combout\ = ((\Add0~28_combout\ $ (\Add0~27_combout\ $ (\Add0~25\)))) # (GND)
-- \Add0~30\ = CARRY((\Add0~28_combout\ & (\Add0~27_combout\ & !\Add0~25\)) # (!\Add0~28_combout\ & ((\Add0~27_combout\) # (!\Add0~25\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~28_combout\,
	datab => \Add0~27_combout\,
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~29_combout\,
	cout => \Add0~30\);

-- Location: LCCOMB_X15_Y15_N22
\Mux4~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux4~1_combout\ = (\Mux6~0_combout\ & (\Add0~29_combout\)) # (!\Mux6~0_combout\ & ((\Add6~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~29_combout\,
	datac => \Mux6~0_combout\,
	datad => \Add6~6_combout\,
	combout => \Mux4~1_combout\);

-- Location: LCCOMB_X15_Y15_N28
\Mux4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\a[3]~input_o\ & ((\b[3]~input_o\) # (\opcode[1]~input_o\ $ (!\Mux6~0_combout\)))) # (!\a[3]~input_o\ & (\opcode[1]~input_o\ & ((\b[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[3]~input_o\,
	datab => \opcode[1]~input_o\,
	datac => \Mux6~0_combout\,
	datad => \b[3]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X15_Y15_N8
\Mux4~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux4~2_combout\ = (\opcode[3]~input_o\ & (\Mux4~1_combout\)) # (!\opcode[3]~input_o\ & ((\opcode[0]~input_o\ $ (\Mux4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4~1_combout\,
	datab => \opcode[0]~input_o\,
	datac => \opcode[3]~input_o\,
	datad => \Mux4~0_combout\,
	combout => \Mux4~2_combout\);

-- Location: IOIBUF_X12_Y31_N8
\b[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(4),
	o => \b[4]~input_o\);

-- Location: IOIBUF_X33_Y16_N8
\a[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(4),
	o => \a[4]~input_o\);

-- Location: LCCOMB_X16_Y15_N8
\Add6~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add6~8_combout\ = ((\b[4]~input_o\ $ (\a[4]~input_o\ $ (!\Add6~7\)))) # (GND)
-- \Add6~9\ = CARRY((\b[4]~input_o\ & ((\a[4]~input_o\) # (!\Add6~7\))) # (!\b[4]~input_o\ & (\a[4]~input_o\ & !\Add6~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \b[4]~input_o\,
	datab => \a[4]~input_o\,
	datad => VCC,
	cin => \Add6~7\,
	combout => \Add6~8_combout\,
	cout => \Add6~9\);

-- Location: LCCOMB_X16_Y14_N16
\Add0~31\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~31_combout\ = (\Add0~12_combout\ & ((\Add0~13_combout\ & ((\Add6~8_combout\))) # (!\Add0~13_combout\ & (\b[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~13_combout\,
	datab => \Add0~12_combout\,
	datac => \b[4]~input_o\,
	datad => \Add6~8_combout\,
	combout => \Add0~31_combout\);

-- Location: LCCOMB_X16_Y14_N18
\Add0~32\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = (\Add0~31_combout\) # ((!\Add0~12_combout\ & (\Add0~13_combout\ $ (\a[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~13_combout\,
	datab => \Add0~31_combout\,
	datac => \a[4]~input_o\,
	datad => \Add0~12_combout\,
	combout => \Add0~32_combout\);

-- Location: LCCOMB_X15_Y14_N0
\Add0~33\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~33_combout\ = (\Add0~17_combout\ & (\b[4]~input_o\)) # (!\Add0~17_combout\ & (((\a[4]~input_o\) # (!\Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[4]~input_o\,
	datab => \Add0~17_combout\,
	datac => \a[4]~input_o\,
	datad => \Add0~16_combout\,
	combout => \Add0~33_combout\);

-- Location: LCCOMB_X15_Y14_N14
\Add0~34\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = (\Add0~32_combout\ & ((\Add0~33_combout\ & (!\Add0~30\)) # (!\Add0~33_combout\ & (\Add0~30\ & VCC)))) # (!\Add0~32_combout\ & ((\Add0~33_combout\ & ((\Add0~30\) # (GND))) # (!\Add0~33_combout\ & (!\Add0~30\))))
-- \Add0~35\ = CARRY((\Add0~32_combout\ & (\Add0~33_combout\ & !\Add0~30\)) # (!\Add0~32_combout\ & ((\Add0~33_combout\) # (!\Add0~30\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~32_combout\,
	datab => \Add0~33_combout\,
	datad => VCC,
	cin => \Add0~30\,
	combout => \Add0~34_combout\,
	cout => \Add0~35\);

-- Location: LCCOMB_X16_Y15_N28
\Mux3~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux3~1_combout\ = (\Mux6~0_combout\ & ((\Add0~34_combout\))) # (!\Mux6~0_combout\ & (\Add6~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~0_combout\,
	datac => \Add6~8_combout\,
	datad => \Add0~34_combout\,
	combout => \Mux3~1_combout\);

-- Location: LCCOMB_X16_Y15_N18
\Mux3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\b[4]~input_o\ & ((\a[4]~input_o\) # ((\opcode[1]~input_o\)))) # (!\b[4]~input_o\ & (\a[4]~input_o\ & (\opcode[1]~input_o\ $ (!\Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[4]~input_o\,
	datab => \a[4]~input_o\,
	datac => \opcode[1]~input_o\,
	datad => \Mux6~0_combout\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X16_Y15_N22
\Mux3~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux3~2_combout\ = (\opcode[3]~input_o\ & (((\Mux3~1_combout\)))) # (!\opcode[3]~input_o\ & (\opcode[0]~input_o\ $ (((\Mux3~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010111001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[0]~input_o\,
	datab => \Mux3~1_combout\,
	datac => \opcode[3]~input_o\,
	datad => \Mux3~0_combout\,
	combout => \Mux3~2_combout\);

-- Location: IOIBUF_X33_Y16_N1
\b[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(5),
	o => \b[5]~input_o\);

-- Location: IOIBUF_X33_Y11_N8
\a[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(5),
	o => \a[5]~input_o\);

-- Location: LCCOMB_X16_Y15_N10
\Add6~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add6~10_combout\ = (\a[5]~input_o\ & ((\b[5]~input_o\ & (\Add6~9\ & VCC)) # (!\b[5]~input_o\ & (!\Add6~9\)))) # (!\a[5]~input_o\ & ((\b[5]~input_o\ & (!\Add6~9\)) # (!\b[5]~input_o\ & ((\Add6~9\) # (GND)))))
-- \Add6~11\ = CARRY((\a[5]~input_o\ & (!\b[5]~input_o\ & !\Add6~9\)) # (!\a[5]~input_o\ & ((!\Add6~9\) # (!\b[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[5]~input_o\,
	datab => \b[5]~input_o\,
	datad => VCC,
	cin => \Add6~9\,
	combout => \Add6~10_combout\,
	cout => \Add6~11\);

-- Location: LCCOMB_X16_Y14_N4
\Add0~36\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~36_combout\ = (\Add0~12_combout\ & ((\Add0~13_combout\ & ((\Add6~10_combout\))) # (!\Add0~13_combout\ & (\b[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~13_combout\,
	datab => \Add0~12_combout\,
	datac => \b[5]~input_o\,
	datad => \Add6~10_combout\,
	combout => \Add0~36_combout\);

-- Location: LCCOMB_X16_Y14_N22
\Add0~37\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~37_combout\ = (\Add0~36_combout\) # ((!\Add0~12_combout\ & (\Add0~13_combout\ $ (\a[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~13_combout\,
	datab => \Add0~12_combout\,
	datac => \Add0~36_combout\,
	datad => \a[5]~input_o\,
	combout => \Add0~37_combout\);

-- Location: LCCOMB_X15_Y14_N2
\Add0~38\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~38_combout\ = (\Add0~17_combout\ & (((\b[5]~input_o\)))) # (!\Add0~17_combout\ & (((\a[5]~input_o\)) # (!\Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~16_combout\,
	datab => \a[5]~input_o\,
	datac => \Add0~17_combout\,
	datad => \b[5]~input_o\,
	combout => \Add0~38_combout\);

-- Location: LCCOMB_X15_Y14_N16
\Add0~39\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~39_combout\ = ((\Add0~37_combout\ $ (\Add0~38_combout\ $ (\Add0~35\)))) # (GND)
-- \Add0~40\ = CARRY((\Add0~37_combout\ & ((!\Add0~35\) # (!\Add0~38_combout\))) # (!\Add0~37_combout\ & (!\Add0~38_combout\ & !\Add0~35\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~37_combout\,
	datab => \Add0~38_combout\,
	datad => VCC,
	cin => \Add0~35\,
	combout => \Add0~39_combout\,
	cout => \Add0~40\);

-- Location: LCCOMB_X16_Y15_N26
\Mux2~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux2~1_combout\ = (\Mux6~0_combout\ & (\Add0~39_combout\)) # (!\Mux6~0_combout\ & ((\Add6~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~0_combout\,
	datab => \Add0~39_combout\,
	datad => \Add6~10_combout\,
	combout => \Mux2~1_combout\);

-- Location: LCCOMB_X16_Y15_N24
\Mux2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\a[5]~input_o\ & ((\b[5]~input_o\) # (\Mux6~0_combout\ $ (!\opcode[1]~input_o\)))) # (!\a[5]~input_o\ & (((\opcode[1]~input_o\ & \b[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~0_combout\,
	datab => \a[5]~input_o\,
	datac => \opcode[1]~input_o\,
	datad => \b[5]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X16_Y15_N20
\Mux2~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux2~2_combout\ = (\opcode[3]~input_o\ & (\Mux2~1_combout\)) # (!\opcode[3]~input_o\ & ((\Mux2~0_combout\ $ (\opcode[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~1_combout\,
	datab => \Mux2~0_combout\,
	datac => \opcode[3]~input_o\,
	datad => \opcode[0]~input_o\,
	combout => \Mux2~2_combout\);

-- Location: IOIBUF_X20_Y31_N8
\b[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(6),
	o => \b[6]~input_o\);

-- Location: IOIBUF_X33_Y11_N1
\a[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(6),
	o => \a[6]~input_o\);

-- Location: LCCOMB_X15_Y15_N26
\Mux1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\b[6]~input_o\ & ((\opcode[1]~input_o\) # ((\a[6]~input_o\)))) # (!\b[6]~input_o\ & (\a[6]~input_o\ & (\opcode[1]~input_o\ $ (!\Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[6]~input_o\,
	datab => \opcode[1]~input_o\,
	datac => \Mux6~0_combout\,
	datad => \a[6]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X16_Y15_N12
\Add6~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add6~12_combout\ = ((\a[6]~input_o\ $ (\b[6]~input_o\ $ (!\Add6~11\)))) # (GND)
-- \Add6~13\ = CARRY((\a[6]~input_o\ & ((\b[6]~input_o\) # (!\Add6~11\))) # (!\a[6]~input_o\ & (\b[6]~input_o\ & !\Add6~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[6]~input_o\,
	datab => \b[6]~input_o\,
	datad => VCC,
	cin => \Add6~11\,
	combout => \Add6~12_combout\,
	cout => \Add6~13\);

-- Location: LCCOMB_X16_Y14_N24
\Add0~41\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~41_combout\ = (\Add0~12_combout\ & ((\Add0~13_combout\ & (\Add6~12_combout\)) # (!\Add0~13_combout\ & ((\b[6]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~13_combout\,
	datab => \Add0~12_combout\,
	datac => \Add6~12_combout\,
	datad => \b[6]~input_o\,
	combout => \Add0~41_combout\);

-- Location: LCCOMB_X16_Y14_N2
\Add0~42\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~42_combout\ = (\Add0~41_combout\) # ((!\Add0~12_combout\ & (\a[6]~input_o\ $ (\Add0~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[6]~input_o\,
	datab => \Add0~41_combout\,
	datac => \Add0~13_combout\,
	datad => \Add0~12_combout\,
	combout => \Add0~42_combout\);

-- Location: LCCOMB_X15_Y14_N28
\Add0~43\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~43_combout\ = (\Add0~17_combout\ & (((\b[6]~input_o\)))) # (!\Add0~17_combout\ & (((\a[6]~input_o\)) # (!\Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~16_combout\,
	datab => \Add0~17_combout\,
	datac => \b[6]~input_o\,
	datad => \a[6]~input_o\,
	combout => \Add0~43_combout\);

-- Location: LCCOMB_X15_Y14_N18
\Add0~44\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~44_combout\ = (\Add0~42_combout\ & ((\Add0~43_combout\ & (!\Add0~40\)) # (!\Add0~43_combout\ & (\Add0~40\ & VCC)))) # (!\Add0~42_combout\ & ((\Add0~43_combout\ & ((\Add0~40\) # (GND))) # (!\Add0~43_combout\ & (!\Add0~40\))))
-- \Add0~45\ = CARRY((\Add0~42_combout\ & (\Add0~43_combout\ & !\Add0~40\)) # (!\Add0~42_combout\ & ((\Add0~43_combout\) # (!\Add0~40\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~42_combout\,
	datab => \Add0~43_combout\,
	datad => VCC,
	cin => \Add0~40\,
	combout => \Add0~44_combout\,
	cout => \Add0~45\);

-- Location: LCCOMB_X15_Y15_N12
\Mux1~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = (\Mux6~0_combout\ & ((\Add0~44_combout\))) # (!\Mux6~0_combout\ & (\Add6~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux6~0_combout\,
	datac => \Add6~12_combout\,
	datad => \Add0~44_combout\,
	combout => \Mux1~1_combout\);

-- Location: LCCOMB_X15_Y15_N6
\Mux1~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux1~2_combout\ = (\opcode[3]~input_o\ & (((\Mux1~1_combout\)))) # (!\opcode[3]~input_o\ & (\Mux1~0_combout\ $ ((\opcode[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1~0_combout\,
	datab => \opcode[0]~input_o\,
	datac => \opcode[3]~input_o\,
	datad => \Mux1~1_combout\,
	combout => \Mux1~2_combout\);

-- Location: IOIBUF_X33_Y14_N8
\a[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(7),
	o => \a[7]~input_o\);

-- Location: IOIBUF_X33_Y15_N1
\b[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(7),
	o => \b[7]~input_o\);

-- Location: LCCOMB_X16_Y15_N14
\Add6~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add6~14_combout\ = \a[7]~input_o\ $ (\Add6~13\ $ (\b[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[7]~input_o\,
	datad => \b[7]~input_o\,
	cin => \Add6~13\,
	combout => \Add6~14_combout\);

-- Location: LCCOMB_X16_Y14_N20
\Add0~46\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~46_combout\ = (\Add0~12_combout\ & ((\Add0~13_combout\ & ((\Add6~14_combout\))) # (!\Add0~13_combout\ & (\b[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~13_combout\,
	datab => \Add0~12_combout\,
	datac => \b[7]~input_o\,
	datad => \Add6~14_combout\,
	combout => \Add0~46_combout\);

-- Location: LCCOMB_X16_Y14_N30
\Add0~47\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~47_combout\ = (\Add0~46_combout\) # ((!\Add0~12_combout\ & (\Add0~13_combout\ $ (\a[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~13_combout\,
	datab => \Add0~12_combout\,
	datac => \a[7]~input_o\,
	datad => \Add0~46_combout\,
	combout => \Add0~47_combout\);

-- Location: LCCOMB_X15_Y14_N22
\Add0~48\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~48_combout\ = (\Add0~17_combout\ & (((\b[7]~input_o\)))) # (!\Add0~17_combout\ & (((\a[7]~input_o\)) # (!\Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~16_combout\,
	datab => \Add0~17_combout\,
	datac => \a[7]~input_o\,
	datad => \b[7]~input_o\,
	combout => \Add0~48_combout\);

-- Location: LCCOMB_X15_Y14_N20
\Add0~49\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~49_combout\ = \Add0~47_combout\ $ (\Add0~45\ $ (\Add0~48_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~47_combout\,
	datad => \Add0~48_combout\,
	cin => \Add0~45\,
	combout => \Add0~49_combout\);

-- Location: LCCOMB_X15_Y15_N10
\Mux0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\Mux6~0_combout\ & ((\Add0~49_combout\))) # (!\Mux6~0_combout\ & (\Add6~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux6~0_combout\,
	datac => \Add6~14_combout\,
	datad => \Add0~49_combout\,
	combout => \Mux0~1_combout\);

-- Location: LCCOMB_X15_Y15_N24
\Mux0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\a[7]~input_o\ & ((\b[7]~input_o\) # (\opcode[1]~input_o\ $ (!\Mux6~0_combout\)))) # (!\a[7]~input_o\ & (\opcode[1]~input_o\ & ((\b[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[7]~input_o\,
	datab => \opcode[1]~input_o\,
	datac => \Mux6~0_combout\,
	datad => \b[7]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X15_Y15_N20
\Mux0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = (\opcode[3]~input_o\ & (\Mux0~1_combout\)) # (!\opcode[3]~input_o\ & ((\opcode[0]~input_o\ $ (\Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~1_combout\,
	datab => \opcode[0]~input_o\,
	datac => \opcode[3]~input_o\,
	datad => \Mux0~0_combout\,
	combout => \Mux0~2_combout\);

ww_y(0) <= \y[0]~output_o\;

ww_y(1) <= \y[1]~output_o\;

ww_y(2) <= \y[2]~output_o\;

ww_y(3) <= \y[3]~output_o\;

ww_y(4) <= \y[4]~output_o\;

ww_y(5) <= \y[5]~output_o\;

ww_y(6) <= \y[6]~output_o\;

ww_y(7) <= \y[7]~output_o\;
END structure;


