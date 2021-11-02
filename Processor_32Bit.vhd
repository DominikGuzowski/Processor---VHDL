----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2020 17:42:19
-- Design Name: 
-- Module Name: Processor_CLA - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processor_32Bit is
  Port ( Reset, Clk : in STD_LOGIC;
         F_N, F_V, F_C, F_Z : out STD_LOGIC;
         OPCODE : out STD_LOGIC_VECTOR(7 downto 0);
         PC_OUT, Reg00, Reg01, Reg02, Reg03, Reg04, Reg05, Reg06, Reg07, Reg08, Reg09, Reg10, Reg11, Reg12, Reg13, Reg14, Reg15, Reg16, Reg17, Reg18, Reg19, Reg20, Reg21, Reg22, Reg23, Reg24, Reg25, Reg26, Reg27, Reg28, Reg29, Reg30, Reg31, Reg32 : out std_logic_vector(31 downto 0)
        );
end Processor_32Bit;

architecture Behavioral of Processor_32Bit is
component DataPath_32Bit is --Done
    Port ( Control_Word : in STD_LOGIC_VECTOR(22 downto 0);
           Constant_In, Data_In: in STD_LOGIC_VECTOR (31 downto 0);
           Clk, TD, TA, TB : in STD_LOGIC;
           N, Z, V, C : out STD_LOGIC;
           Address_Out : out STD_LOGIC_VECTOR (31 downto 0);
           Data_Out : out STD_LOGIC_VECTOR (31 downto 0);
           Reg00, Reg01, Reg02, Reg03, Reg04, Reg05, Reg06, Reg07, Reg08, Reg09, Reg10, Reg11, Reg12, Reg13, Reg14, Reg15, Reg16, Reg17, Reg18, Reg19, Reg20, Reg21, Reg22, Reg23, Reg24, Reg25, Reg26, Reg27, Reg28, Reg29, Reg30, Reg31, Reg32 : out std_logic_vector(31 downto 0)
           );
end component;

component Memory2p9_32Bit is
    Port ( Address : in STD_LOGIC_VECTOR (31 downto 0);
           MW : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Data_in : in STD_LOGIC_VECTOR (31 downto 0);
           Data_out : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component ZeroFill is
    Port ( SB : in STD_LOGIC_VECTOR (4 downto 0);
           Data_out : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component FlagRegister is --Done
    Port ( C : in STD_LOGIC;
           N : in STD_LOGIC;
           V : in STD_LOGIC;
           Z : in STD_LOGIC;
           FL : in STD_LOGIC;
           Clk : in STD_LOGIC;
           ResetNZVC : in STD_LOGIC_VECTOR (3 downto 0);
           NZVC : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component FlagMultiplexer is --Done
    Port ( NZVC : in STD_LOGIC_VECTOR (3 downto 0);
           MS : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC);
end component;

component Control_Memory is
    Port (FL : out std_logic; -- 0
          RZ : out std_logic; -- 1
          RN : out std_logic; -- 2
          RC : out std_logic; -- 3
          RV : out std_logic; -- 4
          MW : out std_logic; -- 5
          MM : out std_logic; -- 6
          RW : out std_logic; -- 7
          MD : out std_logic; -- 8
          FS : out std_logic_vector(4 downto 0); -- 9 to 13
          MB : out std_logic; -- 14
          TB : out std_logic; -- 15
          TA : out std_logic; -- 16
          TD : out std_logic; -- 17
          PL : out std_logic; -- 18
          PI : out std_logic; -- 19
          IL : out std_logic; -- 20
          MC : out std_logic; -- 21
          MS : out std_logic_vector(2 downto 0); -- 22 to 24
          NA : out std_logic_vector(16 downto 0); -- 25 to 41
          IN_CAR : in std_logic_vector(16 downto 0));
end component;

component ControlAddressRegister is --Done
    Port ( Data_in : in STD_LOGIC_VECTOR (16 downto 0);
           S : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR (16 downto 0));
end component;

component ProgramCounter is --Done
    Port ( SEADD : in STD_LOGIC_VECTOR (31 downto 0);
           PL : in STD_LOGIC;
           PI : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Address : out STD_LOGIC_VECTOR (31 downto 0);
           Reset : in STD_LOGIC);
end component;

component SignExtend is --Done
    Port ( Data_in : in STD_LOGIC_VECTOR (9 downto 0);
           Data_out : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Register32Bit --Done
    Port ( InData : in STD_LOGIC_VECTOR (31 downto 0);
           Load : in STD_LOGIC;
           Clock : in STD_LOGIC;
           OutData : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Multiplexer2_32Bit is --Done
    Port ( SRC : in STD_LOGIC;
           Data_A, Data_B : in STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Multiplexer2_17Bit is
    Port ( SRC : in STD_LOGIC;
           Data_A : in STD_LOGIC_VECTOR (16 downto 0);
           Data_B : in STD_LOGIC_VECTOR (16 downto 0);
           DataOut : out STD_LOGIC_VECTOR(16 downto 0));
end component;

signal RZ, RN, RV, RC, RW, MD, MB, IL, PL, PI, TD, TA, TB, N, Z, V, C, MM, MC, MW, S, FL: std_logic;
signal SE, INS_ADR, OUT_DATA, OUT_ADR, MEM_DATA, CONST, MEM_ADR, IR_OUT: std_logic_vector(31 downto 0);
signal DRSB : std_logic_vector(9 downto 0);
signal DP_CW : std_logic_vector(22 downto 0);
signal NA, IN_CAR, C_MEM_ADR, TEMP: std_logic_vector(16 downto 0);
signal NZVC, ResetNZVC : std_logic_vector(3 downto 0);
signal MS : std_logic_vector(2 downto 0);
signal DR, SA, SB, FS: std_logic_vector(4 downto 0);

begin
PC_OUT <= INS_ADR;
DRSB(4 downto 0) <= SB;
DRSB(9 downto 5) <= DR;
OPCODE <= IR_OUT(22 downto 15);
DR <= IR_OUT(14 downto 10);
SA <= IR_OUT(9 downto 5);
SB <= IR_OUT(4 downto 0);

DP_CW(0) <= RW;
DP_CW(1) <= MD;
DP_CW(6 downto 2) <= FS;
DP_CW(7) <= MB;
DP_CW(12 downto 8) <= SB;
DP_CW(17 downto 13) <= SA;
DP_CW(22 downto 18) <= DR;

F_N <= NZVC(3);
F_Z <= NZVC(2);
F_V <= NZVC(1);
F_C <= NZVC(0);

ResetNZVC(0) <= RC;
ResetNZVC(1) <= RV;
ResetNZVC(2) <= RZ;
ResetNZVC(3) <= RN;

SnE: SignExtend Port Map(Data_in => DRSB, Data_out => SE);

PC: ProgramCounter Port Map(SEADD => SE, PL => PL, PI => PI, Clk => Clk, Address => INS_ADR, Reset => Reset);

DP: DataPath_32Bit Port Map(Control_Word => DP_CW, Constant_in => CONST, 
                            Data_in => MEM_DATA, Clk => Clk, TD => TD, 
                            TA => TA, TB => TB, N => N, Z => Z, V => V, 
                            C => C, Address_out => OUT_ADR, Data_out => OUT_DATA,
                            Reg00 => Reg00, Reg01 => Reg01, Reg02 => Reg02, Reg03 => Reg03, Reg04 => Reg04, Reg05 => Reg05, Reg06 => Reg06, Reg07 => Reg07, Reg08 => Reg08, Reg09 => Reg09, Reg10 => Reg10, Reg11 => Reg11, Reg12 => Reg12, Reg13 => Reg13, Reg14 => Reg14, Reg15 => Reg15, Reg16 => Reg16, Reg17 => Reg17, Reg18 => Reg18, Reg19 => Reg19, Reg20 => Reg20, Reg21 => Reg21, Reg22 => Reg22, Reg23 => Reg23, Reg24 => Reg24, Reg25 => Reg25, Reg26 => Reg26, Reg27 => Reg27, Reg28 => Reg28, Reg29 => Reg29, Reg30 => Reg30, Reg31 => Reg31, Reg32 => Reg32); 

                            
MUX_M: Multiplexer2_32Bit Port Map(SRC => MM, Data_A => OUT_ADR, Data_B => INS_ADR, DataOut => MEM_ADR);

IR: Register32Bit Port Map(InData => MEM_DATA, Load => IL, Clock => Clk, OutData => IR_OUT);

MUX_C: Multiplexer2_17Bit Port Map(SRC => MC, Data_A => NA, Data_B => IR_OUT(31 downto 15), DataOut => IN_CAR);

CAR: ControlAddressRegister Port Map(Data_in => IN_CAR, S => S, Clk => Clk, Reset => Reset, Data_Out => C_MEM_ADR);

FREG: FlagRegister Port Map(N => N, Z => Z, V => V, C => C, FL => FL, Clk => Clk, NZVC => NZVC, ResetNZVC => ResetNZVC);

MUX_S: FlagMultiplexer Port Map(NZVC => NZVC, MS => MS, S => S);

ZF: ZeroFill Port Map(SB => SB, Data_out => CONST);

MEM: Memory2p9_32Bit Port Map(Address => MEM_ADR, MW => MW, Clk => Clk, Data_in => OUT_DATA, Data_out => MEM_DATA);

C_MEM: Control_Memory Port Map(FL => FL, RZ => RZ, RN => RN, RC => RC,
                               RV => RV, MW => MW, MM => MM, RW => RW,
                               MD => MD, FS => FS, MB => MB, TB => TB,
                               TA => TA, TD => TD, PL => PL, PI => PI,
                               IL => IL, MC => MC, MS => MS, NA => NA,
                               IN_CAR => C_MEM_ADR);
end Behavioral;
