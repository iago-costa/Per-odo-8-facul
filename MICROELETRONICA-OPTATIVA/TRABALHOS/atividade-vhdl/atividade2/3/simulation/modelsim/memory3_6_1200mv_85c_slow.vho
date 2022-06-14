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

-- DATE "06/13/2022 19:08:49"

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

ENTITY 	memory3 IS
    PORT (
	clk : IN std_logic;
	write : IN std_logic;
	address : IN STD.STANDARD.integer range 0 TO 15;
	data_in : IN std_logic_vector(7 DOWNTO 0);
	data_out : OUT std_logic_vector(7 DOWNTO 0)
	);
END memory3;

-- Design Ports Information
-- data_out[0]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[1]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[2]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[3]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[4]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[5]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[6]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[7]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[1]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[0]	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[3]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[2]	=>  Location: PIN_K11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[0]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[1]	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[2]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[3]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[4]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[5]	=>  Location: PIN_L12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[6]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[7]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF memory3 IS
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
SIGNAL ww_data_in : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_data_out : std_logic_vector(7 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data_out[0]~output_o\ : std_logic;
SIGNAL \data_out[1]~output_o\ : std_logic;
SIGNAL \data_out[2]~output_o\ : std_logic;
SIGNAL \data_out[3]~output_o\ : std_logic;
SIGNAL \data_out[4]~output_o\ : std_logic;
SIGNAL \data_out[5]~output_o\ : std_logic;
SIGNAL \data_out[6]~output_o\ : std_logic;
SIGNAL \data_out[7]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \data_in[0]~input_o\ : std_logic;
SIGNAL \ram~93feeder_combout\ : std_logic;
SIGNAL \address[0]~input_o\ : std_logic;
SIGNAL \address[1]~input_o\ : std_logic;
SIGNAL \address[2]~input_o\ : std_logic;
SIGNAL \address[3]~input_o\ : std_logic;
SIGNAL \ram~221_combout\ : std_logic;
SIGNAL \write~input_o\ : std_logic;
SIGNAL \ram~222_combout\ : std_logic;
SIGNAL \ram~93_q\ : std_logic;
SIGNAL \ram~227_combout\ : std_logic;
SIGNAL \ram~228_combout\ : std_logic;
SIGNAL \ram~101_q\ : std_logic;
SIGNAL \ram~223_combout\ : std_logic;
SIGNAL \ram~224_combout\ : std_logic;
SIGNAL \ram~85_q\ : std_logic;
SIGNAL \ram~225_combout\ : std_logic;
SIGNAL \ram~226_combout\ : std_logic;
SIGNAL \ram~77_q\ : std_logic;
SIGNAL \ram~141_combout\ : std_logic;
SIGNAL \ram~142_combout\ : std_logic;
SIGNAL \ram~247_combout\ : std_logic;
SIGNAL \ram~248_combout\ : std_logic;
SIGNAL \ram~125_q\ : std_logic;
SIGNAL \ram~249_combout\ : std_logic;
SIGNAL \ram~250_combout\ : std_logic;
SIGNAL \ram~109_q\ : std_logic;
SIGNAL \ram~148_combout\ : std_logic;
SIGNAL \ram~245_combout\ : std_logic;
SIGNAL \ram~246_combout\ : std_logic;
SIGNAL \ram~117_q\ : std_logic;
SIGNAL \ram~251_combout\ : std_logic;
SIGNAL \ram~252_combout\ : std_logic;
SIGNAL \ram~133_q\ : std_logic;
SIGNAL \ram~149_combout\ : std_logic;
SIGNAL \ram~233_combout\ : std_logic;
SIGNAL \ram~234_combout\ : std_logic;
SIGNAL \ram~45_q\ : std_logic;
SIGNAL \ram~61feeder_combout\ : std_logic;
SIGNAL \ram~231_combout\ : std_logic;
SIGNAL \ram~232_combout\ : std_logic;
SIGNAL \ram~61_q\ : std_logic;
SIGNAL \ram~143_combout\ : std_logic;
SIGNAL \ram~53feeder_combout\ : std_logic;
SIGNAL \ram~229_combout\ : std_logic;
SIGNAL \ram~230_combout\ : std_logic;
SIGNAL \ram~53_q\ : std_logic;
SIGNAL \ram~235_combout\ : std_logic;
SIGNAL \ram~236_combout\ : std_logic;
SIGNAL \ram~69_q\ : std_logic;
SIGNAL \ram~144_combout\ : std_logic;
SIGNAL \ram~21feeder_combout\ : std_logic;
SIGNAL \ram~239_combout\ : std_logic;
SIGNAL \ram~240_combout\ : std_logic;
SIGNAL \ram~21_q\ : std_logic;
SIGNAL \ram~241_combout\ : std_logic;
SIGNAL \ram~242_combout\ : std_logic;
SIGNAL \ram~13_q\ : std_logic;
SIGNAL \ram~145_combout\ : std_logic;
SIGNAL \ram~243_combout\ : std_logic;
SIGNAL \ram~244_combout\ : std_logic;
SIGNAL \ram~37_q\ : std_logic;
SIGNAL \ram~237_combout\ : std_logic;
SIGNAL \ram~238_combout\ : std_logic;
SIGNAL \ram~29_q\ : std_logic;
SIGNAL \ram~146_combout\ : std_logic;
SIGNAL \ram~147_combout\ : std_logic;
SIGNAL \ram~150_combout\ : std_logic;
SIGNAL \data_in[1]~input_o\ : std_logic;
SIGNAL \ram~62feeder_combout\ : std_logic;
SIGNAL \ram~62_q\ : std_logic;
SIGNAL \ram~94_q\ : std_logic;
SIGNAL \ram~30_q\ : std_logic;
SIGNAL \ram~151_combout\ : std_logic;
SIGNAL \ram~126_q\ : std_logic;
SIGNAL \ram~152_combout\ : std_logic;
SIGNAL \ram~14_q\ : std_logic;
SIGNAL \ram~78_q\ : std_logic;
SIGNAL \ram~155_combout\ : std_logic;
SIGNAL \ram~110_q\ : std_logic;
SIGNAL \ram~46feeder_combout\ : std_logic;
SIGNAL \ram~46_q\ : std_logic;
SIGNAL \ram~156_combout\ : std_logic;
SIGNAL \ram~86feeder_combout\ : std_logic;
SIGNAL \ram~86_q\ : std_logic;
SIGNAL \ram~118_q\ : std_logic;
SIGNAL \ram~54_q\ : std_logic;
SIGNAL \ram~22_q\ : std_logic;
SIGNAL \ram~153_combout\ : std_logic;
SIGNAL \ram~154_combout\ : std_logic;
SIGNAL \ram~157_combout\ : std_logic;
SIGNAL \ram~102_q\ : std_logic;
SIGNAL \ram~134_q\ : std_logic;
SIGNAL \ram~70_q\ : std_logic;
SIGNAL \ram~38_q\ : std_logic;
SIGNAL \ram~158_combout\ : std_logic;
SIGNAL \ram~159_combout\ : std_logic;
SIGNAL \ram~160_combout\ : std_logic;
SIGNAL \data_in[2]~input_o\ : std_logic;
SIGNAL \ram~87_q\ : std_logic;
SIGNAL \ram~103_q\ : std_logic;
SIGNAL \ram~95_q\ : std_logic;
SIGNAL \ram~79_q\ : std_logic;
SIGNAL \ram~163_combout\ : std_logic;
SIGNAL \ram~164_combout\ : std_logic;
SIGNAL \ram~23feeder_combout\ : std_logic;
SIGNAL \ram~23_q\ : std_logic;
SIGNAL \ram~31feeder_combout\ : std_logic;
SIGNAL \ram~31_q\ : std_logic;
SIGNAL \ram~15_q\ : std_logic;
SIGNAL \ram~165_combout\ : std_logic;
SIGNAL \ram~39_q\ : std_logic;
SIGNAL \ram~166_combout\ : std_logic;
SIGNAL \ram~167_combout\ : std_logic;
SIGNAL \ram~127feeder_combout\ : std_logic;
SIGNAL \ram~127_q\ : std_logic;
SIGNAL \ram~135_q\ : std_logic;
SIGNAL \ram~119_q\ : std_logic;
SIGNAL \ram~111_q\ : std_logic;
SIGNAL \ram~168_combout\ : std_logic;
SIGNAL \ram~169_combout\ : std_logic;
SIGNAL \ram~47_q\ : std_logic;
SIGNAL \ram~55feeder_combout\ : std_logic;
SIGNAL \ram~55_q\ : std_logic;
SIGNAL \ram~161_combout\ : std_logic;
SIGNAL \ram~71_q\ : std_logic;
SIGNAL \ram~63_q\ : std_logic;
SIGNAL \ram~162_combout\ : std_logic;
SIGNAL \ram~170_combout\ : std_logic;
SIGNAL \data_in[3]~input_o\ : std_logic;
SIGNAL \ram~40_q\ : std_logic;
SIGNAL \ram~104_q\ : std_logic;
SIGNAL \ram~178_combout\ : std_logic;
SIGNAL \ram~72_q\ : std_logic;
SIGNAL \ram~136_q\ : std_logic;
SIGNAL \ram~179_combout\ : std_logic;
SIGNAL \ram~80_q\ : std_logic;
SIGNAL \ram~16_q\ : std_logic;
SIGNAL \ram~48feeder_combout\ : std_logic;
SIGNAL \ram~48_q\ : std_logic;
SIGNAL \ram~175_combout\ : std_logic;
SIGNAL \ram~112_q\ : std_logic;
SIGNAL \ram~176_combout\ : std_logic;
SIGNAL \ram~96_q\ : std_logic;
SIGNAL \ram~64feeder_combout\ : std_logic;
SIGNAL \ram~64_q\ : std_logic;
SIGNAL \ram~32_q\ : std_logic;
SIGNAL \ram~173_combout\ : std_logic;
SIGNAL \ram~128_q\ : std_logic;
SIGNAL \ram~174_combout\ : std_logic;
SIGNAL \ram~177_combout\ : std_logic;
SIGNAL \ram~24_q\ : std_logic;
SIGNAL \ram~88feeder_combout\ : std_logic;
SIGNAL \ram~88_q\ : std_logic;
SIGNAL \ram~171_combout\ : std_logic;
SIGNAL \ram~120_q\ : std_logic;
SIGNAL \ram~56_q\ : std_logic;
SIGNAL \ram~172_combout\ : std_logic;
SIGNAL \ram~180_combout\ : std_logic;
SIGNAL \data_in[4]~input_o\ : std_logic;
SIGNAL \ram~57feeder_combout\ : std_logic;
SIGNAL \ram~57_q\ : std_logic;
SIGNAL \ram~49_q\ : std_logic;
SIGNAL \ram~65_q\ : std_logic;
SIGNAL \ram~183_combout\ : std_logic;
SIGNAL \ram~73_q\ : std_logic;
SIGNAL \ram~184_combout\ : std_logic;
SIGNAL \ram~17_q\ : std_logic;
SIGNAL \ram~25feeder_combout\ : std_logic;
SIGNAL \ram~25_q\ : std_logic;
SIGNAL \ram~185_combout\ : std_logic;
SIGNAL \ram~41_q\ : std_logic;
SIGNAL \ram~33_q\ : std_logic;
SIGNAL \ram~186_combout\ : std_logic;
SIGNAL \ram~187_combout\ : std_logic;
SIGNAL \ram~113_q\ : std_logic;
SIGNAL \ram~129feeder_combout\ : std_logic;
SIGNAL \ram~129_q\ : std_logic;
SIGNAL \ram~188_combout\ : std_logic;
SIGNAL \ram~137_q\ : std_logic;
SIGNAL \ram~121_q\ : std_logic;
SIGNAL \ram~189_combout\ : std_logic;
SIGNAL \ram~97_q\ : std_logic;
SIGNAL \ram~105_q\ : std_logic;
SIGNAL \ram~81_q\ : std_logic;
SIGNAL \ram~89feeder_combout\ : std_logic;
SIGNAL \ram~89_q\ : std_logic;
SIGNAL \ram~181_combout\ : std_logic;
SIGNAL \ram~182_combout\ : std_logic;
SIGNAL \ram~190_combout\ : std_logic;
SIGNAL \data_in[5]~input_o\ : std_logic;
SIGNAL \ram~42_q\ : std_logic;
SIGNAL \ram~74_q\ : std_logic;
SIGNAL \ram~198_combout\ : std_logic;
SIGNAL \ram~138_q\ : std_logic;
SIGNAL \ram~106_q\ : std_logic;
SIGNAL \ram~199_combout\ : std_logic;
SIGNAL \ram~98_q\ : std_logic;
SIGNAL \ram~34_q\ : std_logic;
SIGNAL \ram~191_combout\ : std_logic;
SIGNAL \ram~66_q\ : std_logic;
SIGNAL \ram~130_q\ : std_logic;
SIGNAL \ram~192_combout\ : std_logic;
SIGNAL \ram~26_q\ : std_logic;
SIGNAL \ram~58_q\ : std_logic;
SIGNAL \ram~193_combout\ : std_logic;
SIGNAL \ram~90_q\ : std_logic;
SIGNAL \ram~122_q\ : std_logic;
SIGNAL \ram~194_combout\ : std_logic;
SIGNAL \ram~82_q\ : std_logic;
SIGNAL \ram~18_q\ : std_logic;
SIGNAL \ram~195_combout\ : std_logic;
SIGNAL \ram~114_q\ : std_logic;
SIGNAL \ram~50_q\ : std_logic;
SIGNAL \ram~196_combout\ : std_logic;
SIGNAL \ram~197_combout\ : std_logic;
SIGNAL \ram~200_combout\ : std_logic;
SIGNAL \data_in[6]~input_o\ : std_logic;
SIGNAL \ram~131_q\ : std_logic;
SIGNAL \ram~139_q\ : std_logic;
SIGNAL \ram~123feeder_combout\ : std_logic;
SIGNAL \ram~123_q\ : std_logic;
SIGNAL \ram~115_q\ : std_logic;
SIGNAL \ram~208_combout\ : std_logic;
SIGNAL \ram~209_combout\ : std_logic;
SIGNAL \ram~91_q\ : std_logic;
SIGNAL \ram~107_q\ : std_logic;
SIGNAL \ram~99_q\ : std_logic;
SIGNAL \ram~83_q\ : std_logic;
SIGNAL \ram~203_combout\ : std_logic;
SIGNAL \ram~204_combout\ : std_logic;
SIGNAL \ram~27feeder_combout\ : std_logic;
SIGNAL \ram~27_q\ : std_logic;
SIGNAL \ram~19_q\ : std_logic;
SIGNAL \ram~35_q\ : std_logic;
SIGNAL \ram~205_combout\ : std_logic;
SIGNAL \ram~43_q\ : std_logic;
SIGNAL \ram~206_combout\ : std_logic;
SIGNAL \ram~207_combout\ : std_logic;
SIGNAL \ram~67_q\ : std_logic;
SIGNAL \ram~75_q\ : std_logic;
SIGNAL \ram~51_q\ : std_logic;
SIGNAL \ram~59feeder_combout\ : std_logic;
SIGNAL \ram~59_q\ : std_logic;
SIGNAL \ram~201_combout\ : std_logic;
SIGNAL \ram~202_combout\ : std_logic;
SIGNAL \ram~210_combout\ : std_logic;
SIGNAL \data_in[7]~input_o\ : std_logic;
SIGNAL \ram~76_q\ : std_logic;
SIGNAL \ram~108feeder_combout\ : std_logic;
SIGNAL \ram~108_q\ : std_logic;
SIGNAL \ram~44_q\ : std_logic;
SIGNAL \ram~218_combout\ : std_logic;
SIGNAL \ram~140_q\ : std_logic;
SIGNAL \ram~219_combout\ : std_logic;
SIGNAL \ram~68_q\ : std_logic;
SIGNAL \ram~36_q\ : std_logic;
SIGNAL \ram~213_combout\ : std_logic;
SIGNAL \ram~100feeder_combout\ : std_logic;
SIGNAL \ram~100_q\ : std_logic;
SIGNAL \ram~132_q\ : std_logic;
SIGNAL \ram~214_combout\ : std_logic;
SIGNAL \ram~84feeder_combout\ : std_logic;
SIGNAL \ram~84_q\ : std_logic;
SIGNAL \ram~20_q\ : std_logic;
SIGNAL \ram~52_q\ : std_logic;
SIGNAL \ram~215_combout\ : std_logic;
SIGNAL \ram~116_q\ : std_logic;
SIGNAL \ram~216_combout\ : std_logic;
SIGNAL \ram~217_combout\ : std_logic;
SIGNAL \ram~60_q\ : std_logic;
SIGNAL \ram~124_q\ : std_logic;
SIGNAL \ram~92feeder_combout\ : std_logic;
SIGNAL \ram~92_q\ : std_logic;
SIGNAL \ram~28_q\ : std_logic;
SIGNAL \ram~211_combout\ : std_logic;
SIGNAL \ram~212_combout\ : std_logic;
SIGNAL \ram~220_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_write <= write;
ww_address <= IEEE.STD_LOGIC_ARITH.CONV_STD_LOGIC_VECTOR(address, 4);
ww_data_in <= data_in;
data_out <= ww_data_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: IOOBUF_X22_Y0_N2
\data_out[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~150_combout\,
	devoe => ww_devoe,
	o => \data_out[0]~output_o\);

-- Location: IOOBUF_X33_Y24_N9
\data_out[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~160_combout\,
	devoe => ww_devoe,
	o => \data_out[1]~output_o\);

-- Location: IOOBUF_X20_Y31_N2
\data_out[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~170_combout\,
	devoe => ww_devoe,
	o => \data_out[2]~output_o\);

-- Location: IOOBUF_X26_Y31_N2
\data_out[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~180_combout\,
	devoe => ww_devoe,
	o => \data_out[3]~output_o\);

-- Location: IOOBUF_X24_Y0_N2
\data_out[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~190_combout\,
	devoe => ww_devoe,
	o => \data_out[4]~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\data_out[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~200_combout\,
	devoe => ww_devoe,
	o => \data_out[5]~output_o\);

-- Location: IOOBUF_X33_Y28_N9
\data_out[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~210_combout\,
	devoe => ww_devoe,
	o => \data_out[6]~output_o\);

-- Location: IOOBUF_X33_Y22_N2
\data_out[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram~220_combout\,
	devoe => ww_devoe,
	o => \data_out[7]~output_o\);

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

-- Location: IOIBUF_X33_Y24_N1
\data_in[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(0),
	o => \data_in[0]~input_o\);

-- Location: LCCOMB_X20_Y16_N8
\ram~93feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~93feeder_combout\ = \data_in[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[0]~input_o\,
	combout => \ram~93feeder_combout\);

-- Location: IOIBUF_X16_Y0_N1
\address[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(0),
	o => \address[0]~input_o\);

-- Location: IOIBUF_X16_Y0_N8
\address[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(1),
	o => \address[1]~input_o\);

-- Location: IOIBUF_X33_Y11_N1
\address[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(2),
	o => \address[2]~input_o\);

-- Location: IOIBUF_X22_Y31_N8
\address[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(3),
	o => \address[3]~input_o\);

-- Location: LCCOMB_X20_Y16_N24
\ram~221\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~221_combout\ = (!\address[0]~input_o\ & (\address[1]~input_o\ & (!\address[2]~input_o\ & \address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[2]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~221_combout\);

-- Location: IOIBUF_X26_Y31_N8
\write~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write,
	o => \write~input_o\);

-- Location: LCCOMB_X20_Y16_N18
\ram~222\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~222_combout\ = (\ram~221_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ram~221_combout\,
	datad => \write~input_o\,
	combout => \ram~222_combout\);

-- Location: FF_X20_Y16_N9
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

-- Location: LCCOMB_X20_Y16_N20
\ram~227\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~227_combout\ = (\address[0]~input_o\ & (\address[1]~input_o\ & (!\address[2]~input_o\ & \address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[2]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~227_combout\);

-- Location: LCCOMB_X20_Y16_N14
\ram~228\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~228_combout\ = (\ram~227_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ram~227_combout\,
	datad => \write~input_o\,
	combout => \ram~228_combout\);

-- Location: FF_X20_Y16_N27
\ram~101\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	sload => VCC,
	ena => \ram~228_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~101_q\);

-- Location: LCCOMB_X22_Y19_N0
\ram~223\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~223_combout\ = (\address[0]~input_o\ & (!\address[1]~input_o\ & (!\address[2]~input_o\ & \address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[2]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~223_combout\);

-- Location: LCCOMB_X22_Y19_N18
\ram~224\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~224_combout\ = (\write~input_o\ & \ram~223_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write~input_o\,
	datad => \ram~223_combout\,
	combout => \ram~224_combout\);

-- Location: FF_X20_Y19_N17
\ram~85\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	sload => VCC,
	ena => \ram~224_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~85_q\);

-- Location: LCCOMB_X22_Y19_N20
\ram~225\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~225_combout\ = (!\address[0]~input_o\ & (!\address[1]~input_o\ & (!\address[2]~input_o\ & \address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[2]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~225_combout\);

-- Location: LCCOMB_X22_Y19_N6
\ram~226\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~226_combout\ = (\write~input_o\ & \ram~225_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write~input_o\,
	datad => \ram~225_combout\,
	combout => \ram~226_combout\);

-- Location: FF_X20_Y19_N27
\ram~77\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	sload => VCC,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~77_q\);

-- Location: LCCOMB_X20_Y19_N26
\ram~141\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~141_combout\ = (\address[1]~input_o\ & (((\address[0]~input_o\)))) # (!\address[1]~input_o\ & ((\address[0]~input_o\ & (\ram~85_q\)) # (!\address[0]~input_o\ & ((\ram~77_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~85_q\,
	datab => \address[1]~input_o\,
	datac => \ram~77_q\,
	datad => \address[0]~input_o\,
	combout => \ram~141_combout\);

-- Location: LCCOMB_X20_Y16_N26
\ram~142\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~142_combout\ = (\address[1]~input_o\ & ((\ram~141_combout\ & ((\ram~101_q\))) # (!\ram~141_combout\ & (\ram~93_q\)))) # (!\address[1]~input_o\ & (((\ram~141_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~93_q\,
	datab => \address[1]~input_o\,
	datac => \ram~101_q\,
	datad => \ram~141_combout\,
	combout => \ram~142_combout\);

-- Location: LCCOMB_X21_Y16_N18
\ram~247\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~247_combout\ = (\address[2]~input_o\ & (!\address[0]~input_o\ & (\address[1]~input_o\ & \address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[2]~input_o\,
	datab => \address[0]~input_o\,
	datac => \address[1]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~247_combout\);

-- Location: LCCOMB_X21_Y16_N12
\ram~248\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~248_combout\ = (\ram~247_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ram~247_combout\,
	datad => \write~input_o\,
	combout => \ram~248_combout\);

-- Location: FF_X19_Y18_N3
\ram~125\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	sload => VCC,
	ena => \ram~248_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~125_q\);

-- Location: LCCOMB_X21_Y16_N22
\ram~249\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~249_combout\ = (\address[2]~input_o\ & (!\address[0]~input_o\ & (!\address[1]~input_o\ & \address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[2]~input_o\,
	datab => \address[0]~input_o\,
	datac => \address[1]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~249_combout\);

-- Location: LCCOMB_X21_Y16_N16
\ram~250\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~250_combout\ = (\ram~249_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ram~249_combout\,
	datad => \write~input_o\,
	combout => \ram~250_combout\);

-- Location: FF_X20_Y18_N19
\ram~109\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~109_q\);

-- Location: LCCOMB_X20_Y18_N18
\ram~148\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~148_combout\ = (\address[0]~input_o\ & (((\address[1]~input_o\)))) # (!\address[0]~input_o\ & ((\address[1]~input_o\ & (\ram~125_q\)) # (!\address[1]~input_o\ & ((\ram~109_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~125_q\,
	datab => \address[0]~input_o\,
	datac => \ram~109_q\,
	datad => \address[1]~input_o\,
	combout => \ram~148_combout\);

-- Location: LCCOMB_X22_Y19_N12
\ram~245\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~245_combout\ = (\address[0]~input_o\ & (!\address[1]~input_o\ & (\address[2]~input_o\ & \address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[2]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~245_combout\);

-- Location: LCCOMB_X22_Y19_N22
\ram~246\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~246_combout\ = (\write~input_o\ & \ram~245_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write~input_o\,
	datad => \ram~245_combout\,
	combout => \ram~246_combout\);

-- Location: FF_X19_Y17_N17
\ram~117\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	sload => VCC,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~117_q\);

-- Location: LCCOMB_X21_Y16_N26
\ram~251\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~251_combout\ = (\address[2]~input_o\ & (\address[0]~input_o\ & (\address[1]~input_o\ & \address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[2]~input_o\,
	datab => \address[0]~input_o\,
	datac => \address[1]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~251_combout\);

-- Location: LCCOMB_X21_Y16_N20
\ram~252\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~252_combout\ = (\ram~251_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ram~251_combout\,
	datad => \write~input_o\,
	combout => \ram~252_combout\);

-- Location: FF_X19_Y17_N11
\ram~133\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~133_q\);

-- Location: LCCOMB_X19_Y17_N10
\ram~149\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~149_combout\ = (\ram~148_combout\ & (((\ram~133_q\) # (!\address[0]~input_o\)))) # (!\ram~148_combout\ & (\ram~117_q\ & ((\address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~148_combout\,
	datab => \ram~117_q\,
	datac => \ram~133_q\,
	datad => \address[0]~input_o\,
	combout => \ram~149_combout\);

-- Location: LCCOMB_X21_Y16_N6
\ram~233\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~233_combout\ = (\address[2]~input_o\ & (!\address[0]~input_o\ & (!\address[1]~input_o\ & !\address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[2]~input_o\,
	datab => \address[0]~input_o\,
	datac => \address[1]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~233_combout\);

-- Location: LCCOMB_X21_Y16_N24
\ram~234\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~234_combout\ = (\ram~233_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~233_combout\,
	datad => \write~input_o\,
	combout => \ram~234_combout\);

-- Location: FF_X21_Y18_N19
\ram~45\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	sload => VCC,
	ena => \ram~234_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~45_q\);

-- Location: LCCOMB_X21_Y18_N0
\ram~61feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~61feeder_combout\ = \data_in[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[0]~input_o\,
	combout => \ram~61feeder_combout\);

-- Location: LCCOMB_X20_Y16_N28
\ram~231\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~231_combout\ = (!\address[0]~input_o\ & (\address[1]~input_o\ & (\address[2]~input_o\ & !\address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[2]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~231_combout\);

-- Location: LCCOMB_X20_Y16_N30
\ram~232\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~232_combout\ = (\ram~231_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ram~231_combout\,
	datad => \write~input_o\,
	combout => \ram~232_combout\);

-- Location: FF_X21_Y18_N1
\ram~61\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~61feeder_combout\,
	ena => \ram~232_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~61_q\);

-- Location: LCCOMB_X21_Y18_N18
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

-- Location: LCCOMB_X22_Y16_N0
\ram~53feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~53feeder_combout\ = \data_in[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[0]~input_o\,
	combout => \ram~53feeder_combout\);

-- Location: LCCOMB_X20_Y16_N16
\ram~229\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~229_combout\ = (\address[0]~input_o\ & (!\address[1]~input_o\ & (\address[2]~input_o\ & !\address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[2]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~229_combout\);

-- Location: LCCOMB_X20_Y16_N2
\ram~230\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~230_combout\ = (\ram~229_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ram~229_combout\,
	datad => \write~input_o\,
	combout => \ram~230_combout\);

-- Location: FF_X22_Y16_N1
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

-- Location: LCCOMB_X20_Y16_N0
\ram~235\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~235_combout\ = (\address[0]~input_o\ & (\address[1]~input_o\ & (\address[2]~input_o\ & !\address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[2]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~235_combout\);

-- Location: LCCOMB_X20_Y16_N10
\ram~236\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~236_combout\ = (\ram~235_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ram~235_combout\,
	datad => \write~input_o\,
	combout => \ram~236_combout\);

-- Location: FF_X20_Y17_N17
\ram~69\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	sload => VCC,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~69_q\);

-- Location: LCCOMB_X20_Y17_N16
\ram~144\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~144_combout\ = (\ram~143_combout\ & (((\ram~69_q\) # (!\address[0]~input_o\)))) # (!\ram~143_combout\ & (\ram~53_q\ & ((\address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~143_combout\,
	datab => \ram~53_q\,
	datac => \ram~69_q\,
	datad => \address[0]~input_o\,
	combout => \ram~144_combout\);

-- Location: LCCOMB_X22_Y16_N2
\ram~21feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~21feeder_combout\ = \data_in[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[0]~input_o\,
	combout => \ram~21feeder_combout\);

-- Location: LCCOMB_X20_Y16_N12
\ram~239\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~239_combout\ = (\address[0]~input_o\ & (!\address[1]~input_o\ & (!\address[2]~input_o\ & !\address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[2]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~239_combout\);

-- Location: LCCOMB_X20_Y16_N6
\ram~240\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~240_combout\ = (\ram~239_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~239_combout\,
	datad => \write~input_o\,
	combout => \ram~240_combout\);

-- Location: FF_X22_Y16_N3
\ram~21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~21feeder_combout\,
	ena => \ram~240_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~21_q\);

-- Location: LCCOMB_X21_Y16_N10
\ram~241\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~241_combout\ = (!\address[2]~input_o\ & (!\address[0]~input_o\ & (!\address[1]~input_o\ & !\address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[2]~input_o\,
	datab => \address[0]~input_o\,
	datac => \address[1]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~241_combout\);

-- Location: LCCOMB_X21_Y16_N4
\ram~242\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~242_combout\ = (\ram~241_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~241_combout\,
	datad => \write~input_o\,
	combout => \ram~242_combout\);

-- Location: FF_X20_Y18_N9
\ram~13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~13_q\);

-- Location: LCCOMB_X20_Y18_N8
\ram~145\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~145_combout\ = (\address[1]~input_o\ & (((\address[0]~input_o\)))) # (!\address[1]~input_o\ & ((\address[0]~input_o\ & (\ram~21_q\)) # (!\address[0]~input_o\ & ((\ram~13_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~21_q\,
	datab => \address[1]~input_o\,
	datac => \ram~13_q\,
	datad => \address[0]~input_o\,
	combout => \ram~145_combout\);

-- Location: LCCOMB_X21_Y16_N14
\ram~243\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~243_combout\ = (!\address[2]~input_o\ & (\address[0]~input_o\ & (\address[1]~input_o\ & !\address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[2]~input_o\,
	datab => \address[0]~input_o\,
	datac => \address[1]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~243_combout\);

-- Location: LCCOMB_X21_Y16_N0
\ram~244\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~244_combout\ = (\ram~243_combout\ & \write~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ram~243_combout\,
	datad => \write~input_o\,
	combout => \ram~244_combout\);

-- Location: FF_X21_Y16_N9
\ram~37\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~37_q\);

-- Location: LCCOMB_X22_Y19_N24
\ram~237\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~237_combout\ = (!\address[0]~input_o\ & (\address[1]~input_o\ & (!\address[2]~input_o\ & !\address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \address[2]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~237_combout\);

-- Location: LCCOMB_X22_Y19_N2
\ram~238\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~238_combout\ = (\write~input_o\ & \ram~237_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write~input_o\,
	datad => \ram~237_combout\,
	combout => \ram~238_combout\);

-- Location: FF_X19_Y18_N1
\ram~29\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	sload => VCC,
	ena => \ram~238_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~29_q\);

-- Location: LCCOMB_X21_Y16_N8
\ram~146\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~146_combout\ = (\ram~145_combout\ & (((\ram~37_q\)) # (!\address[1]~input_o\))) # (!\ram~145_combout\ & (\address[1]~input_o\ & ((\ram~29_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~145_combout\,
	datab => \address[1]~input_o\,
	datac => \ram~37_q\,
	datad => \ram~29_q\,
	combout => \ram~146_combout\);

-- Location: LCCOMB_X20_Y16_N4
\ram~147\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~147_combout\ = (\address[2]~input_o\ & ((\ram~144_combout\) # ((\address[3]~input_o\)))) # (!\address[2]~input_o\ & (((\ram~146_combout\ & !\address[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~144_combout\,
	datab => \ram~146_combout\,
	datac => \address[2]~input_o\,
	datad => \address[3]~input_o\,
	combout => \ram~147_combout\);

-- Location: LCCOMB_X20_Y16_N22
\ram~150\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~150_combout\ = (\ram~147_combout\ & (((\ram~149_combout\) # (!\address[3]~input_o\)))) # (!\ram~147_combout\ & (\ram~142_combout\ & ((\address[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~142_combout\,
	datab => \ram~149_combout\,
	datac => \ram~147_combout\,
	datad => \address[3]~input_o\,
	combout => \ram~150_combout\);

-- Location: IOIBUF_X33_Y15_N1
\data_in[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(1),
	o => \data_in[1]~input_o\);

-- Location: LCCOMB_X21_Y18_N12
\ram~62feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~62feeder_combout\ = \data_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[1]~input_o\,
	combout => \ram~62feeder_combout\);

-- Location: FF_X21_Y18_N13
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

-- Location: FF_X19_Y19_N17
\ram~94\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	sload => VCC,
	ena => \ram~222_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~94_q\);

-- Location: FF_X19_Y18_N5
\ram~30\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	sload => VCC,
	ena => \ram~238_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~30_q\);

-- Location: LCCOMB_X19_Y18_N4
\ram~151\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~151_combout\ = (\address[3]~input_o\ & ((\ram~94_q\) # ((\address[2]~input_o\)))) # (!\address[3]~input_o\ & (((\ram~30_q\ & !\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~94_q\,
	datac => \ram~30_q\,
	datad => \address[2]~input_o\,
	combout => \ram~151_combout\);

-- Location: FF_X19_Y18_N15
\ram~126\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	sload => VCC,
	ena => \ram~248_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~126_q\);

-- Location: LCCOMB_X19_Y18_N14
\ram~152\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~152_combout\ = (\ram~151_combout\ & (((\ram~126_q\) # (!\address[2]~input_o\)))) # (!\ram~151_combout\ & (\ram~62_q\ & ((\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~62_q\,
	datab => \ram~151_combout\,
	datac => \ram~126_q\,
	datad => \address[2]~input_o\,
	combout => \ram~152_combout\);

-- Location: FF_X20_Y18_N13
\ram~14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~14_q\);

-- Location: FF_X20_Y19_N13
\ram~78\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	sload => VCC,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~78_q\);

-- Location: LCCOMB_X20_Y18_N12
\ram~155\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~155_combout\ = (\address[3]~input_o\ & ((\address[2]~input_o\) # ((\ram~78_q\)))) # (!\address[3]~input_o\ & (!\address[2]~input_o\ & (\ram~14_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \address[2]~input_o\,
	datac => \ram~14_q\,
	datad => \ram~78_q\,
	combout => \ram~155_combout\);

-- Location: FF_X20_Y18_N15
\ram~110\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~110_q\);

-- Location: LCCOMB_X21_Y18_N6
\ram~46feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~46feeder_combout\ = \data_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[1]~input_o\,
	combout => \ram~46feeder_combout\);

-- Location: FF_X21_Y18_N7
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

-- Location: LCCOMB_X20_Y18_N14
\ram~156\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~156_combout\ = (\ram~155_combout\ & (((\ram~110_q\)) # (!\address[2]~input_o\))) # (!\ram~155_combout\ & (\address[2]~input_o\ & ((\ram~46_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~155_combout\,
	datab => \address[2]~input_o\,
	datac => \ram~110_q\,
	datad => \ram~46_q\,
	combout => \ram~156_combout\);

-- Location: LCCOMB_X21_Y16_N2
\ram~86feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~86feeder_combout\ = \data_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[1]~input_o\,
	combout => \ram~86feeder_combout\);

-- Location: FF_X21_Y16_N3
\ram~86\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~86feeder_combout\,
	ena => \ram~224_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~86_q\);

-- Location: FF_X19_Y17_N13
\ram~118\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	sload => VCC,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~118_q\);

-- Location: FF_X22_Y16_N29
\ram~54\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	sload => VCC,
	ena => \ram~230_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~54_q\);

-- Location: FF_X22_Y16_N23
\ram~22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	sload => VCC,
	ena => \ram~240_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~22_q\);

-- Location: LCCOMB_X22_Y16_N22
\ram~153\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~153_combout\ = (\address[3]~input_o\ & (((\address[2]~input_o\)))) # (!\address[3]~input_o\ & ((\address[2]~input_o\ & (\ram~54_q\)) # (!\address[2]~input_o\ & ((\ram~22_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~54_q\,
	datac => \ram~22_q\,
	datad => \address[2]~input_o\,
	combout => \ram~153_combout\);

-- Location: LCCOMB_X19_Y17_N12
\ram~154\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~154_combout\ = (\address[3]~input_o\ & ((\ram~153_combout\ & ((\ram~118_q\))) # (!\ram~153_combout\ & (\ram~86_q\)))) # (!\address[3]~input_o\ & (((\ram~153_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~86_q\,
	datab => \address[3]~input_o\,
	datac => \ram~118_q\,
	datad => \ram~153_combout\,
	combout => \ram~154_combout\);

-- Location: LCCOMB_X20_Y19_N14
\ram~157\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~157_combout\ = (\address[1]~input_o\ & (((\address[0]~input_o\)))) # (!\address[1]~input_o\ & ((\address[0]~input_o\ & ((\ram~154_combout\))) # (!\address[0]~input_o\ & (\ram~156_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~156_combout\,
	datab => \address[1]~input_o\,
	datac => \ram~154_combout\,
	datad => \address[0]~input_o\,
	combout => \ram~157_combout\);

-- Location: FF_X19_Y19_N27
\ram~102\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	sload => VCC,
	ena => \ram~228_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~102_q\);

-- Location: FF_X19_Y17_N31
\ram~134\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~134_q\);

-- Location: FF_X20_Y17_N11
\ram~70\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	sload => VCC,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~70_q\);

-- Location: FF_X20_Y17_N5
\ram~38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~38_q\);

-- Location: LCCOMB_X20_Y17_N4
\ram~158\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~158_combout\ = (\address[2]~input_o\ & ((\ram~70_q\) # ((\address[3]~input_o\)))) # (!\address[2]~input_o\ & (((\ram~38_q\ & !\address[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~70_q\,
	datab => \address[2]~input_o\,
	datac => \ram~38_q\,
	datad => \address[3]~input_o\,
	combout => \ram~158_combout\);

-- Location: LCCOMB_X19_Y17_N30
\ram~159\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~159_combout\ = (\address[3]~input_o\ & ((\ram~158_combout\ & ((\ram~134_q\))) # (!\ram~158_combout\ & (\ram~102_q\)))) # (!\address[3]~input_o\ & (((\ram~158_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~102_q\,
	datab => \address[3]~input_o\,
	datac => \ram~134_q\,
	datad => \ram~158_combout\,
	combout => \ram~159_combout\);

-- Location: LCCOMB_X20_Y19_N0
\ram~160\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~160_combout\ = (\address[1]~input_o\ & ((\ram~157_combout\ & ((\ram~159_combout\))) # (!\ram~157_combout\ & (\ram~152_combout\)))) # (!\address[1]~input_o\ & (((\ram~157_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~152_combout\,
	datab => \address[1]~input_o\,
	datac => \ram~157_combout\,
	datad => \ram~159_combout\,
	combout => \ram~160_combout\);

-- Location: IOIBUF_X33_Y15_N8
\data_in[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(2),
	o => \data_in[2]~input_o\);

-- Location: FF_X20_Y19_N3
\ram~87\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	sload => VCC,
	ena => \ram~224_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~87_q\);

-- Location: FF_X19_Y19_N15
\ram~103\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	sload => VCC,
	ena => \ram~228_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~103_q\);

-- Location: FF_X19_Y19_N21
\ram~95\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	sload => VCC,
	ena => \ram~222_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~95_q\);

-- Location: FF_X20_Y19_N5
\ram~79\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	sload => VCC,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~79_q\);

-- Location: LCCOMB_X20_Y19_N4
\ram~163\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~163_combout\ = (\address[1]~input_o\ & ((\ram~95_q\) # ((\address[0]~input_o\)))) # (!\address[1]~input_o\ & (((\ram~79_q\ & !\address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~95_q\,
	datab => \address[1]~input_o\,
	datac => \ram~79_q\,
	datad => \address[0]~input_o\,
	combout => \ram~163_combout\);

-- Location: LCCOMB_X19_Y19_N14
\ram~164\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~164_combout\ = (\address[0]~input_o\ & ((\ram~163_combout\ & ((\ram~103_q\))) # (!\ram~163_combout\ & (\ram~87_q\)))) # (!\address[0]~input_o\ & (((\ram~163_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~87_q\,
	datab => \address[0]~input_o\,
	datac => \ram~103_q\,
	datad => \ram~163_combout\,
	combout => \ram~164_combout\);

-- Location: LCCOMB_X22_Y16_N26
\ram~23feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~23feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \ram~23feeder_combout\);

-- Location: FF_X22_Y16_N27
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

-- Location: LCCOMB_X19_Y18_N8
\ram~31feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~31feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \ram~31feeder_combout\);

-- Location: FF_X19_Y18_N9
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

-- Location: FF_X20_Y18_N25
\ram~15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~15_q\);

-- Location: LCCOMB_X20_Y18_N24
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

-- Location: FF_X20_Y17_N9
\ram~39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~39_q\);

-- Location: LCCOMB_X20_Y17_N8
\ram~166\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~166_combout\ = (\ram~165_combout\ & (((\ram~39_q\) # (!\address[0]~input_o\)))) # (!\ram~165_combout\ & (\ram~23_q\ & ((\address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~23_q\,
	datab => \ram~165_combout\,
	datac => \ram~39_q\,
	datad => \address[0]~input_o\,
	combout => \ram~166_combout\);

-- Location: LCCOMB_X19_Y18_N10
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

-- Location: LCCOMB_X19_Y18_N28
\ram~127feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~127feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \ram~127feeder_combout\);

-- Location: FF_X19_Y18_N29
\ram~127\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~127feeder_combout\,
	ena => \ram~248_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~127_q\);

-- Location: FF_X19_Y17_N3
\ram~135\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~135_q\);

-- Location: FF_X19_Y17_N9
\ram~119\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	sload => VCC,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~119_q\);

-- Location: FF_X20_Y18_N27
\ram~111\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~111_q\);

-- Location: LCCOMB_X20_Y18_N26
\ram~168\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~168_combout\ = (\address[0]~input_o\ & ((\ram~119_q\) # ((\address[1]~input_o\)))) # (!\address[0]~input_o\ & (((\ram~111_q\ & !\address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~119_q\,
	datab => \address[0]~input_o\,
	datac => \ram~111_q\,
	datad => \address[1]~input_o\,
	combout => \ram~168_combout\);

-- Location: LCCOMB_X19_Y17_N2
\ram~169\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~169_combout\ = (\address[1]~input_o\ & ((\ram~168_combout\ & ((\ram~135_q\))) # (!\ram~168_combout\ & (\ram~127_q\)))) # (!\address[1]~input_o\ & (((\ram~168_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~127_q\,
	datab => \address[1]~input_o\,
	datac => \ram~135_q\,
	datad => \ram~168_combout\,
	combout => \ram~169_combout\);

-- Location: FF_X21_Y18_N27
\ram~47\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	sload => VCC,
	ena => \ram~234_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~47_q\);

-- Location: LCCOMB_X22_Y16_N24
\ram~55feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~55feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \ram~55feeder_combout\);

-- Location: FF_X22_Y16_N25
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

-- Location: LCCOMB_X21_Y18_N26
\ram~161\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~161_combout\ = (\address[1]~input_o\ & (\address[0]~input_o\)) # (!\address[1]~input_o\ & ((\address[0]~input_o\ & ((\ram~55_q\))) # (!\address[0]~input_o\ & (\ram~47_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \ram~47_q\,
	datad => \ram~55_q\,
	combout => \ram~161_combout\);

-- Location: FF_X20_Y17_N31
\ram~71\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	sload => VCC,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~71_q\);

-- Location: FF_X21_Y18_N17
\ram~63\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	sload => VCC,
	ena => \ram~232_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~63_q\);

-- Location: LCCOMB_X20_Y17_N30
\ram~162\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~162_combout\ = (\ram~161_combout\ & (((\ram~71_q\)) # (!\address[1]~input_o\))) # (!\ram~161_combout\ & (\address[1]~input_o\ & ((\ram~63_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~161_combout\,
	datab => \address[1]~input_o\,
	datac => \ram~71_q\,
	datad => \ram~63_q\,
	combout => \ram~162_combout\);

-- Location: LCCOMB_X19_Y18_N6
\ram~170\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~170_combout\ = (\ram~167_combout\ & ((\ram~169_combout\) # ((!\address[2]~input_o\)))) # (!\ram~167_combout\ & (((\ram~162_combout\ & \address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~167_combout\,
	datab => \ram~169_combout\,
	datac => \ram~162_combout\,
	datad => \address[2]~input_o\,
	combout => \ram~170_combout\);

-- Location: IOIBUF_X33_Y14_N8
\data_in[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(3),
	o => \data_in[3]~input_o\);

-- Location: FF_X20_Y17_N29
\ram~40\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~40_q\);

-- Location: FF_X19_Y19_N11
\ram~104\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	sload => VCC,
	ena => \ram~228_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~104_q\);

-- Location: LCCOMB_X20_Y17_N28
\ram~178\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~178_combout\ = (\address[3]~input_o\ & ((\address[2]~input_o\) # ((\ram~104_q\)))) # (!\address[3]~input_o\ & (!\address[2]~input_o\ & (\ram~40_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \address[2]~input_o\,
	datac => \ram~40_q\,
	datad => \ram~104_q\,
	combout => \ram~178_combout\);

-- Location: FF_X20_Y17_N19
\ram~72\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	sload => VCC,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~72_q\);

-- Location: FF_X19_Y17_N5
\ram~136\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~136_q\);

-- Location: LCCOMB_X19_Y17_N4
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

-- Location: FF_X20_Y19_N31
\ram~80\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	sload => VCC,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~80_q\);

-- Location: FF_X20_Y18_N21
\ram~16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~16_q\);

-- Location: LCCOMB_X21_Y18_N22
\ram~48feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~48feeder_combout\ = \data_in[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[3]~input_o\,
	combout => \ram~48feeder_combout\);

-- Location: FF_X21_Y18_N23
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

-- Location: LCCOMB_X20_Y18_N20
\ram~175\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~175_combout\ = (\address[3]~input_o\ & (\address[2]~input_o\)) # (!\address[3]~input_o\ & ((\address[2]~input_o\ & ((\ram~48_q\))) # (!\address[2]~input_o\ & (\ram~16_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \address[2]~input_o\,
	datac => \ram~16_q\,
	datad => \ram~48_q\,
	combout => \ram~175_combout\);

-- Location: FF_X20_Y18_N23
\ram~112\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~112_q\);

-- Location: LCCOMB_X20_Y18_N22
\ram~176\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~176_combout\ = (\ram~175_combout\ & (((\ram~112_q\) # (!\address[3]~input_o\)))) # (!\ram~175_combout\ & (\ram~80_q\ & ((\address[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~80_q\,
	datab => \ram~175_combout\,
	datac => \ram~112_q\,
	datad => \address[3]~input_o\,
	combout => \ram~176_combout\);

-- Location: FF_X19_Y19_N9
\ram~96\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	sload => VCC,
	ena => \ram~222_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~96_q\);

-- Location: LCCOMB_X21_Y18_N20
\ram~64feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~64feeder_combout\ = \data_in[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[3]~input_o\,
	combout => \ram~64feeder_combout\);

-- Location: FF_X21_Y18_N21
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

-- Location: FF_X19_Y18_N25
\ram~32\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	sload => VCC,
	ena => \ram~238_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~32_q\);

-- Location: LCCOMB_X19_Y18_N24
\ram~173\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~173_combout\ = (\address[3]~input_o\ & (((\address[2]~input_o\)))) # (!\address[3]~input_o\ & ((\address[2]~input_o\ & (\ram~64_q\)) # (!\address[2]~input_o\ & ((\ram~32_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~64_q\,
	datac => \ram~32_q\,
	datad => \address[2]~input_o\,
	combout => \ram~173_combout\);

-- Location: FF_X19_Y18_N27
\ram~128\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	sload => VCC,
	ena => \ram~248_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~128_q\);

-- Location: LCCOMB_X19_Y18_N26
\ram~174\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~174_combout\ = (\ram~173_combout\ & (((\ram~128_q\) # (!\address[3]~input_o\)))) # (!\ram~173_combout\ & (\ram~96_q\ & ((\address[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~96_q\,
	datab => \ram~173_combout\,
	datac => \ram~128_q\,
	datad => \address[3]~input_o\,
	combout => \ram~174_combout\);

-- Location: LCCOMB_X20_Y19_N24
\ram~177\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~177_combout\ = (\address[0]~input_o\ & (((\address[1]~input_o\)))) # (!\address[0]~input_o\ & ((\address[1]~input_o\ & ((\ram~174_combout\))) # (!\address[1]~input_o\ & (\ram~176_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~176_combout\,
	datab => \address[0]~input_o\,
	datac => \address[1]~input_o\,
	datad => \ram~174_combout\,
	combout => \ram~177_combout\);

-- Location: FF_X22_Y16_N15
\ram~24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	sload => VCC,
	ena => \ram~240_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~24_q\);

-- Location: LCCOMB_X22_Y19_N8
\ram~88feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~88feeder_combout\ = \data_in[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[3]~input_o\,
	combout => \ram~88feeder_combout\);

-- Location: FF_X22_Y19_N9
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

-- Location: LCCOMB_X22_Y16_N14
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

-- Location: FF_X22_Y19_N11
\ram~120\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	sload => VCC,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~120_q\);

-- Location: FF_X22_Y16_N5
\ram~56\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	sload => VCC,
	ena => \ram~230_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~56_q\);

-- Location: LCCOMB_X22_Y19_N10
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

-- Location: LCCOMB_X20_Y19_N10
\ram~180\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~180_combout\ = (\ram~177_combout\ & ((\ram~179_combout\) # ((!\address[0]~input_o\)))) # (!\ram~177_combout\ & (((\ram~172_combout\ & \address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~179_combout\,
	datab => \ram~177_combout\,
	datac => \ram~172_combout\,
	datad => \address[0]~input_o\,
	combout => \ram~180_combout\);

-- Location: IOIBUF_X24_Y31_N1
\data_in[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(4),
	o => \data_in[4]~input_o\);

-- Location: LCCOMB_X22_Y16_N16
\ram~57feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~57feeder_combout\ = \data_in[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[4]~input_o\,
	combout => \ram~57feeder_combout\);

-- Location: FF_X22_Y16_N17
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

-- Location: FF_X21_Y18_N11
\ram~49\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	sload => VCC,
	ena => \ram~234_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~49_q\);

-- Location: FF_X21_Y18_N9
\ram~65\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	sload => VCC,
	ena => \ram~232_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~65_q\);

-- Location: LCCOMB_X21_Y18_N10
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

-- Location: FF_X20_Y17_N7
\ram~73\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	sload => VCC,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~73_q\);

-- Location: LCCOMB_X20_Y17_N6
\ram~184\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~184_combout\ = (\ram~183_combout\ & (((\ram~73_q\) # (!\address[0]~input_o\)))) # (!\ram~183_combout\ & (\ram~57_q\ & ((\address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~57_q\,
	datab => \ram~183_combout\,
	datac => \ram~73_q\,
	datad => \address[0]~input_o\,
	combout => \ram~184_combout\);

-- Location: FF_X21_Y19_N19
\ram~17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~17_q\);

-- Location: LCCOMB_X22_Y16_N18
\ram~25feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~25feeder_combout\ = \data_in[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[4]~input_o\,
	combout => \ram~25feeder_combout\);

-- Location: FF_X22_Y16_N19
\ram~25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~25feeder_combout\,
	ena => \ram~240_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~25_q\);

-- Location: LCCOMB_X21_Y19_N18
\ram~185\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~185_combout\ = (\address[1]~input_o\ & (\address[0]~input_o\)) # (!\address[1]~input_o\ & ((\address[0]~input_o\ & ((\ram~25_q\))) # (!\address[0]~input_o\ & (\ram~17_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \ram~17_q\,
	datad => \ram~25_q\,
	combout => \ram~185_combout\);

-- Location: FF_X21_Y16_N29
\ram~41\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~41_q\);

-- Location: FF_X21_Y19_N25
\ram~33\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	sload => VCC,
	ena => \ram~238_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~33_q\);

-- Location: LCCOMB_X21_Y16_N28
\ram~186\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~186_combout\ = (\ram~185_combout\ & (((\ram~41_q\)) # (!\address[1]~input_o\))) # (!\ram~185_combout\ & (\address[1]~input_o\ & ((\ram~33_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~185_combout\,
	datab => \address[1]~input_o\,
	datac => \ram~41_q\,
	datad => \ram~33_q\,
	combout => \ram~186_combout\);

-- Location: LCCOMB_X19_Y17_N6
\ram~187\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~187_combout\ = (\address[3]~input_o\ & (((\address[2]~input_o\)))) # (!\address[3]~input_o\ & ((\address[2]~input_o\ & (\ram~184_combout\)) # (!\address[2]~input_o\ & ((\ram~186_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~184_combout\,
	datab => \address[3]~input_o\,
	datac => \ram~186_combout\,
	datad => \address[2]~input_o\,
	combout => \ram~187_combout\);

-- Location: FF_X20_Y18_N17
\ram~113\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~113_q\);

-- Location: LCCOMB_X19_Y18_N20
\ram~129feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~129feeder_combout\ = \data_in[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[4]~input_o\,
	combout => \ram~129feeder_combout\);

-- Location: FF_X19_Y18_N21
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

-- Location: LCCOMB_X20_Y18_N16
\ram~188\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~188_combout\ = (\address[0]~input_o\ & (\address[1]~input_o\)) # (!\address[0]~input_o\ & ((\address[1]~input_o\ & ((\ram~129_q\))) # (!\address[1]~input_o\ & (\ram~113_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \ram~113_q\,
	datad => \ram~129_q\,
	combout => \ram~188_combout\);

-- Location: FF_X19_Y17_N19
\ram~137\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~137_q\);

-- Location: FF_X19_Y17_N25
\ram~121\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	sload => VCC,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~121_q\);

-- Location: LCCOMB_X19_Y17_N18
\ram~189\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~189_combout\ = (\address[0]~input_o\ & ((\ram~188_combout\ & (\ram~137_q\)) # (!\ram~188_combout\ & ((\ram~121_q\))))) # (!\address[0]~input_o\ & (\ram~188_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~188_combout\,
	datac => \ram~137_q\,
	datad => \ram~121_q\,
	combout => \ram~189_combout\);

-- Location: FF_X19_Y19_N13
\ram~97\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	sload => VCC,
	ena => \ram~222_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~97_q\);

-- Location: FF_X19_Y19_N23
\ram~105\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	sload => VCC,
	ena => \ram~228_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~105_q\);

-- Location: FF_X20_Y19_N7
\ram~81\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[4]~input_o\,
	sload => VCC,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~81_q\);

-- Location: LCCOMB_X20_Y19_N28
\ram~89feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~89feeder_combout\ = \data_in[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[4]~input_o\,
	combout => \ram~89feeder_combout\);

-- Location: FF_X20_Y19_N29
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

-- Location: LCCOMB_X20_Y19_N6
\ram~181\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~181_combout\ = (\address[0]~input_o\ & ((\address[1]~input_o\) # ((\ram~89_q\)))) # (!\address[0]~input_o\ & (!\address[1]~input_o\ & (\ram~81_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \ram~81_q\,
	datad => \ram~89_q\,
	combout => \ram~181_combout\);

-- Location: LCCOMB_X19_Y19_N22
\ram~182\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~182_combout\ = (\address[1]~input_o\ & ((\ram~181_combout\ & ((\ram~105_q\))) # (!\ram~181_combout\ & (\ram~97_q\)))) # (!\address[1]~input_o\ & (((\ram~181_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~97_q\,
	datab => \address[1]~input_o\,
	datac => \ram~105_q\,
	datad => \ram~181_combout\,
	combout => \ram~182_combout\);

-- Location: LCCOMB_X19_Y17_N20
\ram~190\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~190_combout\ = (\ram~187_combout\ & ((\ram~189_combout\) # ((!\address[3]~input_o\)))) # (!\ram~187_combout\ & (((\address[3]~input_o\ & \ram~182_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~187_combout\,
	datab => \ram~189_combout\,
	datac => \address[3]~input_o\,
	datad => \ram~182_combout\,
	combout => \ram~190_combout\);

-- Location: IOIBUF_X33_Y12_N1
\data_in[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(5),
	o => \data_in[5]~input_o\);

-- Location: FF_X20_Y17_N3
\ram~42\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~42_q\);

-- Location: FF_X20_Y17_N25
\ram~74\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~74_q\);

-- Location: LCCOMB_X20_Y17_N2
\ram~198\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~198_combout\ = (\address[3]~input_o\ & (\address[2]~input_o\)) # (!\address[3]~input_o\ & ((\address[2]~input_o\ & ((\ram~74_q\))) # (!\address[2]~input_o\ & (\ram~42_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \address[2]~input_o\,
	datac => \ram~42_q\,
	datad => \ram~74_q\,
	combout => \ram~198_combout\);

-- Location: FF_X19_Y17_N23
\ram~138\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~138_q\);

-- Location: FF_X21_Y17_N25
\ram~106\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~228_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~106_q\);

-- Location: LCCOMB_X19_Y17_N22
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

-- Location: FF_X19_Y19_N25
\ram~98\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~222_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~98_q\);

-- Location: FF_X19_Y18_N23
\ram~34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~238_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~34_q\);

-- Location: LCCOMB_X19_Y18_N22
\ram~191\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~191_combout\ = (\address[3]~input_o\ & ((\ram~98_q\) # ((\address[2]~input_o\)))) # (!\address[3]~input_o\ & (((\ram~34_q\ & !\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~98_q\,
	datac => \ram~34_q\,
	datad => \address[2]~input_o\,
	combout => \ram~191_combout\);

-- Location: FF_X21_Y18_N29
\ram~66\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~232_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~66_q\);

-- Location: FF_X19_Y18_N17
\ram~130\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~248_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~130_q\);

-- Location: LCCOMB_X19_Y18_N16
\ram~192\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~192_combout\ = (\ram~191_combout\ & (((\ram~130_q\) # (!\address[2]~input_o\)))) # (!\ram~191_combout\ & (\ram~66_q\ & ((\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~191_combout\,
	datab => \ram~66_q\,
	datac => \ram~130_q\,
	datad => \address[2]~input_o\,
	combout => \ram~192_combout\);

-- Location: FF_X22_Y16_N31
\ram~26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~240_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~26_q\);

-- Location: FF_X22_Y16_N13
\ram~58\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~230_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~58_q\);

-- Location: LCCOMB_X22_Y16_N30
\ram~193\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~193_combout\ = (\address[3]~input_o\ & (\address[2]~input_o\)) # (!\address[3]~input_o\ & ((\address[2]~input_o\ & ((\ram~58_q\))) # (!\address[2]~input_o\ & (\ram~26_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \address[2]~input_o\,
	datac => \ram~26_q\,
	datad => \ram~58_q\,
	combout => \ram~193_combout\);

-- Location: FF_X22_Y19_N5
\ram~90\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~224_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~90_q\);

-- Location: FF_X22_Y19_N31
\ram~122\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~122_q\);

-- Location: LCCOMB_X22_Y19_N30
\ram~194\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~194_combout\ = (\ram~193_combout\ & (((\ram~122_q\) # (!\address[3]~input_o\)))) # (!\ram~193_combout\ & (\ram~90_q\ & ((\address[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~193_combout\,
	datab => \ram~90_q\,
	datac => \ram~122_q\,
	datad => \address[3]~input_o\,
	combout => \ram~194_combout\);

-- Location: FF_X20_Y19_N9
\ram~82\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~82_q\);

-- Location: FF_X20_Y18_N11
\ram~18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~18_q\);

-- Location: LCCOMB_X20_Y18_N10
\ram~195\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~195_combout\ = (\address[2]~input_o\ & (((\address[3]~input_o\)))) # (!\address[2]~input_o\ & ((\address[3]~input_o\ & (\ram~82_q\)) # (!\address[3]~input_o\ & ((\ram~18_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~82_q\,
	datab => \address[2]~input_o\,
	datac => \ram~18_q\,
	datad => \address[3]~input_o\,
	combout => \ram~195_combout\);

-- Location: FF_X20_Y18_N5
\ram~114\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~114_q\);

-- Location: FF_X21_Y18_N15
\ram~50\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[5]~input_o\,
	sload => VCC,
	ena => \ram~234_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~50_q\);

-- Location: LCCOMB_X20_Y18_N4
\ram~196\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~196_combout\ = (\ram~195_combout\ & (((\ram~114_q\)) # (!\address[2]~input_o\))) # (!\ram~195_combout\ & (\address[2]~input_o\ & ((\ram~50_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~195_combout\,
	datab => \address[2]~input_o\,
	datac => \ram~114_q\,
	datad => \ram~50_q\,
	combout => \ram~196_combout\);

-- Location: LCCOMB_X20_Y18_N6
\ram~197\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~197_combout\ = (\address[1]~input_o\ & (((\address[0]~input_o\)))) # (!\address[1]~input_o\ & ((\address[0]~input_o\ & (\ram~194_combout\)) # (!\address[0]~input_o\ & ((\ram~196_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~194_combout\,
	datab => \address[1]~input_o\,
	datac => \ram~196_combout\,
	datad => \address[0]~input_o\,
	combout => \ram~197_combout\);

-- Location: LCCOMB_X20_Y18_N0
\ram~200\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~200_combout\ = (\address[1]~input_o\ & ((\ram~197_combout\ & (\ram~199_combout\)) # (!\ram~197_combout\ & ((\ram~192_combout\))))) # (!\address[1]~input_o\ & (((\ram~197_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~199_combout\,
	datab => \address[1]~input_o\,
	datac => \ram~192_combout\,
	datad => \ram~197_combout\,
	combout => \ram~200_combout\);

-- Location: IOIBUF_X20_Y31_N8
\data_in[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(6),
	o => \data_in[6]~input_o\);

-- Location: FF_X19_Y18_N19
\ram~131\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	sload => VCC,
	ena => \ram~248_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~131_q\);

-- Location: FF_X19_Y17_N27
\ram~139\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~139_q\);

-- Location: LCCOMB_X19_Y17_N0
\ram~123feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~123feeder_combout\ = \data_in[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[6]~input_o\,
	combout => \ram~123feeder_combout\);

-- Location: FF_X19_Y17_N1
\ram~123\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~123feeder_combout\,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~123_q\);

-- Location: FF_X20_Y18_N3
\ram~115\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~115_q\);

-- Location: LCCOMB_X20_Y18_N2
\ram~208\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~208_combout\ = (\address[1]~input_o\ & (((\address[0]~input_o\)))) # (!\address[1]~input_o\ & ((\address[0]~input_o\ & (\ram~123_q\)) # (!\address[0]~input_o\ & ((\ram~115_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~123_q\,
	datab => \address[1]~input_o\,
	datac => \ram~115_q\,
	datad => \address[0]~input_o\,
	combout => \ram~208_combout\);

-- Location: LCCOMB_X19_Y17_N26
\ram~209\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~209_combout\ = (\address[1]~input_o\ & ((\ram~208_combout\ & ((\ram~139_q\))) # (!\ram~208_combout\ & (\ram~131_q\)))) # (!\address[1]~input_o\ & (((\ram~208_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~131_q\,
	datab => \address[1]~input_o\,
	datac => \ram~139_q\,
	datad => \ram~208_combout\,
	combout => \ram~209_combout\);

-- Location: FF_X20_Y19_N19
\ram~91\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	sload => VCC,
	ena => \ram~224_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~91_q\);

-- Location: FF_X19_Y19_N5
\ram~107\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	sload => VCC,
	ena => \ram~228_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~107_q\);

-- Location: FF_X19_Y19_N3
\ram~99\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	sload => VCC,
	ena => \ram~222_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~99_q\);

-- Location: FF_X20_Y19_N21
\ram~83\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	sload => VCC,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~83_q\);

-- Location: LCCOMB_X20_Y19_N20
\ram~203\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~203_combout\ = (\address[1]~input_o\ & ((\ram~99_q\) # ((\address[0]~input_o\)))) # (!\address[1]~input_o\ & (((\ram~83_q\ & !\address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~99_q\,
	datab => \address[1]~input_o\,
	datac => \ram~83_q\,
	datad => \address[0]~input_o\,
	combout => \ram~203_combout\);

-- Location: LCCOMB_X19_Y19_N4
\ram~204\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~204_combout\ = (\address[0]~input_o\ & ((\ram~203_combout\ & ((\ram~107_q\))) # (!\ram~203_combout\ & (\ram~91_q\)))) # (!\address[0]~input_o\ & (((\ram~203_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \ram~91_q\,
	datac => \ram~107_q\,
	datad => \ram~203_combout\,
	combout => \ram~204_combout\);

-- Location: LCCOMB_X22_Y16_N10
\ram~27feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~27feeder_combout\ = \data_in[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[6]~input_o\,
	combout => \ram~27feeder_combout\);

-- Location: FF_X22_Y16_N11
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

-- Location: FF_X21_Y19_N15
\ram~19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~19_q\);

-- Location: FF_X21_Y19_N13
\ram~35\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	sload => VCC,
	ena => \ram~238_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~35_q\);

-- Location: LCCOMB_X21_Y19_N14
\ram~205\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~205_combout\ = (\address[1]~input_o\ & ((\address[0]~input_o\) # ((\ram~35_q\)))) # (!\address[1]~input_o\ & (!\address[0]~input_o\ & (\ram~19_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \ram~19_q\,
	datad => \ram~35_q\,
	combout => \ram~205_combout\);

-- Location: FF_X20_Y17_N23
\ram~43\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~43_q\);

-- Location: LCCOMB_X20_Y17_N22
\ram~206\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~206_combout\ = (\ram~205_combout\ & (((\ram~43_q\) # (!\address[0]~input_o\)))) # (!\ram~205_combout\ & (\ram~27_q\ & ((\address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~27_q\,
	datab => \ram~205_combout\,
	datac => \ram~43_q\,
	datad => \address[0]~input_o\,
	combout => \ram~206_combout\);

-- Location: LCCOMB_X20_Y17_N0
\ram~207\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~207_combout\ = (\address[2]~input_o\ & (((\address[3]~input_o\)))) # (!\address[2]~input_o\ & ((\address[3]~input_o\ & (\ram~204_combout\)) # (!\address[3]~input_o\ & ((\ram~206_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~204_combout\,
	datab => \address[2]~input_o\,
	datac => \ram~206_combout\,
	datad => \address[3]~input_o\,
	combout => \ram~207_combout\);

-- Location: FF_X21_Y18_N25
\ram~67\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	sload => VCC,
	ena => \ram~232_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~67_q\);

-- Location: FF_X20_Y17_N13
\ram~75\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	sload => VCC,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~75_q\);

-- Location: FF_X21_Y18_N3
\ram~51\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[6]~input_o\,
	sload => VCC,
	ena => \ram~234_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~51_q\);

-- Location: LCCOMB_X22_Y16_N8
\ram~59feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~59feeder_combout\ = \data_in[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[6]~input_o\,
	combout => \ram~59feeder_combout\);

-- Location: FF_X22_Y16_N9
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

-- Location: LCCOMB_X21_Y18_N2
\ram~201\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~201_combout\ = (\address[1]~input_o\ & (\address[0]~input_o\)) # (!\address[1]~input_o\ & ((\address[0]~input_o\ & ((\ram~59_q\))) # (!\address[0]~input_o\ & (\ram~51_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \ram~51_q\,
	datad => \ram~59_q\,
	combout => \ram~201_combout\);

-- Location: LCCOMB_X20_Y17_N12
\ram~202\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~202_combout\ = (\address[1]~input_o\ & ((\ram~201_combout\ & ((\ram~75_q\))) # (!\ram~201_combout\ & (\ram~67_q\)))) # (!\address[1]~input_o\ & (((\ram~201_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~67_q\,
	datab => \address[1]~input_o\,
	datac => \ram~75_q\,
	datad => \ram~201_combout\,
	combout => \ram~202_combout\);

-- Location: LCCOMB_X19_Y17_N28
\ram~210\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~210_combout\ = (\ram~207_combout\ & ((\ram~209_combout\) # ((!\address[2]~input_o\)))) # (!\ram~207_combout\ & (((\ram~202_combout\ & \address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~209_combout\,
	datab => \ram~207_combout\,
	datac => \ram~202_combout\,
	datad => \address[2]~input_o\,
	combout => \ram~210_combout\);

-- Location: IOIBUF_X14_Y31_N8
\data_in[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(7),
	o => \data_in[7]~input_o\);

-- Location: FF_X20_Y17_N27
\ram~76\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	sload => VCC,
	ena => \ram~236_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~76_q\);

-- Location: LCCOMB_X21_Y17_N2
\ram~108feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~108feeder_combout\ = \data_in[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[7]~input_o\,
	combout => \ram~108feeder_combout\);

-- Location: FF_X21_Y17_N3
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

-- Location: FF_X20_Y17_N21
\ram~44\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	sload => VCC,
	ena => \ram~244_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~44_q\);

-- Location: LCCOMB_X20_Y17_N20
\ram~218\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~218_combout\ = (\address[2]~input_o\ & (((\address[3]~input_o\)))) # (!\address[2]~input_o\ & ((\address[3]~input_o\ & (\ram~108_q\)) # (!\address[3]~input_o\ & ((\ram~44_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~108_q\,
	datab => \address[2]~input_o\,
	datac => \ram~44_q\,
	datad => \address[3]~input_o\,
	combout => \ram~218_combout\);

-- Location: FF_X21_Y17_N21
\ram~140\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	sload => VCC,
	ena => \ram~252_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~140_q\);

-- Location: LCCOMB_X21_Y17_N20
\ram~219\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~219_combout\ = (\ram~218_combout\ & (((\ram~140_q\) # (!\address[2]~input_o\)))) # (!\ram~218_combout\ & (\ram~76_q\ & ((\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~76_q\,
	datab => \ram~218_combout\,
	datac => \ram~140_q\,
	datad => \address[2]~input_o\,
	combout => \ram~219_combout\);

-- Location: FF_X21_Y18_N5
\ram~68\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	sload => VCC,
	ena => \ram~232_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~68_q\);

-- Location: FF_X19_Y18_N13
\ram~36\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	sload => VCC,
	ena => \ram~238_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~36_q\);

-- Location: LCCOMB_X19_Y18_N12
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

-- Location: LCCOMB_X19_Y19_N30
\ram~100feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~100feeder_combout\ = \data_in[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[7]~input_o\,
	combout => \ram~100feeder_combout\);

-- Location: FF_X19_Y19_N31
\ram~100\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~100feeder_combout\,
	ena => \ram~222_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~100_q\);

-- Location: FF_X19_Y18_N31
\ram~132\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	sload => VCC,
	ena => \ram~248_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~132_q\);

-- Location: LCCOMB_X19_Y18_N30
\ram~214\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~214_combout\ = (\ram~213_combout\ & (((\ram~132_q\) # (!\address[3]~input_o\)))) # (!\ram~213_combout\ & (\ram~100_q\ & ((\address[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~213_combout\,
	datab => \ram~100_q\,
	datac => \ram~132_q\,
	datad => \address[3]~input_o\,
	combout => \ram~214_combout\);

-- Location: LCCOMB_X20_Y19_N22
\ram~84feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~84feeder_combout\ = \data_in[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[7]~input_o\,
	combout => \ram~84feeder_combout\);

-- Location: FF_X20_Y19_N23
\ram~84\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ram~84feeder_combout\,
	ena => \ram~226_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~84_q\);

-- Location: FF_X20_Y18_N29
\ram~20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	sload => VCC,
	ena => \ram~242_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~20_q\);

-- Location: FF_X21_Y18_N31
\ram~52\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	sload => VCC,
	ena => \ram~234_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~52_q\);

-- Location: LCCOMB_X20_Y18_N28
\ram~215\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~215_combout\ = (\address[3]~input_o\ & (\address[2]~input_o\)) # (!\address[3]~input_o\ & ((\address[2]~input_o\ & ((\ram~52_q\))) # (!\address[2]~input_o\ & (\ram~20_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \address[2]~input_o\,
	datac => \ram~20_q\,
	datad => \ram~52_q\,
	combout => \ram~215_combout\);

-- Location: FF_X20_Y18_N31
\ram~116\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	sload => VCC,
	ena => \ram~250_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~116_q\);

-- Location: LCCOMB_X20_Y18_N30
\ram~216\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~216_combout\ = (\ram~215_combout\ & (((\ram~116_q\) # (!\address[3]~input_o\)))) # (!\ram~215_combout\ & (\ram~84_q\ & ((\address[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~84_q\,
	datab => \ram~215_combout\,
	datac => \ram~116_q\,
	datad => \address[3]~input_o\,
	combout => \ram~216_combout\);

-- Location: LCCOMB_X22_Y19_N28
\ram~217\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~217_combout\ = (\address[0]~input_o\ & (\address[1]~input_o\)) # (!\address[0]~input_o\ & ((\address[1]~input_o\ & (\ram~214_combout\)) # (!\address[1]~input_o\ & ((\ram~216_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \address[1]~input_o\,
	datac => \ram~214_combout\,
	datad => \ram~216_combout\,
	combout => \ram~217_combout\);

-- Location: FF_X22_Y16_N21
\ram~60\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	sload => VCC,
	ena => \ram~230_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~60_q\);

-- Location: FF_X22_Y19_N27
\ram~124\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	sload => VCC,
	ena => \ram~246_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~124_q\);

-- Location: LCCOMB_X22_Y19_N16
\ram~92feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~92feeder_combout\ = \data_in[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[7]~input_o\,
	combout => \ram~92feeder_combout\);

-- Location: FF_X22_Y19_N17
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

-- Location: FF_X22_Y16_N7
\ram~28\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[7]~input_o\,
	sload => VCC,
	ena => \ram~240_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram~28_q\);

-- Location: LCCOMB_X22_Y16_N6
\ram~211\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~211_combout\ = (\address[3]~input_o\ & ((\ram~92_q\) # ((\address[2]~input_o\)))) # (!\address[3]~input_o\ & (((\ram~28_q\ & !\address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[3]~input_o\,
	datab => \ram~92_q\,
	datac => \ram~28_q\,
	datad => \address[2]~input_o\,
	combout => \ram~211_combout\);

-- Location: LCCOMB_X22_Y19_N26
\ram~212\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~212_combout\ = (\address[2]~input_o\ & ((\ram~211_combout\ & ((\ram~124_q\))) # (!\ram~211_combout\ & (\ram~60_q\)))) # (!\address[2]~input_o\ & (((\ram~211_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[2]~input_o\,
	datab => \ram~60_q\,
	datac => \ram~124_q\,
	datad => \ram~211_combout\,
	combout => \ram~212_combout\);

-- Location: LCCOMB_X22_Y19_N14
\ram~220\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ram~220_combout\ = (\ram~217_combout\ & ((\ram~219_combout\) # ((!\address[0]~input_o\)))) # (!\ram~217_combout\ & (((\ram~212_combout\ & \address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ram~219_combout\,
	datab => \ram~217_combout\,
	datac => \ram~212_combout\,
	datad => \address[0]~input_o\,
	combout => \ram~220_combout\);

ww_data_out(0) <= \data_out[0]~output_o\;

ww_data_out(1) <= \data_out[1]~output_o\;

ww_data_out(2) <= \data_out[2]~output_o\;

ww_data_out(3) <= \data_out[3]~output_o\;

ww_data_out(4) <= \data_out[4]~output_o\;

ww_data_out(5) <= \data_out[5]~output_o\;

ww_data_out(6) <= \data_out[6]~output_o\;

ww_data_out(7) <= \data_out[7]~output_o\;
END structure;


