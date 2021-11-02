----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.10.2020 13:06:48
-- Design Name: 
-- Module Name: RegisterFile32Bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile32Bit is
    Port (Clk, Write, TD, TA, TB: in STD_LOGIC;
           DestAddress, MuxSourceA, MuxSourceB: in STD_LOGIC_VECTOR (4 downto 0);
           InDataFlow : in STD_LOGIC_VECTOR (31 downto 0);
           DataOut_A, DataOut_B : out std_logic_vector(31 downto 0);
           Reg00, Reg01, Reg02, Reg03, Reg04, Reg05, Reg06, Reg07, Reg08, Reg09, Reg10, Reg11, Reg12, Reg13, Reg14, Reg15, Reg16, Reg17, Reg18, Reg19, Reg20, Reg21, Reg22, Reg23, Reg24, Reg25, Reg26, Reg27, Reg28, Reg29, Reg30, Reg31, Reg32 : out std_logic_vector(31 downto 0)
           );
end RegisterFile32Bit;

architecture Behavioral of RegisterFile32Bit is
component Decoder5to32
 Port ( DestAdr : in std_logic_vector(4 downto 0);
        TD : in STD_LOGIC;
        DestEnable : out std_logic_vector(32 downto 0));
end component;

component Register32Bit
    Port ( InData : in STD_LOGIC_VECTOR (31 downto 0);
           Load : in STD_LOGIC;
           Clock : in STD_LOGIC;
           OutData : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Multiplexer32_32Bit
 Port ( R00, R01, R02, R03,
        R04, R05, R06, R07, 
        R08, R09, R10, R11, 
        R12, R13, R14, R15, 
        R16, R17, R18, R19, 
        R20, R21, R22, R23, 
        R24, R25, R26, R27, 
        R28, R29, R30, R31 : in STD_LOGIC_VECTOR (31 downto 0);
        SRC : in STD_LOGIC_VECTOR (4 downto 0);
        DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Multiplexer2_32Bit is
    Port ( SRC : in STD_LOGIC;
           Data_A, Data_B : in STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end component;
signal RegOut00, RegOut01, RegOut02, RegOut03,
       RegOut04, RegOut05, RegOut06, RegOut07,
       RegOut08, RegOut09, RegOut10, RegOut11,
       RegOut12, RegOut13, RegOut14, RegOut15,
       RegOut16, RegOut17, RegOut18, RegOut19,
       RegOut20, RegOut21, RegOut22, RegOut23,
       RegOut24, RegOut25, RegOut26, RegOut27,
       RegOut28, RegOut29, RegOut30, RegOut31, RegOutACC : std_logic_vector(31 downto 0);
signal DataA, DataB : std_logic_vector(31 downto 0);
signal RegSelect, RegEnable : std_logic_vector(32 downto 0);
--signal MuxASignal, MuxBSignal : std_logic_vector(31 downto 0);
begin
--RegEnable <= RegSelect and (RegSelect'range => Write);

RegEnable(0) <= RegSelect(0) and Write;
RegEnable(1) <= RegSelect(1) and Write;
RegEnable(2) <= RegSelect(2) and Write;
RegEnable(3) <= RegSelect(3) and Write;
RegEnable(4) <= RegSelect(4) and Write;
RegEnable(5) <= RegSelect(5) and Write;
RegEnable(6) <= RegSelect(6) and Write;
RegEnable(7) <= RegSelect(7) and Write;
RegEnable(8) <= RegSelect(8) and Write;
RegEnable(9) <= RegSelect(9) and Write;
RegEnable(10) <= RegSelect(10) and Write;
RegEnable(11) <= RegSelect(11) and Write;
RegEnable(12) <= RegSelect(12) and Write;
RegEnable(13) <= RegSelect(13) and Write;
RegEnable(14) <= RegSelect(14) and Write;
RegEnable(15) <= RegSelect(15) and Write;
RegEnable(16) <= RegSelect(16) and Write;
RegEnable(17) <= RegSelect(17) and Write;
RegEnable(18) <= RegSelect(18) and Write;
RegEnable(19) <= RegSelect(19) and Write;
RegEnable(20) <= RegSelect(20) and Write;
RegEnable(21) <= RegSelect(21) and Write;
RegEnable(22) <= RegSelect(22) and Write;
RegEnable(23) <= RegSelect(23) and Write;
RegEnable(24) <= RegSelect(24) and Write;
RegEnable(25) <= RegSelect(25) and Write;
RegEnable(26) <= RegSelect(26) and Write;
RegEnable(27) <= RegSelect(27) and Write;
RegEnable(28) <= RegSelect(28) and Write;
RegEnable(29) <= RegSelect(29) and Write;
RegEnable(30) <= RegSelect(30) and Write;
RegEnable(31) <= RegSelect(31) and Write;
RegEnable(32) <= RegSelect(32) and Write;

DECODER: Decoder5to32 Port Map(DestAdr => DestAddress, TD => TD, DestEnable => RegSelect);

MUX_A: Multiplexer32_32Bit Port Map(R00 => RegOut00, R01 => RegOut01, R02 => RegOut02, R03 => RegOut03,
                                       R04 => RegOut04, R05 => RegOut05, R06 => RegOut06, R07 => RegOut07,
                                       R08 => RegOut08, R09 => RegOut09, R10 => RegOut10, R11 => RegOut11,
                                       R12 => RegOut12, R13 => RegOut13, R14 => RegOut14, R15 => RegOut15,
                                       R16 => RegOut16, R17 => RegOut17, R18 => RegOut18, R19 => RegOut19,
                                       R20 => RegOut20, R21 => RegOut21, R22 => RegOut22, R23 => RegOut23,
                                       R24 => RegOut24, R25 => RegOut25, R26 => RegOut26, R27 => RegOut27,
                                       R28 => RegOut28, R29 => RegOut29, R30 => RegOut30, R31 => RegOut31,
                                       SRC => MuxSourceA, DataOut => DataA);
                                       
MUX_B: Multiplexer32_32Bit Port Map(R00 => RegOut00, R01 => RegOut01, R02 => RegOut02, R03 => RegOut03,
                                       R04 => RegOut04, R05 => RegOut05, R06 => RegOut06, R07 => RegOut07,
                                       R08 => RegOut08, R09 => RegOut09, R10 => RegOut10, R11 => RegOut11,
                                       R12 => RegOut12, R13 => RegOut13, R14 => RegOut14, R15 => RegOut15,
                                       R16 => RegOut16, R17 => RegOut17, R18 => RegOut18, R19 => RegOut19,
                                       R20 => RegOut20, R21 => RegOut21, R22 => RegOut22, R23 => RegOut23,
                                       R24 => RegOut24, R25 => RegOut25, R26 => RegOut26, R27 => RegOut27,
                                       R28 => RegOut28, R29 => RegOut29, R30 => RegOut30, R31 => RegOut31,
                                       SRC => MuxSourceB, DataOut => DataB);
                                       
MUX2_A: Multiplexer2_32Bit Port Map(SRC => TA, Data_A => DataA, Data_B => RegOutACC, DataOut => DataOut_A);
MUX2_B: Multiplexer2_32Bit Port Map(SRC => TB, Data_A => DataB, Data_B => RegOutACC, DataOut => DataOut_B);
                                      
REG_R00: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(0), Clock => Clk, OutData => RegOut00);
REG_R01: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(1), Clock => Clk, OutData => RegOut01);
REG_R02: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(2), Clock => Clk, OutData => RegOut02);
REG_R03: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(3), Clock => Clk, OutData => RegOut03);
REG_R04: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(4), Clock => Clk, OutData => RegOut04);
REG_R05: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(5), Clock => Clk, OutData => RegOut05);
REG_R06: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(6), Clock => Clk, OutData => RegOut06);
REG_R07: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(7), Clock => Clk, OutData => RegOut07);
REG_R08: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(8), Clock => Clk, OutData => RegOut08);
REG_R09: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(9), Clock => Clk, OutData => RegOut09);
REG_R10: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(10), Clock => Clk, OutData => RegOut10);
REG_R11: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(11), Clock => Clk, OutData => RegOut11);
REG_R12: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(12), Clock => Clk, OutData => RegOut12);
REG_R13: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(13), Clock => Clk, OutData => RegOut13);
REG_R14: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(14), Clock => Clk, OutData => RegOut14);
REG_R15: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(15), Clock => Clk, OutData => RegOut15);
REG_R16: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(16), Clock => Clk, OutData => RegOut16);
REG_R17: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(17), Clock => Clk, OutData => RegOut17);
REG_R18: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(18), Clock => Clk, OutData => RegOut18);
REG_R19: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(19), Clock => Clk, OutData => RegOut19);
REG_R20: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(20), Clock => Clk, OutData => RegOut20);
REG_R21: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(21), Clock => Clk, OutData => RegOut21);
REG_R22: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(22), Clock => Clk, OutData => RegOut22);
REG_R23: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(23), Clock => Clk, OutData => RegOut23);
REG_R24: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(24), Clock => Clk, OutData => RegOut24);
REG_R25: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(25), Clock => Clk, OutData => RegOut25);
REG_R26: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(26), Clock => Clk, OutData => RegOut26);
REG_R27: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(27), Clock => Clk, OutData => RegOut27);
REG_R28: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(28), Clock => Clk, OutData => RegOut28);
REG_R29: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(29), Clock => Clk, OutData => RegOut29);
REG_R30: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(30), Clock => Clk, OutData => RegOut30);
REG_R31: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(31), Clock => Clk, OutData => RegOut31);
REG_ACC: Register32Bit Port Map(InData => InDataFlow, Load => RegEnable(32), Clock => Clk, OutData => RegOutACC);

Reg00 <= RegOut00;
Reg01 <= RegOut01;
Reg02 <= RegOut02;
Reg03 <= RegOut03;
Reg04 <= RegOut04;
Reg05 <= RegOut05;
Reg06 <= RegOut06;
Reg07 <= RegOut07;
Reg08 <= RegOut08;
Reg09 <= RegOut09;
Reg10 <= RegOut10;
Reg11 <= RegOut11;
Reg12 <= RegOut12;
Reg13 <= RegOut13;
Reg14 <= RegOut14;
Reg15 <= RegOut15;
Reg16 <= RegOut16;
Reg17 <= RegOut17;
Reg18 <= RegOut18;
Reg19 <= RegOut19;
Reg20 <= RegOut20;
Reg21 <= RegOut21;
Reg22 <= RegOut22;
Reg23 <= RegOut23;
Reg24 <= RegOut24;
Reg25 <= RegOut25;
Reg26 <= RegOut26;
Reg27 <= RegOut27;
Reg28 <= RegOut28;
Reg29 <= RegOut29;
Reg30 <= RegOut30;
Reg31 <= RegOut31;
Reg32 <= RegOutACC;

end Behavioral;
