-- VHDL netlist-file
library mach;
use mach.components.all;

library ieee;
use ieee.std_logic_1164.all;
entity address_decoding is
  port (
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic;
    A13 : in std_logic;
    A14 : in std_logic;
    A15 : in std_logic;
    CLK : in std_logic;
    RW : in std_logic;
    MRD : out std_logic;
    MWR : out std_logic;
    RAMSEL : out std_logic;
    ROMSEL : out std_logic;
    ACIA : out std_logic;
    IO1 : out std_logic;
    IO2 : out std_logic;
    RTC : out std_logic
  );
end address_decoding;

architecture NetList of address_decoding is

  signal A5PIN : std_logic;
  signal A6PIN : std_logic;
  signal A7PIN : std_logic;
  signal A8PIN : std_logic;
  signal A9PIN : std_logic;
  signal A10PIN : std_logic;
  signal A11PIN : std_logic;
  signal A12PIN : std_logic;
  signal A13PIN : std_logic;
  signal A14PIN : std_logic;
  signal A15PIN : std_logic;
  signal CLKPIN : std_logic;
  signal RWPIN : std_logic;
  signal MRDCOM : std_logic;
  signal MWRCOM : std_logic;
  signal RAMSELCOM : std_logic;
  signal ROMSELCOM : std_logic;
  signal ACIACOM : std_logic;
  signal IO1COM : std_logic;
  signal IO2COM : std_logic;
  signal RTCCOM : std_logic;
  signal T_0 : std_logic;
  signal T_1 : std_logic;
  signal T_2 : std_logic;
  signal T_3 : std_logic;
  signal T_4 : std_logic;
  signal T_5 : std_logic;
  signal T_6 : std_logic;
  signal T_7 : std_logic;
  signal T_8 : std_logic;
  signal T_9 : std_logic;
  signal T_10 : std_logic;
  signal T_11 : std_logic;
  signal T_12 : std_logic;
  signal T_13 : std_logic;
  signal T_14 : std_logic;
  signal T_15 : std_logic;
  signal T_16 : std_logic;
  signal T_17 : std_logic;
  signal T_18 : std_logic;
  signal T_19 : std_logic;
  signal T_20 : std_logic;
  signal T_21 : std_logic;
  signal T_22 : std_logic;
  signal T_23 : std_logic;
  signal GATE_T_0_A : std_logic;
  signal GATE_T_9_A : std_logic;
  signal GATE_T_10_A : std_logic;
  signal GATE_T_13_A : std_logic;
  signal GATE_T_16_A : std_logic;
  signal GATE_T_20_A : std_logic;

begin
  IN_A5_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>A5PIN, 
            I0=>A5 );
  IN_A6_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>A6PIN, 
            I0=>A6 );
  IN_A7_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>A7PIN, 
            I0=>A7 );
  IN_A8_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>A8PIN, 
            I0=>A8 );
  IN_A9_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>A9PIN, 
            I0=>A9 );
  IN_A10_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>A10PIN, 
            I0=>A10 );
  IN_A11_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>A11PIN, 
            I0=>A11 );
  IN_A12_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>A12PIN, 
            I0=>A12 );
  IN_A13_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>A13PIN, 
            I0=>A13 );
  IN_A14_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>A14PIN, 
            I0=>A14 );
  IN_A15_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>A15PIN, 
            I0=>A15 );
  IN_CLK_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>CLKPIN, 
            I0=>CLK );
  IN_RW_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>RWPIN, 
            I0=>RW );
  OUT_MRD_I_1:   OBUF port map ( O=>MRD, 
            I0=>MRDCOM );
  OUT_MWR_I_1:   OBUF port map ( O=>MWR, 
            I0=>MWRCOM );
  OUT_RAMSEL_I_1:   OBUF port map ( O=>RAMSEL, 
            I0=>RAMSELCOM );
  OUT_ROMSEL_I_1:   OBUF port map ( O=>ROMSEL, 
            I0=>ROMSELCOM );
  OUT_ACIA_I_1:   OBUF port map ( O=>ACIA, 
            I0=>ACIACOM );
  OUT_IO1_I_1:   OBUF port map ( O=>IO1, 
            I0=>IO1COM );
  OUT_IO2_I_1:   OBUF port map ( O=>IO2, 
            I0=>IO2COM );
  OUT_RTC_I_1:   OBUF port map ( O=>RTC, 
            I0=>RTCCOM );
  GATE_MRD_I_1:   INV port map ( I0=>RWPIN, 
            O=>MRDCOM );
  GATE_T_0_I_1:   AND2 port map ( O=>T_0, 
            I1=>CLKPIN, 
            I0=>GATE_T_0_A );
  GATE_T_0_I_2:   INV port map ( O=>GATE_T_0_A, 
            I0=>RWPIN );
  GATE_RAMSEL_I_1:   OR2 port map ( O=>RAMSELCOM, 
            I1=>T_5, 
            I0=>A15PIN );
  GATE_ROMSEL_I_1:   INV port map ( I0=>A15PIN, 
            O=>ROMSELCOM );
  GATE_T_1_I_1:   AND4 port map ( O=>T_1, 
            I3=>T_17, 
            I2=>T_18, 
            I1=>T_19, 
            I0=>T_20 );
  GATE_T_2_I_1:   AND4 port map ( O=>T_2, 
            I3=>T_14, 
            I2=>T_15, 
            I1=>T_16, 
            I0=>A6PIN );
  GATE_T_3_I_1:   AND4 port map ( O=>T_3, 
            I3=>T_10, 
            I2=>T_11, 
            I1=>T_12, 
            I0=>T_13 );
  GATE_T_4_I_1:   AND4 port map ( O=>T_4, 
            I3=>T_6, 
            I2=>T_7, 
            I1=>T_8, 
            I0=>T_9 );
  GATE_MWR_I_1:   INV port map ( I0=>T_0, 
            O=>MWRCOM );
  GATE_ACIA_I_1:   INV port map ( I0=>T_1, 
            O=>ACIACOM );
  GATE_IO1_I_1:   INV port map ( I0=>T_2, 
            O=>IO1COM );
  GATE_IO2_I_1:   INV port map ( I0=>T_3, 
            O=>IO2COM );
  GATE_RTC_I_1:   INV port map ( I0=>T_4, 
            O=>RTCCOM );
  GATE_T_5_I_1:   AND4 port map ( O=>T_5, 
            I3=>T_21, 
            I2=>T_22, 
            I1=>T_23, 
            I0=>A8PIN );
  GATE_T_6_I_1:   NOR2 port map ( O=>T_6, 
            I1=>A5PIN, 
            I0=>A6PIN );
  GATE_T_7_I_1:   AND3 port map ( O=>T_7, 
            I2=>A8PIN, 
            I1=>A9PIN, 
            I0=>A7PIN );
  GATE_T_8_I_1:   AND3 port map ( O=>T_8, 
            I2=>A11PIN, 
            I1=>A12PIN, 
            I0=>A10PIN );
  GATE_T_9_I_1:   INV port map ( I0=>A15PIN, 
            O=>GATE_T_9_A );
  GATE_T_9_I_2:   AND3 port map ( O=>T_9, 
            I2=>A14PIN, 
            I1=>A13PIN, 
            I0=>GATE_T_9_A );
  GATE_T_10_I_1:   AND2 port map ( O=>T_10, 
            I1=>A5PIN, 
            I0=>GATE_T_10_A );
  GATE_T_10_I_2:   INV port map ( O=>GATE_T_10_A, 
            I0=>A6PIN );
  GATE_T_11_I_1:   AND3 port map ( O=>T_11, 
            I2=>A8PIN, 
            I1=>A9PIN, 
            I0=>A7PIN );
  GATE_T_12_I_1:   AND3 port map ( O=>T_12, 
            I2=>A11PIN, 
            I1=>A12PIN, 
            I0=>A10PIN );
  GATE_T_13_I_1:   INV port map ( I0=>A15PIN, 
            O=>GATE_T_13_A );
  GATE_T_13_I_2:   AND3 port map ( O=>T_13, 
            I2=>A14PIN, 
            I1=>A13PIN, 
            I0=>GATE_T_13_A );
  GATE_T_14_I_1:   AND3 port map ( O=>T_14, 
            I2=>A8PIN, 
            I1=>A9PIN, 
            I0=>A7PIN );
  GATE_T_15_I_1:   AND3 port map ( O=>T_15, 
            I2=>A11PIN, 
            I1=>A12PIN, 
            I0=>A10PIN );
  GATE_T_16_I_1:   INV port map ( I0=>A15PIN, 
            O=>GATE_T_16_A );
  GATE_T_16_I_2:   AND3 port map ( O=>T_16, 
            I2=>A14PIN, 
            I1=>A13PIN, 
            I0=>GATE_T_16_A );
  GATE_T_17_I_1:   AND2 port map ( O=>T_17, 
            I1=>A5PIN, 
            I0=>A6PIN );
  GATE_T_18_I_1:   AND3 port map ( O=>T_18, 
            I2=>A8PIN, 
            I1=>A9PIN, 
            I0=>A7PIN );
  GATE_T_19_I_1:   AND3 port map ( O=>T_19, 
            I2=>A11PIN, 
            I1=>A12PIN, 
            I0=>A10PIN );
  GATE_T_20_I_1:   INV port map ( I0=>A15PIN, 
            O=>GATE_T_20_A );
  GATE_T_20_I_2:   AND3 port map ( O=>T_20, 
            I2=>A14PIN, 
            I1=>A13PIN, 
            I0=>GATE_T_20_A );
  GATE_T_21_I_1:   AND2 port map ( O=>T_21, 
            I1=>A9PIN, 
            I0=>A10PIN );
  GATE_T_22_I_1:   AND2 port map ( O=>T_22, 
            I1=>A11PIN, 
            I0=>A12PIN );
  GATE_T_23_I_1:   AND2 port map ( O=>T_23, 
            I1=>A13PIN, 
            I0=>A14PIN );

end NetList;
