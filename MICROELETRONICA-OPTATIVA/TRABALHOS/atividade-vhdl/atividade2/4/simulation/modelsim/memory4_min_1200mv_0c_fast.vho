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

-- DATE "06/13/2022 19:20:41"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
LIBRARY STD;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.STANDARD.ALL;

ENTITY 	memory4 IS
    PORT (
	clk : IN std_logic;
	write : IN std_logic;
	address : IN STD.STANDARD.integer range 0 TO 15;
	data : INOUT std_logic_vector(7 DOWNTO 0)
	);
END memory4;

-- Design Ports Information
-- data[0]	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[1]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[2]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[3]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[4]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[5]	=>  Location: PIN_M13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[6]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[7]	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[1]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[0]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[3]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[2]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write	=>  Location: PIN_N13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF memory4 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_write : std_logic;
SIGNAL ww_address : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data[0]~output_o\ : std_logic;
SIGNAL \data[1]~output_o\ : std_logic;
SIGNAL \data[2]~output_o\ : std_logic;
SIGNAL \data[3]~output_o\ : std_logic;
SIGNAL \data[4]~output_o\ : std_logic;
SIGNAL \data[5]~output_o\ : std_logic;
SIGNAL \data[6]~output_o\ : std_logic;
SIGNAL \data[7]~output_o\ : std_logic;
SIGNAL \address[0]~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \data[0]~input_o\ : std_logic;
SIGNAL \write~input_o\ : std_logic;
SIGNAL \address[1]~input_o\ : std_logic;
SIGNAL \address[3]~input_o\ : std_logic;
SIGNAL \address[2]~input_o\ : std_logic;
SIGNAL \ram~223_combout\ : std_logic;
SIGNAL \ram~224_combout\ : std_logic;
SIGNAL \ram~85_q\ : std_logic;
SIGNAL \ram~225_combout\ : std_logic;
SIGNAL \ram~226_combout\ : std_logic;
SIGNAL \ram~77_q\ : std_logic;
SIGNAL \ram~141_combout\ : std_logic;
SIGNAL \ram~227_combout\ : std_logic;
SIGNAL \ram~228_combout\ : std_logic;
SIGNAL \ram~101_q\ : std_logic;
SIGNAL \ram~93feeder_combout\ : std_logic;
SIGNAL \ram~221_combout\ : std_logic;
SIGNAL \ram~222_combout\ : std_logic;
SIGNAL \ram~93_q\ : std_logic;
SIGNAL \ram~142_combout\ : std_logic;
SIGNAL \ram~125feeder_combout\ : std_logic;
SIGNAL \ram~247_combout\ : std_logic;
SIGNAL \ram~248_combout\ : std_logic;
SIGNAL \ram~125_q\ : std_logic;
SIGNAL \ram~249_combout\ : std_logic;
SIGNAL \ram~250_combout\ : std_logic;
SIGNAL \ram~109_q\ : std_logic;
SIGNAL \ram~148_combout\ : std_logic;
SIGNAL \ram~251_combout\ : std_logic;
SIGNAL \ram~252_combout\ : std_logic;
SIGNAL \ram~133_q\ : std_logic;
SIGNAL \ram~245_combout\ : std_logic;
SIGNAL \ram~246_combout\ : std_logic;
SIGNAL \ram~117_q\ : std_logic;
SIGNAL \ram~149_combout\ : std_logic;
SIGNAL \ram~239_combout\ : std_logic;
SIGNAL \ram~240_combout\ : std_logic;
SIGNAL \ram~21_q\ : std_logic;
SIGNAL \ram~241_combout\ : std_logic;
SIGNAL \ram~242_combout\ : std_logic;
SIGNAL \ram~13_q\ : std_logic;
SIGNAL \ram~145_combout\ : std_logic;
SIGNAL \ram~237_combout\ : std_logic;
SIGNAL \ram~238_combout\ : std_logic;
SIGNAL \ram~29_q\ : std_logic;
SIGNAL \ram~243_combout\ : std_logic;
SIGNAL \ram~244_combout\ : std_logic;
SIGNAL \ram~37_q\ : std_logic;
SIGNAL \ram~146_combout\ : std_logic;
SIGNAL \ram~53feeder_combout\ : std_logic;
SIGNAL \ram~229_combout\ : std_logic;
SIGNAL \ram~230_combout\ : std_logic;
SIGNAL \ram~53_q\ : std_logic;
SIGNAL \ram~235_combout\ : std_logic;
SIGNAL \ram~236_combout\ : std_logic;
SIGNAL \ram~69_q\ : std_logic;
SIGNAL \ram~233_combout\ : std_logic;
SIGNAL \ram~234_combout\ : std_logic;
SIGNAL \ram~45_q\ : std_logic;
SIGNAL \ram~231_combout\ : std_logic;
SIGNAL \ram~232_combout\ : std_logic;
SIGNAL \ram~61_q\ : std_logic;
SIGNAL \ram~143_combout\ : std_logic;
SIGNAL \ram~144_combout\ : std_logic;
SIGNAL \ram~147_combout\ : std_logic;
SIGNAL \ram~150_combout\ : std_logic;
SIGNAL \data[1]~input_o\ : std_logic;
SIGNAL \ram~70_q\ : std_logic;
SIGNAL \ram~38_q\ : std_logic;
SIGNAL \ram~158_combout\ : std_logic;
SIGNAL \ram~134_q\ : std_logic;
SIGNAL \ram~102_q\ : std_logic;
SIGNAL \ram~159_combout\ : std_logic;
SIGNAL \ram~30_q\ : std_logic;
SIGNAL \ram~94_q\ : std_logic;
SIGNAL \ram~151_combout\ : std_logic;
SIGNAL \ram~126_q\ : std_logic;
SIGNAL \ram~62feeder_combout\ : std_logic;
SIGNAL \ram~62_q\ : std_logic;
SIGNAL \ram~152_combout\ : std_logic;
SIGNAL \ram~46feeder_combout\ : std_logic;
SIGNAL \ram~46_q\ : std_logic;
SIGNAL \ram~110_q\ : std_logic;
SIGNAL \ram~14_q\ : std_logic;
SIGNAL \ram~78_q\ : std_logic;
SIGNAL \ram~155_combout\ : std_logic;
SIGNAL \ram~156_combout\ : std_logic;
SIGNAL \ram~22_q\ : std_logic;
SIGNAL \ram~54_q\ : std_logic;
SIGNAL \ram~153_combout\ : std_logic;
SIGNAL \ram~118_q\ : std_logic;
SIGNAL \ram~86_q\ : std_logic;
SIGNAL \ram~154_combout\ : std_logic;
SIGNAL \ram~157_combout\ : std_logic;
SIGNAL \ram~160_combout\ : std_logic;
SIGNAL \data[2]~input_o\ : std_logic;
SIGNAL \ram~55feeder_combout\ : std_logic;
SIGNAL \ram~55_q\ : std_logic;
SIGNAL \ram~47_q\ : std_logic;
SIGNAL \ram~161_combout\ : std_logic;
SIGNAL \ram~63feeder_combout\ : std_logic;
SIGNAL \ram~63_q\ : std_logic;
SIGNAL \ram~71_q\ : std_logic;
SIGNAL \ram~162_combout\ : std_logic;
SIGNAL \ram~95_q\ : std_logic;
SIGNAL \ram~79_q\ : std_logic;
SIGNAL \ram~163_combout\ : std_logic;
SIGNAL \ram~87_q\ : std_logic;
SIGNAL \ram~103_q\ : std_logic;
SIGNAL \ram~164_combout\ : std_logic;
SIGNAL \ram~31feeder_combout\ : std_logic;
SIGNAL \ram~31_q\ : std_logic;
SIGNAL \ram~15_q\ : std_logic;
SIGNAL \ram~165_combout\ : std_logic;
SIGNAL \ram~39_q\ : std_logic;
SIGNAL \ram~23feeder_combout\ : std_logic;
SIGNAL \ram~23_q\ : std_logic;
SIGNAL \ram~166_combout\ : std_logic;
SIGNAL \ram~167_combout\ : std_logic;
SIGNAL \ram~127_q\ : std_logic;
SIGNAL \ram~135_q\ : std_logic;
SIGNAL \ram~119_q\ : std_logic;
SIGNAL \ram~111_q\ : std_logic;
SIGNAL \ram~168_combout\ : std_logic;
SIGNAL \ram~169_combout\ : std_logic;
SIGNAL \ram~170_combout\ : std_logic;
SIGNAL \data[3]~input_o\ : std_logic;
SIGNAL \ram~64feeder_combout\ : std_logic;
SIGNAL \ram~64_q\ : std_logic;
SIGNAL \ram~32_q\ : std_logic;
SIGNAL \ram~173_combout\ : std_logic;
SIGNAL \ram~96_q\ : std_logic;
SIGNAL \ram~128_q\ : std_logic;
SIGNAL \ram~174_combout\ : std_logic;
SIGNAL \ram~80feeder_combout\ : std_logic;
SIGNAL \ram~80_q\ : std_logic;
SIGNAL \ram~112_q\ : std_logic;
SIGNAL \ram~48feeder_combout\ : std_logic;
SIGNAL \ram~48_q\ : std_logic;
SIGNAL \ram~16_q\ : std_logic;
SIGNAL \ram~175_combout\ : std_logic;
SIGNAL \ram~176_combout\ : std_logic;
SIGNAL \ram~177_combout\ : std_logic;
SIGNAL \ram~24_q\ : std_logic;
SIGNAL \ram~88feeder_combout\ : std_logic;
SIGNAL \ram~88_q\ : std_logic;
SIGNAL \ram~171_combout\ : std_logic;
SIGNAL \ram~120_q\ : std_logic;
SIGNAL \ram~56feeder_combout\ : std_logic;
SIGNAL \ram~56_q\ : std_logic;
SIGNAL \ram~172_combout\ : std_logic;
SIGNAL \ram~104feeder_combout\ : std_logic;
SIGNAL \ram~104_q\ : std_logic;
SIGNAL \ram~40_q\ : std_logic;
SIGNAL \ram~178_combout\ : std_logic;
SIGNAL \ram~72_q\ : std_logic;
SIGNAL \ram~136_q\ : std_logic;
SIGNAL \ram~179_combout\ : std_logic;
SIGNAL \ram~180_combout\ : std_logic;
SIGNAL \data[4]~input_o\ : std_logic;
SIGNAL \ram~33_q\ : std_logic;
SIGNAL \ram~41_q\ : std_logic;
SIGNAL \ram~25_q\ : std_logic;
SIGNAL \ram~17_q\ : std_logic;
SIGNAL \ram~185_combout\ : std_logic;
SIGNAL \ram~186_combout\ : std_logic;
SIGNAL \ram~57feeder_combout\ : std_logic;
SIGNAL \ram~57_q\ : std_logic;
SIGNAL \ram~73_q\ : std_logic;
SIGNAL \ram~49_q\ : std_logic;
SIGNAL \ram~65_q\ : std_logic;
SIGNAL \ram~183_combout\ : std_logic;
SIGNAL \ram~184_combout\ : std_logic;
SIGNAL \ram~187_combout\ : std_logic;
SIGNAL \ram~89feeder_combout\ : std_logic;
SIGNAL \ram~89_q\ : std_logic;
SIGNAL \ram~81_q\ : std_logic;
SIGNAL \ram~181_combout\ : std_logic;
SIGNAL \ram~105_q\ : std_logic;
SIGNAL \ram~97feeder_combout\ : std_logic;
SIGNAL \ram~97_q\ : std_logic;
SIGNAL \ram~182_combout\ : std_logic;
SIGNAL \ram~121feeder_combout\ : std_logic;
SIGNAL \ram~121_q\ : std_logic;
SIGNAL \ram~137_q\ : std_logic;
SIGNAL \ram~129feeder_combout\ : std_logic;
SIGNAL \ram~129_q\ : std_logic;
SIGNAL \ram~113_q\ : std_logic;
SIGNAL \ram~188_combout\ : std_logic;
SIGNAL \ram~189_combout\ : std_logic;
SIGNAL \ram~190_combout\ : std_logic;
SIGNAL \data[5]~input_o\ : std_logic;
SIGNAL \ram~66feeder_combout\ : std_logic;
SIGNAL \ram~66_q\ : std_logic;
SIGNAL \ram~130_q\ : std_logic;
SIGNAL \ram~34_q\ : std_logic;
SIGNAL \ram~98feeder_combout\ : std_logic;
SIGNAL \ram~98_q\ : std_logic;
SIGNAL \ram~191_combout\ : std_logic;
SIGNAL \ram~192_combout\ : std_logic;
SIGNAL \ram~82_q\ : std_logic;
SIGNAL \ram~18_q\ : std_logic;
SIGNAL \ram~195_combout\ : std_logic;
SIGNAL \ram~50feeder_combout\ : std_logic;
SIGNAL \ram~50_q\ : std_logic;
SIGNAL \ram~114_q\ : std_logic;
SIGNAL \ram~196_combout\ : std_logic;
SIGNAL \ram~90_q\ : std_logic;
SIGNAL \ram~122_q\ : std_logic;
SIGNAL \ram~58_q\ : std_logic;
SIGNAL \ram~26_q\ : std_logic;
SIGNAL \ram~193_combout\ : std_logic;
SIGNAL \ram~194_combout\ : std_logic;
SIGNAL \ram~197_combout\ : std_logic;
SIGNAL \ram~74feeder_combout\ : std_logic;
SIGNAL \ram~74_q\ : std_logic;
SIGNAL \ram~42_q\ : std_logic;
SIGNAL \ram~198_combout\ : std_logic;
SIGNAL \ram~138_q\ : std_logic;
SIGNAL \ram~106_q\ : std_logic;
SIGNAL \ram~199_combout\ : std_logic;
SIGNAL \ram~200_combout\ : std_logic;
SIGNAL \data[6]~input_o\ : std_logic;
SIGNAL \ram~67_q\ : std_logic;
SIGNAL \ram~59feeder_combout\ : std_logic;
SIGNAL \ram~59_q\ : std_logic;
SIGNAL \ram~51_q\ : std_logic;
SIGNAL \ram~201_combout\ : std_logic;
SIGNAL \ram~75_q\ : std_logic;
SIGNAL \ram~202_combout\ : std_logic;
SIGNAL \ram~131_q\ : std_logic;
SIGNAL \ram~115_q\ : std_logic;
SIGNAL \ram~123_q\ : std_logic;
SIGNAL \ram~208_combout\ : std_logic;
SIGNAL \ram~139_q\ : std_logic;
SIGNAL \ram~209_combout\ : std_logic;
SIGNAL \ram~27feeder_combout\ : std_logic;
SIGNAL \ram~27_q\ : std_logic;
SIGNAL \ram~43_q\ : std_logic;
SIGNAL \ram~35feeder_combout\ : std_logic;
SIGNAL \ram~35_q\ : std_logic;
SIGNAL \ram~19_q\ : std_logic;
SIGNAL \ram~205_combout\ : std_logic;
SIGNAL \ram~206_combout\ : std_logic;
SIGNAL \ram~99feeder_combout\ : std_logic;
SIGNAL \ram~99_q\ : std_logic;
SIGNAL \ram~83_q\ : std_logic;
SIGNAL \ram~203_combout\ : std_logic;
SIGNAL \ram~107_q\ : std_logic;
SIGNAL \ram~91_q\ : std_logic;
SIGNAL \ram~204_combout\ : std_logic;
SIGNAL \ram~207_combout\ : std_logic;
SIGNAL \ram~210_combout\ : std_logic;
SIGNAL \data[7]~input_o\ : std_logic;
SIGNAL \ram~20_q\ : std_logic;
SIGNAL \ram~52feeder_combout\ : std_logic;
SIGNAL \ram~52_q\ : std_logic;
SIGNAL \ram~215_combout\ : std_logic;
SIGNAL \ram~84_q\ : std_logic;
SIGNAL \ram~116_q\ : std_logic;
SIGNAL \ram~216_combout\ : std_logic;
SIGNAL \ram~68feeder_combout\ : std_logic;
SIGNAL \ram~68_q\ : std_logic;
SIGNAL \ram~36_q\ : std_logic;
SIGNAL \ram~213_combout\ : std_logic;
SIGNAL \ram~132_q\ : std_logic;
SIGNAL \ram~100_q\ : std_logic;
SIGNAL \ram~214_combout\ : std_logic;
SIGNAL \ram~217_combout\ : std_logic;
SIGNAL \ram~108feeder_combout\ : std_logic;
SIGNAL \ram~108_q\ : std_logic;
SIGNAL \ram~44_q\ : std_logic;
SIGNAL \ram~218_combout\ : std_logic;
SIGNAL \ram~76feeder_combout\ : std_logic;
SIGNAL \ram~76_q\ : std_logic;
SIGNAL \ram~140_q\ : std_logic;
SIGNAL \ram~219_combout\ : std_logic;
SIGNAL \ram~92feeder_combout\ : std_logic;
SIGNAL \ram~92_q\ : std_logic;
SIGNAL \ram~28_q\ : std_logic;
SIGNAL \ram~211_combout\ : std_logic;
SIGNAL \ram~60_q\ : std_logic;
SIGNAL \ram~124_q\ : std_logic;
SIGNAL \ram~212_combout\ : std_logic;
SIGNAL \ram~220_combout\ : std_logic;
SIGNAL \ALT_INV_write~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_write <= write;
ww_address <= IEEE.STD_LOGIC_ARITH.CONV_STD_LOGIC_VECTOR(address, 4);
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_write~input_o\ <= NOT \write~input_o\;

-- Location: IOOBUF_X14_Y0_N9
\data[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~150_combout\,
	oe => \ALT_INV_write~input_o\,
	devoe => ww_devoe,
	o => \data[0]~output_o\);

-- Location: IOOBUF_X24_Y0_N2
\data[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~160_combout\,
	oe => \ALT_INV_write~input_o\,
	devoe => ww_devoe,
	o => \data[1]~output_o\);

-- Location: IOOBUF_X14_Y0_N2
\data[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~170_combout\,
	oe => \ALT_INV_write~input_o\,
	devoe => ww_devoe,
	o => \data[2]~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\data[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~180_combout\,
	oe => \ALT_INV_write~input_o\,
	devoe => ww_devoe,
	o => \data[3]~output_o\);

-- Location: IOOBUF_X33_Y14_N2
\data[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~190_combout\,
	oe => \ALT_INV_write~input_o\,
	devoe => ww_devoe,
	o => \data[4]~output_o\);

-- Location: IOOBUF_X33_Y10_N2
\data[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~200_combout\,
	oe => \ALT_INV_write~input_o\,
	devoe => ww_devoe,
	o => \data[5]~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\data[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~210_combout\,
	oe => \ALT_INV_write~input_o\,
	devoe => ww_devoe,
	o => \data[6]~output_o\);

-- Location: IOOBUF_X33_Y15_N2
\data[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~220_combout\,
	oe => \ALT_INV_write~input_o\,
	devoe => ww_devoe,
	o => \data[7]~output_o\);

-- Location: IOIBUF_X14_Y31_N8
\address[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(0),
	o => \address[0]~input_o\);

-- Location: IOIBUF_X16_Y0_N15
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G17
\clk~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X14_Y0_N8
\data[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => data(0),
	o => \data[0]~input_o\);

-- Location: IOIBUF_X33_Y10_N8
\write~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write,
	o => \write~input_o\);

-- Location: IOIBUF_X33_Y14_N8
\address[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(1),
	o => \address[1]~input_o\);

-- Location: IOIBUF_X8_Y0_N8
\address[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(3),
	o => \address[3]~input_o\);

-- Location: IOIBUF_X33_Y15_N8
\address[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(2),
	o => \address[2]~input_o\);

-- Location: LCCOMB_X16_Y15_N26
\ram~223\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~223_combout\ = (\address[0]~input_o\ & (!\address[1]~input_o\ & (\address[3]~input_o\ & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[3]~input_o\,
	datad => \address[2]~input_o\,
	combout => \ram~223_combout\);

-- Location: LCCOMB_X16_Y15_N12
\ram~224\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~224_combout\ = (\write~input_o\ & \ram~223_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \write~input_o\,
	datac => \ram~223_combout\,
	combout => \ram~224_combout\);

-- Location: FF_X14_Y15_N17
\ram~85\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[0]~input_o\,
	sload => VCC,
	ena => \ram~224_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~85_q\);

-- Location: LCCOMB_X13_Y15_N10
\ram~225\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~225_combout\ = (!\address[0]~input_o\ & (!\address[2]~input_o\ & (\address[3]~input_o\ & !\address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[2]~input_o\,
	datac => \address[3]~input_o\,
	datad => \address[1]~input_o\,
	combout => \ram~225_combout\);

-- Location: LCCOMB_X13_Y15_N20
\ram~226\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~226_combout\ = (\ram~225_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~225_combout\,
	datac => \write~input_o\,
	combout => \ram~226_combout\);

-- Location: FF_X13_Y15_N9
\ram~77\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[0]~input_o\,
	sload => VCC,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~77_q\);

-- Location: LCCOMB_X13_Y15_N8
\ram~141\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~141_combout\ = (\address[0]~input_o\ & ((\ram~85_q\) # ((\address[1]~input_o\)))) # (!\address[0]~input_o\ & (((\ram~77_q\ & !\address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~85_q\,
	datac => \ram~77_q\,
	datad => \address[1]~input_o\,
	combout => \ram~141_combout\);

-- Location: LCCOMB_X16_Y15_N30
\ram~227\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~227_combout\ = (\address[0]~input_o\ & (\address[1]~input_o\ & (\address[3]~input_o\ & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[3]~input_o\,
	datad => \address[2]~input_o\,
	combout => \ram~227_combout\);

-- Location: LCCOMB_X17_Y14_N24
\ram~228\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~228_combout\ = (\write~input_o\ & \ram~227_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \write~input_o\,
	datac => \ram~227_combout\,
	combout => \ram~228_combout\);

-- Location: FF_X14_Y15_N27
\ram~101\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[0]~input_o\,
	sload => VCC,
	ena => \ram~228_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~101_q\);

-- Location: LCCOMB_X17_Y14_N8
\ram~93feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~93feeder_combout\ = \data[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[0]~input_o\,
	combout => \ram~93feeder_combout\);

-- Location: LCCOMB_X16_Y15_N24
\ram~221\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~221_combout\ = (!\address[0]~input_o\ & (\address[1]~input_o\ & (\address[3]~input_o\ & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[3]~input_o\,
	datad => \address[2]~input_o\,
	combout => \ram~221_combout\);

-- Location: LCCOMB_X17_Y14_N22
\ram~222\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~222_combout\ = (\write~input_o\ & \ram~221_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \write~input_o\,
	datac => \ram~221_combout\,
	combout => \ram~222_combout\);

-- Location: FF_X17_Y14_N9
\ram~93\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~93feeder_combout\,
	ena => \ram~222_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~93_q\);

-- Location: LCCOMB_X14_Y15_N26
\ram~142\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~142_combout\ = (\ram~141_combout\ & (((\ram~101_q\)) # (!\address[1]~input_o\))) # (!\ram~141_combout\ & (\address[1]~input_o\ & ((\ram~93_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~141_combout\,
	datab => \address[1]~input_o\,
	datac => \ram~101_q\,
	datad => \ram~93_q\,
	combout => \ram~142_combout\);

-- Location: LCCOMB_X18_Y18_N8
\ram~125feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~125feeder_combout\ = \data[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[0]~input_o\,
	combout => \ram~125feeder_combout\);

-- Location: LCCOMB_X18_Y18_N28
\ram~247\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~247_combout\ = (\address[3]~input_o\ & (\address[1]~input_o\ & (\address[2]~input_o\ & !\address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[2]~input_o\,
	datad => \address[0]~input_o\,
	combout => \ram~247_combout\);

-- Location: LCCOMB_X18_Y18_N14
\ram~248\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~248_combout\ = (\ram~247_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ram~247_combout\,
	datac => \write~input_o\,
	combout => \ram~248_combout\);

-- Location: FF_X18_Y18_N9
\ram~125\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~125feeder_combout\,
	ena => \ram~248_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~125_q\);

-- Location: LCCOMB_X18_Y18_N24
\ram~249\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~249_combout\ = (\address[3]~input_o\ & (!\address[1]~input_o\ & (\address[2]~input_o\ & !\address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[2]~input_o\,
	datad => \address[0]~input_o\,
	combout => \ram~249_combout\);

-- Location: LCCOMB_X18_Y18_N2
\ram~250\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~250_combout\ = (\ram~249_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ram~249_combout\,
	datac => \write~input_o\,
	combout => \ram~250_combout\);

-- Location: FF_X18_Y15_N17
\ram~109\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[0]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~109_q\);

-- Location: LCCOMB_X18_Y15_N16
\ram~148\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~148_combout\ = (\address[0]~input_o\ & (((\address[1]~input_o\)))) # (!\address[0]~input_o\ & ((\address[1]~input_o\ & (\ram~125_q\)) # (!\address[1]~input_o\ & ((\ram~109_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~125_q\,
	datac => \ram~109_q\,
	datad => \address[1]~input_o\,
	combout => \ram~148_combout\);

-- Location: LCCOMB_X18_Y18_N12
\ram~251\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~251_combout\ = (\address[3]~input_o\ & (\address[1]~input_o\ & (\address[2]~input_o\ & \address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[2]~input_o\,
	datad => \address[0]~input_o\,
	combout => \ram~251_combout\);

-- Location: LCCOMB_X18_Y18_N22
\ram~252\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~252_combout\ = (\ram~251_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~251_combout\,
	datac => \write~input_o\,
	combout => \ram~252_combout\);

-- Location: FF_X16_Y15_N29
\ram~133\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[0]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~133_q\);

-- Location: LCCOMB_X18_Y18_N16
\ram~245\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~245_combout\ = (\address[3]~input_o\ & (!\address[1]~input_o\ & (\address[2]~input_o\ & \address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[2]~input_o\,
	datad => \address[0]~input_o\,
	combout => \ram~245_combout\);

-- Location: LCCOMB_X18_Y18_N18
\ram~246\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~246_combout\ = (\write~input_o\ & \ram~245_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write~input_o\,
	datad => \ram~245_combout\,
	combout => \ram~246_combout\);

-- Location: FF_X16_Y15_N19
\ram~117\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[0]~input_o\,
	sload => VCC,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~117_q\);

-- Location: LCCOMB_X16_Y15_N28
\ram~149\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~149_combout\ = (\address[0]~input_o\ & ((\ram~148_combout\ & (\ram~133_q\)) # (!\ram~148_combout\ & ((\ram~117_q\))))) # (!\address[0]~input_o\ & (\ram~148_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~148_combout\,
	datac => \ram~133_q\,
	datad => \ram~117_q\,
	combout => \ram~149_combout\);

-- Location: LCCOMB_X16_Y15_N16
\ram~239\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~239_combout\ = (\address[0]~input_o\ & (!\address[1]~input_o\ & (!\address[3]~input_o\ & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[3]~input_o\,
	datad => \address[2]~input_o\,
	combout => \ram~239_combout\);

-- Location: LCCOMB_X16_Y15_N2
\ram~240\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~240_combout\ = (\write~input_o\ & \ram~239_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write~input_o\,
	datad => \ram~239_combout\,
	combout => \ram~240_combout\);

-- Location: FF_X20_Y15_N1
\ram~21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[0]~input_o\,
	sload => VCC,
	ena => \ram~240_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~21_q\);

-- Location: LCCOMB_X16_Y15_N20
\ram~241\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~241_combout\ = (!\address[0]~input_o\ & (!\address[1]~input_o\ & (!\address[3]~input_o\ & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[3]~input_o\,
	datad => \address[2]~input_o\,
	combout => \ram~241_combout\);

-- Location: LCCOMB_X20_Y15_N14
\ram~242\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~242_combout\ = (\write~input_o\ & \ram~241_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write~input_o\,
	datad => \ram~241_combout\,
	combout => \ram~242_combout\);

-- Location: FF_X20_Y15_N19
\ram~13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[0]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~13_q\);

-- Location: LCCOMB_X20_Y15_N18
\ram~145\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~145_combout\ = (\address[0]~input_o\ & ((\ram~21_q\) # ((\address[1]~input_o\)))) # (!\address[0]~input_o\ & (((\ram~13_q\ & !\address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~21_q\,
	datac => \ram~13_q\,
	datad => \address[1]~input_o\,
	combout => \ram~145_combout\);

-- Location: LCCOMB_X16_Y15_N4
\ram~237\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~237_combout\ = (!\address[0]~input_o\ & (\address[1]~input_o\ & (!\address[3]~input_o\ & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[3]~input_o\,
	datad => \address[2]~input_o\,
	combout => \ram~237_combout\);

-- Location: LCCOMB_X16_Y15_N6
\ram~238\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~238_combout\ = (\write~input_o\ & \ram~237_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \write~input_o\,
	datac => \ram~237_combout\,
	combout => \ram~238_combout\);

-- Location: FF_X13_Y14_N1
\ram~29\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[0]~input_o\,
	sload => VCC,
	ena => \ram~238_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~29_q\);

-- Location: LCCOMB_X16_Y15_N22
\ram~243\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~243_combout\ = (\address[0]~input_o\ & (\address[1]~input_o\ & (!\address[3]~input_o\ & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[3]~input_o\,
	datad => \address[2]~input_o\,
	combout => \ram~243_combout\);

-- Location: LCCOMB_X13_Y14_N30
\ram~244\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~244_combout\ = (\ram~243_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ram~243_combout\,
	datad => \write~input_o\,
	combout => \ram~244_combout\);

-- Location: FF_X13_Y14_N27
\ram~37\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[0]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~37_q\);

-- Location: LCCOMB_X13_Y14_N26
\ram~146\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~146_combout\ = (\ram~145_combout\ & (((\ram~37_q\) # (!\address[1]~input_o\)))) # (!\ram~145_combout\ & (\ram~29_q\ & ((\address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~145_combout\,
	datab => \ram~29_q\,
	datac => \ram~37_q\,
	datad => \address[1]~input_o\,
	combout => \ram~146_combout\);

-- Location: LCCOMB_X17_Y15_N0
\ram~53feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~53feeder_combout\ = \data[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[0]~input_o\,
	combout => \ram~53feeder_combout\);

-- Location: LCCOMB_X17_Y15_N22
\ram~229\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~229_combout\ = (!\address[3]~input_o\ & (\address[2]~input_o\ & (!\address[1]~input_o\ & \address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \address[2]~input_o\,
	datac => \address[1]~input_o\,
	datad => \address[0]~input_o\,
	combout => \ram~229_combout\);

-- Location: LCCOMB_X17_Y15_N16
\ram~230\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~230_combout\ = (\ram~229_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~229_combout\,
	datac => \write~input_o\,
	combout => \ram~230_combout\);

-- Location: FF_X17_Y15_N1
\ram~53\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~53feeder_combout\,
	ena => \ram~230_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~53_q\);

-- Location: LCCOMB_X16_Y15_N10
\ram~235\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~235_combout\ = (\address[0]~input_o\ & (\address[1]~input_o\ & (!\address[3]~input_o\ & \address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[3]~input_o\,
	datad => \address[2]~input_o\,
	combout => \ram~235_combout\);

-- Location: LCCOMB_X20_Y14_N20
\ram~236\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~236_combout\ = (\ram~235_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~235_combout\,
	datac => \write~input_o\,
	combout => \ram~236_combout\);

-- Location: FF_X20_Y14_N1
\ram~69\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[0]~input_o\,
	sload => VCC,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~69_q\);

-- Location: LCCOMB_X16_Y15_N8
\ram~233\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~233_combout\ = (!\address[0]~input_o\ & (!\address[1]~input_o\ & (!\address[3]~input_o\ & \address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[3]~input_o\,
	datad => \address[2]~input_o\,
	combout => \ram~233_combout\);

-- Location: LCCOMB_X17_Y14_N4
\ram~234\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~234_combout\ = (\write~input_o\ & \ram~233_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \write~input_o\,
	datac => \ram~233_combout\,
	combout => \ram~234_combout\);

-- Location: FF_X18_Y14_N27
\ram~45\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[0]~input_o\,
	sload => VCC,
	ena => \ram~234_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~45_q\);

-- Location: LCCOMB_X18_Y15_N26
\ram~231\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~231_combout\ = (!\address[0]~input_o\ & (\address[1]~input_o\ & (!\address[3]~input_o\ & \address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[3]~input_o\,
	datad => \address[2]~input_o\,
	combout => \ram~231_combout\);

-- Location: LCCOMB_X17_Y14_N26
\ram~232\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~232_combout\ = (\write~input_o\ & \ram~231_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write~input_o\,
	datad => \ram~231_combout\,
	combout => \ram~232_combout\);

-- Location: FF_X18_Y14_N17
\ram~61\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[0]~input_o\,
	sload => VCC,
	ena => \ram~232_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~61_q\);

-- Location: LCCOMB_X18_Y14_N26
\ram~143\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~143_combout\ = (\address[1]~input_o\ & ((\address[0]~input_o\) # ((\ram~61_q\)))) # (!\address[1]~input_o\ & (!\address[0]~input_o\ & (\ram~45_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \ram~45_q\,
	datad => \ram~61_q\,
	combout => \ram~143_combout\);

-- Location: LCCOMB_X20_Y14_N0
\ram~144\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~144_combout\ = (\address[0]~input_o\ & ((\ram~143_combout\ & ((\ram~69_q\))) # (!\ram~143_combout\ & (\ram~53_q\)))) # (!\address[0]~input_o\ & (((\ram~143_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~53_q\,
	datac => \ram~69_q\,
	datad => \ram~143_combout\,
	combout => \ram~144_combout\);

-- Location: LCCOMB_X16_Y15_N0
\ram~147\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~147_combout\ = (\address[3]~input_o\ & (((\address[2]~input_o\)))) # (!\address[3]~input_o\ & ((\address[2]~input_o\ & ((\ram~144_combout\))) # (!\address[2]~input_o\ & (\ram~146_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~146_combout\,
	datab => \ram~144_combout\,
	datac => \address[3]~input_o\,
	datad => \address[2]~input_o\,
	combout => \ram~147_combout\);

-- Location: LCCOMB_X16_Y15_N14
\ram~150\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~150_combout\ = (\address[3]~input_o\ & ((\ram~147_combout\ & ((\ram~149_combout\))) # (!\ram~147_combout\ & (\ram~142_combout\)))) # (!\address[3]~input_o\ & (((\ram~147_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~142_combout\,
	datab => \ram~149_combout\,
	datac => \address[3]~input_o\,
	datad => \ram~147_combout\,
	combout => \ram~150_combout\);

-- Location: IOIBUF_X24_Y0_N1
\data[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => data(1),
	o => \data[1]~input_o\);

-- Location: FF_X20_Y14_N19
\ram~70\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[1]~input_o\,
	sload => VCC,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~70_q\);

-- Location: FF_X13_Y14_N5
\ram~38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[1]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~38_q\);

-- Location: LCCOMB_X13_Y14_N4
\ram~158\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~158_combout\ = (\address[3]~input_o\ & (((\address[2]~input_o\)))) # (!\address[3]~input_o\ & ((\address[2]~input_o\ & (\ram~70_q\)) # (!\address[2]~input_o\ & ((\ram~38_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~70_q\,
	datac => \ram~38_q\,
	datad => \address[2]~input_o\,
	combout => \ram~158_combout\);

-- Location: FF_X20_Y14_N13
\ram~134\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[1]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~134_q\);

-- Location: FF_X14_Y15_N23
\ram~102\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[1]~input_o\,
	sload => VCC,
	ena => \ram~228_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~102_q\);

-- Location: LCCOMB_X20_Y14_N12
\ram~159\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~159_combout\ = (\ram~158_combout\ & (((\ram~134_q\)) # (!\address[3]~input_o\))) # (!\ram~158_combout\ & (\address[3]~input_o\ & ((\ram~102_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~158_combout\,
	datab => \address[3]~input_o\,
	datac => \ram~134_q\,
	datad => \ram~102_q\,
	combout => \ram~159_combout\);

-- Location: FF_X18_Y18_N11
\ram~30\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[1]~input_o\,
	sload => VCC,
	ena => \ram~238_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~30_q\);

-- Location: FF_X17_Y14_N19
\ram~94\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[1]~input_o\,
	sload => VCC,
	ena => \ram~222_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~94_q\);

-- Location: LCCOMB_X18_Y18_N10
\ram~151\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~151_combout\ = (\address[3]~input_o\ & ((\address[2]~input_o\) # ((\ram~94_q\)))) # (!\address[3]~input_o\ & (!\address[2]~input_o\ & (\ram~30_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \address[2]~input_o\,
	datac => \ram~30_q\,
	datad => \ram~94_q\,
	combout => \ram~151_combout\);

-- Location: FF_X18_Y18_N21
\ram~126\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[1]~input_o\,
	sload => VCC,
	ena => \ram~248_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~126_q\);

-- Location: LCCOMB_X18_Y14_N4
\ram~62feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~62feeder_combout\ = \data[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[1]~input_o\,
	combout => \ram~62feeder_combout\);

-- Location: FF_X18_Y14_N5
\ram~62\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~62feeder_combout\,
	ena => \ram~232_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~62_q\);

-- Location: LCCOMB_X18_Y18_N20
\ram~152\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~152_combout\ = (\ram~151_combout\ & (((\ram~126_q\)) # (!\address[2]~input_o\))) # (!\ram~151_combout\ & (\address[2]~input_o\ & ((\ram~62_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~151_combout\,
	datab => \address[2]~input_o\,
	datac => \ram~126_q\,
	datad => \ram~62_q\,
	combout => \ram~152_combout\);

-- Location: LCCOMB_X18_Y14_N14
\ram~46feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~46feeder_combout\ = \data[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[1]~input_o\,
	combout => \ram~46feeder_combout\);

-- Location: FF_X18_Y14_N15
\ram~46\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~46feeder_combout\,
	ena => \ram~234_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~46_q\);

-- Location: FF_X18_Y15_N11
\ram~110\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[1]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~110_q\);

-- Location: FF_X20_Y15_N29
\ram~14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[1]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~14_q\);

-- Location: FF_X13_Y15_N27
\ram~78\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[1]~input_o\,
	sload => VCC,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~78_q\);

-- Location: LCCOMB_X20_Y15_N28
\ram~155\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~155_combout\ = (\address[2]~input_o\ & (\address[3]~input_o\)) # (!\address[2]~input_o\ & ((\address[3]~input_o\ & ((\ram~78_q\))) # (!\address[3]~input_o\ & (\ram~14_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[2]~input_o\,
	datab => \address[3]~input_o\,
	datac => \ram~14_q\,
	datad => \ram~78_q\,
	combout => \ram~155_combout\);

-- Location: LCCOMB_X18_Y15_N10
\ram~156\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~156_combout\ = (\address[2]~input_o\ & ((\ram~155_combout\ & ((\ram~110_q\))) # (!\ram~155_combout\ & (\ram~46_q\)))) # (!\address[2]~input_o\ & (((\ram~155_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[2]~input_o\,
	datab => \ram~46_q\,
	datac => \ram~110_q\,
	datad => \ram~155_combout\,
	combout => \ram~156_combout\);

-- Location: FF_X17_Y15_N21
\ram~22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[1]~input_o\,
	sload => VCC,
	ena => \ram~240_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~22_q\);

-- Location: FF_X17_Y15_N3
\ram~54\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[1]~input_o\,
	sload => VCC,
	ena => \ram~230_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~54_q\);

-- Location: LCCOMB_X17_Y15_N20
\ram~153\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~153_combout\ = (\address[3]~input_o\ & (\address[2]~input_o\)) # (!\address[3]~input_o\ & ((\address[2]~input_o\ & ((\ram~54_q\))) # (!\address[2]~input_o\ & (\ram~22_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \address[2]~input_o\,
	datac => \ram~22_q\,
	datad => \ram~54_q\,
	combout => \ram~153_combout\);

-- Location: FF_X19_Y15_N1
\ram~118\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[1]~input_o\,
	sload => VCC,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~118_q\);

-- Location: FF_X14_Y15_N21
\ram~86\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[1]~input_o\,
	sload => VCC,
	ena => \ram~224_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~86_q\);

-- Location: LCCOMB_X19_Y15_N0
\ram~154\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~154_combout\ = (\ram~153_combout\ & (((\ram~118_q\)) # (!\address[3]~input_o\))) # (!\ram~153_combout\ & (\address[3]~input_o\ & ((\ram~86_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~153_combout\,
	datab => \address[3]~input_o\,
	datac => \ram~118_q\,
	datad => \ram~86_q\,
	combout => \ram~154_combout\);

-- Location: LCCOMB_X20_Y15_N30
\ram~157\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~157_combout\ = (\address[0]~input_o\ & (((\ram~154_combout\) # (\address[1]~input_o\)))) # (!\address[0]~input_o\ & (\ram~156_combout\ & ((!\address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~156_combout\,
	datab => \address[0]~input_o\,
	datac => \ram~154_combout\,
	datad => \address[1]~input_o\,
	combout => \ram~157_combout\);

-- Location: LCCOMB_X20_Y15_N8
\ram~160\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~160_combout\ = (\ram~157_combout\ & ((\ram~159_combout\) # ((!\address[1]~input_o\)))) # (!\ram~157_combout\ & (((\ram~152_combout\ & \address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~159_combout\,
	datab => \ram~152_combout\,
	datac => \ram~157_combout\,
	datad => \address[1]~input_o\,
	combout => \ram~160_combout\);

-- Location: IOIBUF_X14_Y0_N1
\data[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => data(2),
	o => \data[2]~input_o\);

-- Location: LCCOMB_X17_Y15_N30
\ram~55feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~55feeder_combout\ = \data[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[2]~input_o\,
	combout => \ram~55feeder_combout\);

-- Location: FF_X17_Y15_N31
\ram~55\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~55feeder_combout\,
	ena => \ram~230_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~55_q\);

-- Location: FF_X18_Y14_N3
\ram~47\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[2]~input_o\,
	sload => VCC,
	ena => \ram~234_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~47_q\);

-- Location: LCCOMB_X18_Y14_N2
\ram~161\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~161_combout\ = (\address[0]~input_o\ & ((\ram~55_q\) # ((\address[1]~input_o\)))) # (!\address[0]~input_o\ & (((\ram~47_q\ & !\address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~55_q\,
	datab => \address[0]~input_o\,
	datac => \ram~47_q\,
	datad => \address[1]~input_o\,
	combout => \ram~161_combout\);

-- Location: LCCOMB_X18_Y14_N24
\ram~63feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~63feeder_combout\ = \data[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[2]~input_o\,
	combout => \ram~63feeder_combout\);

-- Location: FF_X18_Y14_N25
\ram~63\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~63feeder_combout\,
	ena => \ram~232_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~63_q\);

-- Location: FF_X20_Y14_N31
\ram~71\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[2]~input_o\,
	sload => VCC,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~71_q\);

-- Location: LCCOMB_X20_Y14_N30
\ram~162\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~162_combout\ = (\ram~161_combout\ & (((\ram~71_q\) # (!\address[1]~input_o\)))) # (!\ram~161_combout\ & (\ram~63_q\ & ((\address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~161_combout\,
	datab => \ram~63_q\,
	datac => \ram~71_q\,
	datad => \address[1]~input_o\,
	combout => \ram~162_combout\);

-- Location: FF_X13_Y15_N13
\ram~95\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[2]~input_o\,
	sload => VCC,
	ena => \ram~222_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~95_q\);

-- Location: FF_X13_Y15_N15
\ram~79\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[2]~input_o\,
	sload => VCC,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~79_q\);

-- Location: LCCOMB_X13_Y15_N14
\ram~163\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~163_combout\ = (\address[0]~input_o\ & (((\address[1]~input_o\)))) # (!\address[0]~input_o\ & ((\address[1]~input_o\ & (\ram~95_q\)) # (!\address[1]~input_o\ & ((\ram~79_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~95_q\,
	datac => \ram~79_q\,
	datad => \address[1]~input_o\,
	combout => \ram~163_combout\);

-- Location: FF_X14_Y15_N9
\ram~87\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[2]~input_o\,
	sload => VCC,
	ena => \ram~224_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~87_q\);

-- Location: FF_X14_Y15_N19
\ram~103\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[2]~input_o\,
	sload => VCC,
	ena => \ram~228_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~103_q\);

-- Location: LCCOMB_X14_Y15_N18
\ram~164\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~164_combout\ = (\ram~163_combout\ & (((\ram~103_q\) # (!\address[0]~input_o\)))) # (!\ram~163_combout\ & (\ram~87_q\ & ((\address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~163_combout\,
	datab => \ram~87_q\,
	datac => \ram~103_q\,
	datad => \address[0]~input_o\,
	combout => \ram~164_combout\);

-- Location: LCCOMB_X17_Y14_N12
\ram~31feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~31feeder_combout\ = \data[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[2]~input_o\,
	combout => \ram~31feeder_combout\);

-- Location: FF_X17_Y14_N13
\ram~31\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~31feeder_combout\,
	ena => \ram~238_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~31_q\);

-- Location: FF_X20_Y15_N13
\ram~15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[2]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~15_q\);

-- Location: LCCOMB_X20_Y15_N12
\ram~165\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~165_combout\ = (\address[0]~input_o\ & (((\address[1]~input_o\)))) # (!\address[0]~input_o\ & ((\address[1]~input_o\ & (\ram~31_q\)) # (!\address[1]~input_o\ & ((\ram~15_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~31_q\,
	datab => \address[0]~input_o\,
	datac => \ram~15_q\,
	datad => \address[1]~input_o\,
	combout => \ram~165_combout\);

-- Location: FF_X13_Y14_N15
\ram~39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[2]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~39_q\);

-- Location: LCCOMB_X20_Y15_N10
\ram~23feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~23feeder_combout\ = \data[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[2]~input_o\,
	combout => \ram~23feeder_combout\);

-- Location: FF_X20_Y15_N11
\ram~23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~23feeder_combout\,
	ena => \ram~240_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~23_q\);

-- Location: LCCOMB_X13_Y14_N14
\ram~166\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~166_combout\ = (\address[0]~input_o\ & ((\ram~165_combout\ & (\ram~39_q\)) # (!\ram~165_combout\ & ((\ram~23_q\))))) # (!\address[0]~input_o\ & (\ram~165_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~165_combout\,
	datac => \ram~39_q\,
	datad => \ram~23_q\,
	combout => \ram~166_combout\);

-- Location: LCCOMB_X13_Y14_N24
\ram~167\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~167_combout\ = (\address[3]~input_o\ & ((\ram~164_combout\) # ((\address[2]~input_o\)))) # (!\address[3]~input_o\ & (((\ram~166_combout\ & !\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~164_combout\,
	datac => \ram~166_combout\,
	datad => \address[2]~input_o\,
	combout => \ram~167_combout\);

-- Location: FF_X18_Y18_N31
\ram~127\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[2]~input_o\,
	sload => VCC,
	ena => \ram~248_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~127_q\);

-- Location: FF_X20_Y14_N25
\ram~135\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[2]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~135_q\);

-- Location: FF_X19_Y15_N27
\ram~119\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[2]~input_o\,
	sload => VCC,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~119_q\);

-- Location: FF_X18_Y15_N29
\ram~111\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[2]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~111_q\);

-- Location: LCCOMB_X18_Y15_N28
\ram~168\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~168_combout\ = (\address[0]~input_o\ & ((\ram~119_q\) # ((\address[1]~input_o\)))) # (!\address[0]~input_o\ & (((\ram~111_q\ & !\address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~119_q\,
	datac => \ram~111_q\,
	datad => \address[1]~input_o\,
	combout => \ram~168_combout\);

-- Location: LCCOMB_X20_Y14_N24
\ram~169\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~169_combout\ = (\address[1]~input_o\ & ((\ram~168_combout\ & ((\ram~135_q\))) # (!\ram~168_combout\ & (\ram~127_q\)))) # (!\address[1]~input_o\ & (((\ram~168_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \ram~127_q\,
	datac => \ram~135_q\,
	datad => \ram~168_combout\,
	combout => \ram~169_combout\);

-- Location: LCCOMB_X13_Y14_N10
\ram~170\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~170_combout\ = (\ram~167_combout\ & (((\ram~169_combout\) # (!\address[2]~input_o\)))) # (!\ram~167_combout\ & (\ram~162_combout\ & ((\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~162_combout\,
	datab => \ram~167_combout\,
	datac => \ram~169_combout\,
	datad => \address[2]~input_o\,
	combout => \ram~170_combout\);

-- Location: IOIBUF_X20_Y0_N1
\data[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => data(3),
	o => \data[3]~input_o\);

-- Location: LCCOMB_X18_Y14_N20
\ram~64feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~64feeder_combout\ = \data[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[3]~input_o\,
	combout => \ram~64feeder_combout\);

-- Location: FF_X18_Y14_N21
\ram~64\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~64feeder_combout\,
	ena => \ram~232_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~64_q\);

-- Location: FF_X17_Y14_N17
\ram~32\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[3]~input_o\,
	sload => VCC,
	ena => \ram~238_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~32_q\);

-- Location: LCCOMB_X17_Y14_N16
\ram~173\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~173_combout\ = (\address[2]~input_o\ & ((\ram~64_q\) # ((\address[3]~input_o\)))) # (!\address[2]~input_o\ & (((\ram~32_q\ & !\address[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~64_q\,
	datab => \address[2]~input_o\,
	datac => \ram~32_q\,
	datad => \address[3]~input_o\,
	combout => \ram~173_combout\);

-- Location: FF_X17_Y14_N15
\ram~96\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[3]~input_o\,
	sload => VCC,
	ena => \ram~222_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~96_q\);

-- Location: FF_X18_Y15_N31
\ram~128\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[3]~input_o\,
	sload => VCC,
	ena => \ram~248_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~128_q\);

-- Location: LCCOMB_X18_Y15_N30
\ram~174\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~174_combout\ = (\ram~173_combout\ & (((\ram~128_q\) # (!\address[3]~input_o\)))) # (!\ram~173_combout\ & (\ram~96_q\ & ((\address[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~173_combout\,
	datab => \ram~96_q\,
	datac => \ram~128_q\,
	datad => \address[3]~input_o\,
	combout => \ram~174_combout\);

-- Location: LCCOMB_X13_Y15_N16
\ram~80feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~80feeder_combout\ = \data[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[3]~input_o\,
	combout => \ram~80feeder_combout\);

-- Location: FF_X13_Y15_N17
\ram~80\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~80feeder_combout\,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~80_q\);

-- Location: FF_X18_Y15_N25
\ram~112\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[3]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~112_q\);

-- Location: LCCOMB_X18_Y14_N22
\ram~48feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~48feeder_combout\ = \data[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[3]~input_o\,
	combout => \ram~48feeder_combout\);

-- Location: FF_X18_Y14_N23
\ram~48\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~48feeder_combout\,
	ena => \ram~234_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~48_q\);

-- Location: FF_X20_Y15_N23
\ram~16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[3]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~16_q\);

-- Location: LCCOMB_X20_Y15_N22
\ram~175\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~175_combout\ = (\address[3]~input_o\ & (((\address[2]~input_o\)))) # (!\address[3]~input_o\ & ((\address[2]~input_o\ & (\ram~48_q\)) # (!\address[2]~input_o\ & ((\ram~16_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~48_q\,
	datab => \address[3]~input_o\,
	datac => \ram~16_q\,
	datad => \address[2]~input_o\,
	combout => \ram~175_combout\);

-- Location: LCCOMB_X18_Y15_N24
\ram~176\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~176_combout\ = (\address[3]~input_o\ & ((\ram~175_combout\ & ((\ram~112_q\))) # (!\ram~175_combout\ & (\ram~80_q\)))) # (!\address[3]~input_o\ & (((\ram~175_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~80_q\,
	datac => \ram~112_q\,
	datad => \ram~175_combout\,
	combout => \ram~176_combout\);

-- Location: LCCOMB_X20_Y14_N26
\ram~177\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~177_combout\ = (\address[0]~input_o\ & (((\address[1]~input_o\)))) # (!\address[0]~input_o\ & ((\address[1]~input_o\ & (\ram~174_combout\)) # (!\address[1]~input_o\ & ((\ram~176_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~174_combout\,
	datac => \ram~176_combout\,
	datad => \address[1]~input_o\,
	combout => \ram~177_combout\);

-- Location: FF_X17_Y15_N27
\ram~24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[3]~input_o\,
	sload => VCC,
	ena => \ram~240_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~24_q\);

-- Location: LCCOMB_X14_Y15_N28
\ram~88feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~88feeder_combout\ = \data[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[3]~input_o\,
	combout => \ram~88feeder_combout\);

-- Location: FF_X14_Y15_N29
\ram~88\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~88feeder_combout\,
	ena => \ram~224_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~88_q\);

-- Location: LCCOMB_X17_Y15_N26
\ram~171\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~171_combout\ = (\address[3]~input_o\ & ((\address[2]~input_o\) # ((\ram~88_q\)))) # (!\address[3]~input_o\ & (!\address[2]~input_o\ & (\ram~24_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \address[2]~input_o\,
	datac => \ram~24_q\,
	datad => \ram~88_q\,
	combout => \ram~171_combout\);

-- Location: FF_X19_Y15_N21
\ram~120\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[3]~input_o\,
	sload => VCC,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~120_q\);

-- Location: LCCOMB_X17_Y15_N24
\ram~56feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~56feeder_combout\ = \data[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[3]~input_o\,
	combout => \ram~56feeder_combout\);

-- Location: FF_X17_Y15_N25
\ram~56\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~56feeder_combout\,
	ena => \ram~230_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~56_q\);

-- Location: LCCOMB_X19_Y15_N20
\ram~172\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~172_combout\ = (\address[2]~input_o\ & ((\ram~171_combout\ & (\ram~120_q\)) # (!\ram~171_combout\ & ((\ram~56_q\))))) # (!\address[2]~input_o\ & (\ram~171_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[2]~input_o\,
	datab => \ram~171_combout\,
	datac => \ram~120_q\,
	datad => \ram~56_q\,
	combout => \ram~172_combout\);

-- Location: LCCOMB_X14_Y15_N30
\ram~104feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~104feeder_combout\ = \data[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[3]~input_o\,
	combout => \ram~104feeder_combout\);

-- Location: FF_X14_Y15_N31
\ram~104\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~104feeder_combout\,
	ena => \ram~228_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~104_q\);

-- Location: FF_X13_Y14_N29
\ram~40\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[3]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~40_q\);

-- Location: LCCOMB_X13_Y14_N28
\ram~178\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~178_combout\ = (\address[3]~input_o\ & ((\ram~104_q\) # ((\address[2]~input_o\)))) # (!\address[3]~input_o\ & (((\ram~40_q\ & !\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~104_q\,
	datac => \ram~40_q\,
	datad => \address[2]~input_o\,
	combout => \ram~178_combout\);

-- Location: FF_X20_Y14_N29
\ram~72\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[3]~input_o\,
	sload => VCC,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~72_q\);

-- Location: FF_X20_Y14_N7
\ram~136\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[3]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~136_q\);

-- Location: LCCOMB_X20_Y14_N6
\ram~179\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~179_combout\ = (\ram~178_combout\ & (((\ram~136_q\) # (!\address[2]~input_o\)))) # (!\ram~178_combout\ & (\ram~72_q\ & ((\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~178_combout\,
	datab => \ram~72_q\,
	datac => \ram~136_q\,
	datad => \address[2]~input_o\,
	combout => \ram~179_combout\);

-- Location: LCCOMB_X20_Y14_N16
\ram~180\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~180_combout\ = (\ram~177_combout\ & (((\ram~179_combout\) # (!\address[0]~input_o\)))) # (!\ram~177_combout\ & (\ram~172_combout\ & (\address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~177_combout\,
	datab => \ram~172_combout\,
	datac => \address[0]~input_o\,
	datad => \ram~179_combout\,
	combout => \ram~180_combout\);

-- Location: IOIBUF_X33_Y14_N1
\data[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => data(4),
	o => \data[4]~input_o\);

-- Location: FF_X13_Y14_N23
\ram~33\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[4]~input_o\,
	sload => VCC,
	ena => \ram~238_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~33_q\);

-- Location: FF_X13_Y14_N17
\ram~41\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[4]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~41_q\);

-- Location: FF_X20_Y15_N25
\ram~25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[4]~input_o\,
	sload => VCC,
	ena => \ram~240_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~25_q\);

-- Location: FF_X20_Y15_N27
\ram~17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[4]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~17_q\);

-- Location: LCCOMB_X20_Y15_N26
\ram~185\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~185_combout\ = (\address[0]~input_o\ & ((\ram~25_q\) # ((\address[1]~input_o\)))) # (!\address[0]~input_o\ & (((\ram~17_q\ & !\address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~25_q\,
	datac => \ram~17_q\,
	datad => \address[1]~input_o\,
	combout => \ram~185_combout\);

-- Location: LCCOMB_X13_Y14_N16
\ram~186\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~186_combout\ = (\address[1]~input_o\ & ((\ram~185_combout\ & ((\ram~41_q\))) # (!\ram~185_combout\ & (\ram~33_q\)))) # (!\address[1]~input_o\ & (((\ram~185_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~33_q\,
	datab => \address[1]~input_o\,
	datac => \ram~41_q\,
	datad => \ram~185_combout\,
	combout => \ram~186_combout\);

-- Location: LCCOMB_X17_Y15_N28
\ram~57feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~57feeder_combout\ = \data[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[4]~input_o\,
	combout => \ram~57feeder_combout\);

-- Location: FF_X17_Y15_N29
\ram~57\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~57feeder_combout\,
	ena => \ram~230_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~57_q\);

-- Location: FF_X20_Y14_N11
\ram~73\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[4]~input_o\,
	sload => VCC,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~73_q\);

-- Location: FF_X18_Y14_N19
\ram~49\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[4]~input_o\,
	sload => VCC,
	ena => \ram~234_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~49_q\);

-- Location: FF_X18_Y14_N1
\ram~65\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[4]~input_o\,
	sload => VCC,
	ena => \ram~232_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~65_q\);

-- Location: LCCOMB_X18_Y14_N18
\ram~183\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~183_combout\ = (\address[1]~input_o\ & ((\address[0]~input_o\) # ((\ram~65_q\)))) # (!\address[1]~input_o\ & (!\address[0]~input_o\ & (\ram~49_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \ram~49_q\,
	datad => \ram~65_q\,
	combout => \ram~183_combout\);

-- Location: LCCOMB_X20_Y14_N10
\ram~184\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~184_combout\ = (\address[0]~input_o\ & ((\ram~183_combout\ & ((\ram~73_q\))) # (!\ram~183_combout\ & (\ram~57_q\)))) # (!\address[0]~input_o\ & (((\ram~183_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~57_q\,
	datac => \ram~73_q\,
	datad => \ram~183_combout\,
	combout => \ram~184_combout\);

-- Location: LCCOMB_X13_Y14_N2
\ram~187\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~187_combout\ = (\address[3]~input_o\ & (((\address[2]~input_o\)))) # (!\address[3]~input_o\ & ((\address[2]~input_o\ & ((\ram~184_combout\))) # (!\address[2]~input_o\ & (\ram~186_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~186_combout\,
	datac => \ram~184_combout\,
	datad => \address[2]~input_o\,
	combout => \ram~187_combout\);

-- Location: LCCOMB_X14_Y15_N24
\ram~89feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~89feeder_combout\ = \data[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[4]~input_o\,
	combout => \ram~89feeder_combout\);

-- Location: FF_X14_Y15_N25
\ram~89\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~89feeder_combout\,
	ena => \ram~224_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~89_q\);

-- Location: FF_X13_Y15_N3
\ram~81\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[4]~input_o\,
	sload => VCC,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~81_q\);

-- Location: LCCOMB_X13_Y15_N2
\ram~181\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~181_combout\ = (\address[0]~input_o\ & ((\ram~89_q\) # ((\address[1]~input_o\)))) # (!\address[0]~input_o\ & (((\ram~81_q\ & !\address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~89_q\,
	datac => \ram~81_q\,
	datad => \address[1]~input_o\,
	combout => \ram~181_combout\);

-- Location: FF_X14_Y15_N11
\ram~105\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[4]~input_o\,
	sload => VCC,
	ena => \ram~228_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~105_q\);

-- Location: LCCOMB_X17_Y14_N2
\ram~97feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~97feeder_combout\ = \data[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[4]~input_o\,
	combout => \ram~97feeder_combout\);

-- Location: FF_X17_Y14_N3
\ram~97\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~97feeder_combout\,
	ena => \ram~222_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~97_q\);

-- Location: LCCOMB_X14_Y15_N10
\ram~182\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~182_combout\ = (\ram~181_combout\ & (((\ram~105_q\)) # (!\address[1]~input_o\))) # (!\ram~181_combout\ & (\address[1]~input_o\ & ((\ram~97_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~181_combout\,
	datab => \address[1]~input_o\,
	datac => \ram~105_q\,
	datad => \ram~97_q\,
	combout => \ram~182_combout\);

-- Location: LCCOMB_X19_Y15_N22
\ram~121feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~121feeder_combout\ = \data[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[4]~input_o\,
	combout => \ram~121feeder_combout\);

-- Location: FF_X19_Y15_N23
\ram~121\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~121feeder_combout\,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~121_q\);

-- Location: FF_X19_Y15_N9
\ram~137\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[4]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~137_q\);

-- Location: LCCOMB_X18_Y15_N2
\ram~129feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~129feeder_combout\ = \data[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[4]~input_o\,
	combout => \ram~129feeder_combout\);

-- Location: FF_X18_Y15_N3
\ram~129\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~129feeder_combout\,
	ena => \ram~248_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~129_q\);

-- Location: FF_X18_Y15_N21
\ram~113\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[4]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~113_q\);

-- Location: LCCOMB_X18_Y15_N20
\ram~188\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~188_combout\ = (\address[0]~input_o\ & (((\address[1]~input_o\)))) # (!\address[0]~input_o\ & ((\address[1]~input_o\ & (\ram~129_q\)) # (!\address[1]~input_o\ & ((\ram~113_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~129_q\,
	datac => \ram~113_q\,
	datad => \address[1]~input_o\,
	combout => \ram~188_combout\);

-- Location: LCCOMB_X19_Y15_N8
\ram~189\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~189_combout\ = (\address[0]~input_o\ & ((\ram~188_combout\ & ((\ram~137_q\))) # (!\ram~188_combout\ & (\ram~121_q\)))) # (!\address[0]~input_o\ & (((\ram~188_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~121_q\,
	datab => \address[0]~input_o\,
	datac => \ram~137_q\,
	datad => \ram~188_combout\,
	combout => \ram~189_combout\);

-- Location: LCCOMB_X13_Y14_N20
\ram~190\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~190_combout\ = (\address[3]~input_o\ & ((\ram~187_combout\ & ((\ram~189_combout\))) # (!\ram~187_combout\ & (\ram~182_combout\)))) # (!\address[3]~input_o\ & (\ram~187_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~187_combout\,
	datac => \ram~182_combout\,
	datad => \ram~189_combout\,
	combout => \ram~190_combout\);

-- Location: IOIBUF_X33_Y10_N1
\data[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => data(5),
	o => \data[5]~input_o\);

-- Location: LCCOMB_X18_Y14_N12
\ram~66feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~66feeder_combout\ = \data[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[5]~input_o\,
	combout => \ram~66feeder_combout\);

-- Location: FF_X18_Y14_N13
\ram~66\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~66feeder_combout\,
	ena => \ram~232_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~66_q\);

-- Location: FF_X18_Y18_N27
\ram~130\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[5]~input_o\,
	sload => VCC,
	ena => \ram~248_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~130_q\);

-- Location: FF_X18_Y18_N1
\ram~34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[5]~input_o\,
	sload => VCC,
	ena => \ram~238_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~34_q\);

-- Location: LCCOMB_X17_Y14_N20
\ram~98feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~98feeder_combout\ = \data[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[5]~input_o\,
	combout => \ram~98feeder_combout\);

-- Location: FF_X17_Y14_N21
\ram~98\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~98feeder_combout\,
	ena => \ram~222_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~98_q\);

-- Location: LCCOMB_X18_Y18_N0
\ram~191\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~191_combout\ = (\address[3]~input_o\ & ((\address[2]~input_o\) # ((\ram~98_q\)))) # (!\address[3]~input_o\ & (!\address[2]~input_o\ & (\ram~34_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \address[2]~input_o\,
	datac => \ram~34_q\,
	datad => \ram~98_q\,
	combout => \ram~191_combout\);

-- Location: LCCOMB_X18_Y18_N26
\ram~192\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~192_combout\ = (\address[2]~input_o\ & ((\ram~191_combout\ & ((\ram~130_q\))) # (!\ram~191_combout\ & (\ram~66_q\)))) # (!\address[2]~input_o\ & (((\ram~191_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~66_q\,
	datab => \address[2]~input_o\,
	datac => \ram~130_q\,
	datad => \ram~191_combout\,
	combout => \ram~192_combout\);

-- Location: FF_X13_Y15_N29
\ram~82\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[5]~input_o\,
	sload => VCC,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~82_q\);

-- Location: FF_X20_Y15_N7
\ram~18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[5]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~18_q\);

-- Location: LCCOMB_X20_Y15_N6
\ram~195\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~195_combout\ = (\address[3]~input_o\ & ((\ram~82_q\) # ((\address[2]~input_o\)))) # (!\address[3]~input_o\ & (((\ram~18_q\ & !\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~82_q\,
	datab => \address[3]~input_o\,
	datac => \ram~18_q\,
	datad => \address[2]~input_o\,
	combout => \ram~195_combout\);

-- Location: LCCOMB_X18_Y14_N6
\ram~50feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~50feeder_combout\ = \data[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[5]~input_o\,
	combout => \ram~50feeder_combout\);

-- Location: FF_X18_Y14_N7
\ram~50\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~50feeder_combout\,
	ena => \ram~234_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~50_q\);

-- Location: FF_X18_Y15_N23
\ram~114\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[5]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~114_q\);

-- Location: LCCOMB_X18_Y15_N22
\ram~196\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~196_combout\ = (\ram~195_combout\ & (((\ram~114_q\) # (!\address[2]~input_o\)))) # (!\ram~195_combout\ & (\ram~50_q\ & ((\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~195_combout\,
	datab => \ram~50_q\,
	datac => \ram~114_q\,
	datad => \address[2]~input_o\,
	combout => \ram~196_combout\);

-- Location: FF_X14_Y15_N13
\ram~90\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[5]~input_o\,
	sload => VCC,
	ena => \ram~224_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~90_q\);

-- Location: FF_X19_Y15_N3
\ram~122\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[5]~input_o\,
	sload => VCC,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~122_q\);

-- Location: FF_X17_Y15_N7
\ram~58\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[5]~input_o\,
	sload => VCC,
	ena => \ram~230_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~58_q\);

-- Location: FF_X20_Y15_N5
\ram~26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[5]~input_o\,
	sload => VCC,
	ena => \ram~240_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~26_q\);

-- Location: LCCOMB_X20_Y15_N4
\ram~193\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~193_combout\ = (\address[3]~input_o\ & (((\address[2]~input_o\)))) # (!\address[3]~input_o\ & ((\address[2]~input_o\ & (\ram~58_q\)) # (!\address[2]~input_o\ & ((\ram~26_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~58_q\,
	datab => \address[3]~input_o\,
	datac => \ram~26_q\,
	datad => \address[2]~input_o\,
	combout => \ram~193_combout\);

-- Location: LCCOMB_X19_Y15_N2
\ram~194\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~194_combout\ = (\address[3]~input_o\ & ((\ram~193_combout\ & ((\ram~122_q\))) # (!\ram~193_combout\ & (\ram~90_q\)))) # (!\address[3]~input_o\ & (((\ram~193_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~90_q\,
	datab => \address[3]~input_o\,
	datac => \ram~122_q\,
	datad => \ram~193_combout\,
	combout => \ram~194_combout\);

-- Location: LCCOMB_X18_Y18_N4
\ram~197\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~197_combout\ = (\address[0]~input_o\ & (((\address[1]~input_o\) # (\ram~194_combout\)))) # (!\address[0]~input_o\ & (\ram~196_combout\ & (!\address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~196_combout\,
	datab => \address[0]~input_o\,
	datac => \address[1]~input_o\,
	datad => \ram~194_combout\,
	combout => \ram~197_combout\);

-- Location: LCCOMB_X20_Y14_N4
\ram~74feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~74feeder_combout\ = \data[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[5]~input_o\,
	combout => \ram~74feeder_combout\);

-- Location: FF_X20_Y14_N5
\ram~74\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~74feeder_combout\,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~74_q\);

-- Location: FF_X13_Y14_N7
\ram~42\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[5]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~42_q\);

-- Location: LCCOMB_X13_Y14_N6
\ram~198\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~198_combout\ = (\address[3]~input_o\ & (((\address[2]~input_o\)))) # (!\address[3]~input_o\ & ((\address[2]~input_o\ & (\ram~74_q\)) # (!\address[2]~input_o\ & ((\ram~42_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~74_q\,
	datac => \ram~42_q\,
	datad => \address[2]~input_o\,
	combout => \ram~198_combout\);

-- Location: FF_X19_Y15_N5
\ram~138\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[5]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~138_q\);

-- Location: FF_X14_Y15_N15
\ram~106\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[5]~input_o\,
	sload => VCC,
	ena => \ram~228_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~106_q\);

-- Location: LCCOMB_X19_Y15_N4
\ram~199\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~199_combout\ = (\ram~198_combout\ & (((\ram~138_q\)) # (!\address[3]~input_o\))) # (!\ram~198_combout\ & (\address[3]~input_o\ & ((\ram~106_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~198_combout\,
	datab => \address[3]~input_o\,
	datac => \ram~138_q\,
	datad => \ram~106_q\,
	combout => \ram~199_combout\);

-- Location: LCCOMB_X18_Y18_N6
\ram~200\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~200_combout\ = (\ram~197_combout\ & (((\ram~199_combout\) # (!\address[1]~input_o\)))) # (!\ram~197_combout\ & (\ram~192_combout\ & (\address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~192_combout\,
	datab => \ram~197_combout\,
	datac => \address[1]~input_o\,
	datad => \ram~199_combout\,
	combout => \ram~200_combout\);

-- Location: IOIBUF_X20_Y0_N8
\data[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => data(6),
	o => \data[6]~input_o\);

-- Location: FF_X18_Y14_N9
\ram~67\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[6]~input_o\,
	sload => VCC,
	ena => \ram~232_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~67_q\);

-- Location: LCCOMB_X17_Y15_N8
\ram~59feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~59feeder_combout\ = \data[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[6]~input_o\,
	combout => \ram~59feeder_combout\);

-- Location: FF_X17_Y15_N9
\ram~59\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~59feeder_combout\,
	ena => \ram~230_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~59_q\);

-- Location: FF_X18_Y14_N11
\ram~51\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[6]~input_o\,
	sload => VCC,
	ena => \ram~234_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~51_q\);

-- Location: LCCOMB_X18_Y14_N10
\ram~201\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~201_combout\ = (\address[0]~input_o\ & ((\ram~59_q\) # ((\address[1]~input_o\)))) # (!\address[0]~input_o\ & (((\ram~51_q\ & !\address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~59_q\,
	datab => \address[0]~input_o\,
	datac => \ram~51_q\,
	datad => \address[1]~input_o\,
	combout => \ram~201_combout\);

-- Location: FF_X20_Y14_N15
\ram~75\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[6]~input_o\,
	sload => VCC,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~75_q\);

-- Location: LCCOMB_X20_Y14_N14
\ram~202\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~202_combout\ = (\ram~201_combout\ & (((\ram~75_q\) # (!\address[1]~input_o\)))) # (!\ram~201_combout\ & (\ram~67_q\ & ((\address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~67_q\,
	datab => \ram~201_combout\,
	datac => \ram~75_q\,
	datad => \address[1]~input_o\,
	combout => \ram~202_combout\);

-- Location: FF_X18_Y15_N9
\ram~131\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[6]~input_o\,
	sload => VCC,
	ena => \ram~248_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~131_q\);

-- Location: FF_X18_Y15_N19
\ram~115\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[6]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~115_q\);

-- Location: FF_X19_Y15_N7
\ram~123\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[6]~input_o\,
	sload => VCC,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~123_q\);

-- Location: LCCOMB_X18_Y15_N18
\ram~208\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~208_combout\ = (\address[0]~input_o\ & ((\address[1]~input_o\) # ((\ram~123_q\)))) # (!\address[0]~input_o\ & (!\address[1]~input_o\ & (\ram~115_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \ram~115_q\,
	datad => \ram~123_q\,
	combout => \ram~208_combout\);

-- Location: FF_X19_Y15_N25
\ram~139\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[6]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~139_q\);

-- Location: LCCOMB_X19_Y15_N24
\ram~209\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~209_combout\ = (\ram~208_combout\ & (((\ram~139_q\) # (!\address[1]~input_o\)))) # (!\ram~208_combout\ & (\ram~131_q\ & ((\address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~131_q\,
	datab => \ram~208_combout\,
	datac => \ram~139_q\,
	datad => \address[1]~input_o\,
	combout => \ram~209_combout\);

-- Location: LCCOMB_X17_Y15_N18
\ram~27feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~27feeder_combout\ = \data[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[6]~input_o\,
	combout => \ram~27feeder_combout\);

-- Location: FF_X17_Y15_N19
\ram~27\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~27feeder_combout\,
	ena => \ram~240_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~27_q\);

-- Location: FF_X13_Y14_N9
\ram~43\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[6]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~43_q\);

-- Location: LCCOMB_X17_Y14_N0
\ram~35feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~35feeder_combout\ = \data[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[6]~input_o\,
	combout => \ram~35feeder_combout\);

-- Location: FF_X17_Y14_N1
\ram~35\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~35feeder_combout\,
	ena => \ram~238_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~35_q\);

-- Location: FF_X20_Y15_N17
\ram~19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[6]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~19_q\);

-- Location: LCCOMB_X20_Y15_N16
\ram~205\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~205_combout\ = (\address[0]~input_o\ & (((\address[1]~input_o\)))) # (!\address[0]~input_o\ & ((\address[1]~input_o\ & (\ram~35_q\)) # (!\address[1]~input_o\ & ((\ram~19_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~35_q\,
	datab => \address[0]~input_o\,
	datac => \ram~19_q\,
	datad => \address[1]~input_o\,
	combout => \ram~205_combout\);

-- Location: LCCOMB_X13_Y14_N8
\ram~206\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~206_combout\ = (\address[0]~input_o\ & ((\ram~205_combout\ & ((\ram~43_q\))) # (!\ram~205_combout\ & (\ram~27_q\)))) # (!\address[0]~input_o\ & (((\ram~205_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~27_q\,
	datac => \ram~43_q\,
	datad => \ram~205_combout\,
	combout => \ram~206_combout\);

-- Location: LCCOMB_X17_Y14_N30
\ram~99feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~99feeder_combout\ = \data[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[6]~input_o\,
	combout => \ram~99feeder_combout\);

-- Location: FF_X17_Y14_N31
\ram~99\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~99feeder_combout\,
	ena => \ram~222_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~99_q\);

-- Location: FF_X13_Y15_N31
\ram~83\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[6]~input_o\,
	sload => VCC,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~83_q\);

-- Location: LCCOMB_X13_Y15_N30
\ram~203\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~203_combout\ = (\address[0]~input_o\ & (((\address[1]~input_o\)))) # (!\address[0]~input_o\ & ((\address[1]~input_o\ & (\ram~99_q\)) # (!\address[1]~input_o\ & ((\ram~83_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~99_q\,
	datac => \ram~83_q\,
	datad => \address[1]~input_o\,
	combout => \ram~203_combout\);

-- Location: FF_X14_Y15_N3
\ram~107\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[6]~input_o\,
	sload => VCC,
	ena => \ram~228_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~107_q\);

-- Location: FF_X14_Y15_N1
\ram~91\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[6]~input_o\,
	sload => VCC,
	ena => \ram~224_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~91_q\);

-- Location: LCCOMB_X14_Y15_N2
\ram~204\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~204_combout\ = (\address[0]~input_o\ & ((\ram~203_combout\ & (\ram~107_q\)) # (!\ram~203_combout\ & ((\ram~91_q\))))) # (!\address[0]~input_o\ & (\ram~203_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~203_combout\,
	datac => \ram~107_q\,
	datad => \ram~91_q\,
	combout => \ram~204_combout\);

-- Location: LCCOMB_X13_Y14_N18
\ram~207\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~207_combout\ = (\address[3]~input_o\ & (((\ram~204_combout\) # (\address[2]~input_o\)))) # (!\address[3]~input_o\ & (\ram~206_combout\ & ((!\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~206_combout\,
	datac => \ram~204_combout\,
	datad => \address[2]~input_o\,
	combout => \ram~207_combout\);

-- Location: LCCOMB_X19_Y15_N10
\ram~210\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~210_combout\ = (\ram~207_combout\ & (((\ram~209_combout\) # (!\address[2]~input_o\)))) # (!\ram~207_combout\ & (\ram~202_combout\ & ((\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~202_combout\,
	datab => \ram~209_combout\,
	datac => \ram~207_combout\,
	datad => \address[2]~input_o\,
	combout => \ram~210_combout\);

-- Location: IOIBUF_X33_Y15_N1
\data[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => data(7),
	o => \data[7]~input_o\);

-- Location: FF_X20_Y15_N21
\ram~20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[7]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~20_q\);

-- Location: LCCOMB_X18_Y14_N30
\ram~52feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~52feeder_combout\ = \data[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[7]~input_o\,
	combout => \ram~52feeder_combout\);

-- Location: FF_X18_Y14_N31
\ram~52\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~52feeder_combout\,
	ena => \ram~234_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~52_q\);

-- Location: LCCOMB_X20_Y15_N20
\ram~215\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~215_combout\ = (\address[2]~input_o\ & ((\address[3]~input_o\) # ((\ram~52_q\)))) # (!\address[2]~input_o\ & (!\address[3]~input_o\ & (\ram~20_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[2]~input_o\,
	datab => \address[3]~input_o\,
	datac => \ram~20_q\,
	datad => \ram~52_q\,
	combout => \ram~215_combout\);

-- Location: FF_X13_Y15_N25
\ram~84\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[7]~input_o\,
	sload => VCC,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~84_q\);

-- Location: FF_X18_Y15_N7
\ram~116\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[7]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~116_q\);

-- Location: LCCOMB_X18_Y15_N6
\ram~216\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~216_combout\ = (\ram~215_combout\ & (((\ram~116_q\) # (!\address[3]~input_o\)))) # (!\ram~215_combout\ & (\ram~84_q\ & ((\address[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~215_combout\,
	datab => \ram~84_q\,
	datac => \ram~116_q\,
	datad => \address[3]~input_o\,
	combout => \ram~216_combout\);

-- Location: LCCOMB_X18_Y14_N28
\ram~68feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~68feeder_combout\ = \data[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[7]~input_o\,
	combout => \ram~68feeder_combout\);

-- Location: FF_X18_Y14_N29
\ram~68\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~68feeder_combout\,
	ena => \ram~232_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~68_q\);

-- Location: FF_X17_Y14_N29
\ram~36\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[7]~input_o\,
	sload => VCC,
	ena => \ram~238_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~36_q\);

-- Location: LCCOMB_X17_Y14_N28
\ram~213\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~213_combout\ = (\address[3]~input_o\ & (((\address[2]~input_o\)))) # (!\address[3]~input_o\ & ((\address[2]~input_o\ & (\ram~68_q\)) # (!\address[2]~input_o\ & ((\ram~36_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~68_q\,
	datac => \ram~36_q\,
	datad => \address[2]~input_o\,
	combout => \ram~213_combout\);

-- Location: FF_X18_Y15_N5
\ram~132\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[7]~input_o\,
	sload => VCC,
	ena => \ram~248_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~132_q\);

-- Location: FF_X17_Y14_N11
\ram~100\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[7]~input_o\,
	sload => VCC,
	ena => \ram~222_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~100_q\);

-- Location: LCCOMB_X18_Y15_N4
\ram~214\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~214_combout\ = (\address[3]~input_o\ & ((\ram~213_combout\ & (\ram~132_q\)) # (!\ram~213_combout\ & ((\ram~100_q\))))) # (!\address[3]~input_o\ & (\ram~213_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~213_combout\,
	datac => \ram~132_q\,
	datad => \ram~100_q\,
	combout => \ram~214_combout\);

-- Location: LCCOMB_X18_Y15_N0
\ram~217\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~217_combout\ = (\address[1]~input_o\ & (((\ram~214_combout\) # (\address[0]~input_o\)))) # (!\address[1]~input_o\ & (\ram~216_combout\ & ((!\address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~216_combout\,
	datab => \address[1]~input_o\,
	datac => \ram~214_combout\,
	datad => \address[0]~input_o\,
	combout => \ram~217_combout\);

-- Location: LCCOMB_X14_Y15_N6
\ram~108feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~108feeder_combout\ = \data[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[7]~input_o\,
	combout => \ram~108feeder_combout\);

-- Location: FF_X14_Y15_N7
\ram~108\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~108feeder_combout\,
	ena => \ram~228_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~108_q\);

-- Location: FF_X13_Y14_N13
\ram~44\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[7]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~44_q\);

-- Location: LCCOMB_X13_Y14_N12
\ram~218\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~218_combout\ = (\address[3]~input_o\ & ((\ram~108_q\) # ((\address[2]~input_o\)))) # (!\address[3]~input_o\ & (((\ram~44_q\ & !\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~108_q\,
	datac => \ram~44_q\,
	datad => \address[2]~input_o\,
	combout => \ram~218_combout\);

-- Location: LCCOMB_X20_Y14_N8
\ram~76feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~76feeder_combout\ = \data[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[7]~input_o\,
	combout => \ram~76feeder_combout\);

-- Location: FF_X20_Y14_N9
\ram~76\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~76feeder_combout\,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~76_q\);

-- Location: FF_X20_Y14_N3
\ram~140\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[7]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~140_q\);

-- Location: LCCOMB_X20_Y14_N2
\ram~219\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~219_combout\ = (\ram~218_combout\ & (((\ram~140_q\) # (!\address[2]~input_o\)))) # (!\ram~218_combout\ & (\ram~76_q\ & ((\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~218_combout\,
	datab => \ram~76_q\,
	datac => \ram~140_q\,
	datad => \address[2]~input_o\,
	combout => \ram~219_combout\);

-- Location: LCCOMB_X14_Y15_N4
\ram~92feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~92feeder_combout\ = \data[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data[7]~input_o\,
	combout => \ram~92feeder_combout\);

-- Location: FF_X14_Y15_N5
\ram~92\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~92feeder_combout\,
	ena => \ram~224_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~92_q\);

-- Location: FF_X20_Y15_N3
\ram~28\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[7]~input_o\,
	sload => VCC,
	ena => \ram~240_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~28_q\);

-- Location: LCCOMB_X20_Y15_N2
\ram~211\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~211_combout\ = (\address[3]~input_o\ & ((\ram~92_q\) # ((\address[2]~input_o\)))) # (!\address[3]~input_o\ & (((\ram~28_q\ & !\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~92_q\,
	datab => \address[3]~input_o\,
	datac => \ram~28_q\,
	datad => \address[2]~input_o\,
	combout => \ram~211_combout\);

-- Location: FF_X17_Y15_N5
\ram~60\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[7]~input_o\,
	sload => VCC,
	ena => \ram~230_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~60_q\);

-- Location: FF_X19_Y15_N13
\ram~124\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data[7]~input_o\,
	sload => VCC,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~124_q\);

-- Location: LCCOMB_X19_Y15_N12
\ram~212\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~212_combout\ = (\ram~211_combout\ & (((\ram~124_q\) # (!\address[2]~input_o\)))) # (!\ram~211_combout\ & (\ram~60_q\ & ((\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~211_combout\,
	datab => \ram~60_q\,
	datac => \ram~124_q\,
	datad => \address[2]~input_o\,
	combout => \ram~212_combout\);

-- Location: LCCOMB_X19_Y15_N30
\ram~220\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~220_combout\ = (\ram~217_combout\ & ((\ram~219_combout\) # ((!\address[0]~input_o\)))) # (!\ram~217_combout\ & (((\address[0]~input_o\ & \ram~212_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~217_combout\,
	datab => \ram~219_combout\,
	datac => \address[0]~input_o\,
	datad => \ram~212_combout\,
	combout => \ram~220_combout\);

data(0) <= \data[0]~output_o\;

data(1) <= \data[1]~output_o\;

data(2) <= \data[2]~output_o\;

data(3) <= \data[3]~output_o\;

data(4) <= \data[4]~output_o\;

data(5) <= \data[5]~output_o\;

data(6) <= \data[6]~output_o\;

data(7) <= \data[7]~output_o\;
END structure;


