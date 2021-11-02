----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2020 13:44:55
-- Design Name: 
-- Module Name: Control_Memory - Behavioral
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

entity Control_Memory is
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
end Control_Memory;

architecture Behavioral of Control_Memory is
type Mem_Array is array(0 to 255) of std_logic_vector(41 downto 0);
begin
    process(IN_CAR)
        variable Control_Mem : Mem_Array:=(
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL  --INITIALIZATION
 "000000000000001110010000000000000000011110", --0  0x00 This is always called at the beginning. Reset flags and call INIT_0 to initialize REG 00 - 31
 "000000000000000000011110100100000011000000", --1  0x01 INIT_1: Place 0 into R32
 "000000000000000100010000000000000000000000", --2  0x02 END OF PROGRAM
 "000000000000000000000001000000000001000000", --3  0x03 Add offset to PC                    
 "000000000000000000000110000000000001000000", --4  0x04 Load new instruction and advance PC 
 "000000000000000000011110000000000001000000", --5  0x05 ContinueProgram                     
 "000000000000000000000000000000000000000000", --6  0x06
 "000000000000000000011110000110000011000000", --7  0x07 INIT_0: Place 0 into R[0-31]
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL             
 "000000000000000000000000000000000000000000", --8  0x08 INSTRUCTION: WAIT ------------------------+ Waits 1 clock cycle without advancing PC.
 "000000000000000000011110000000000001000000", --9  0x09 ContinueProgram --------------------------+
 "000000000000000000011110000001000011000001", --10 0x0A INSTRUCTION: AND R[DR] <= R[SA], R[SB]
 "000000000000000000011110000001010011000001", --11 0x0B INSTRUCTION: OR  R[DR] <= R[SA], R[SB]
 "000000000000000000011110000001100011000001", --12 0x0C INSTRUCTION: XOR R[DR] <= R[SA], R[SB]
 "000000000000000000011110000001110011000001", --13 0x0D INSTRUCTION: NOT R[DR] <= R[SA]
 "000000000000000000011110000110000011000000", --14 0x0E INSTRUCTION: MVI R[DR] <= #(0->31)[SB]
 "000000000000000000011110000010000011000000", --15 0x0F INSTRUCTION: MOV R[DR] <= R[SB]
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000011110000000010011000001", --16 0x10 INSTRUCTION: ADD R[DR] <= R[SA], R[SB]
 "000000000000000000011110000100010011000001", --17 0x11 INSTRUCTION: ADI R[DR] <= R[SA], #(0->31)[SB]
 "000000000000000000011110000000001011000001", --18 0x12 INSTRUCTION: INC R[DR] <= R[SA]
 "000000000000000000011110000000011011000001", --19 0x13 INSTRUCTION: ADC R[DR] <= R[SA], R[SB]
 "000000000000000000011110000000100011000001", --20 0x14 INSTRUCTION: AOC R[SB] <= R[SA], R[SB] (Add with 1's Compliment of R[SB])
 "000000000000000000011110000000101011000001", --21 0x15 INSTRUCTION: SUB R[DR] <= R[SA], R[SB]
 "000000000000000000011110000100101011000001", --22 0x16 INSTRUCTION: SBI R[DR] <= R[SA], #(0->31)[SB]
 "000000000000000000011110000000110011000001", --23 0x17 INSTRUCTION: DEC R[DR] <= R[SA]
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000110000000", --24 0x18 INSTRUCTION: LDR R[DR] <= [R[SA]] ---------------------+
 "000000000000000000011110000000000001000000", --25 0x19 ContinueProgram ---------------------------------------+
 "000000000000000000011110000011000011000000", --26 0x1A INSTRUCTION: LSL R[DR] <= R[SB]
 "000000000000000000011110000010100011000000", --27 0x1B INSTRUCTION: LSR R[DR] <= R[SB]
 "000000000000000000000000000000000000100000", --28 0x1C INSTRUCTION: STR R[SB] => [R[SA]] ---------------------+
 "000000000000000000011110000000000001000000", --29 0x1D ContinueProgram ---------------------------------------+
 "000000000000000000000000000000000000000000", --30 0x1E
 "000000000000000000000000000000000000000000", --31 0x1F
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000110100110000011000001", --32 0x20 INSTRUCTION: SRM R[DR] <= R[SB], #(0-31) <DR == SB> ---+ Shift Right Multiple
 "000000000000000000000000110000110010000001", --33 0x21 DEC R32 <= R32  if(R32 - 1 < 0)                        | USE: 
 "000000000001001111010000000000000000000000", --34 0x22 BN gtfo           break;  (Branch if N flag)           | MEM n:    "---------" & IN_SRM & "-----" & "-----" & "-----" (Fetch)
 "000000000000000000000000110000001010000000", --35 0x23 INC R32 <= R32                                         | MEM n+1:  "---------" & x"--" & "-----" & "-----" & "N----"  (Set N)
 "000000000000000000000000110000110010000001", --36 0x24 DEC R32 <= R32     <-continueShifting                  | MEM n+2:  "---------" & x"NA" & "DR---" & "-----" & "SB---"  (Choose Register)
 "000000000000000000000000000010100010000000", --37 0x25 LSR R[DR] <= R[SB]                                     | NA = Next Opcode
 "000000000001001001110000000000000000000000", --38 0x26 BNZ continueShifting   (Branch if not Z flag)          | N = Number of bits to shift by
 "000000000000000000011110000000000001000000", --39 0x27 ContinueProgram <-gtfo --------------------------------+ DR/SB = Register which to shift
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000110100110000011000001", --40 0x28 INSTRUCTION: SLM R[DR] <= R[SB], #(0-31) <DR == SB> ---+ Shift Left Multiple
 "000000000000000000000000110000110010000001", --41 0x29 DEC R32 <= R32  if(R32 - 1 < 0)                        | USE:                                                       
 "000000000001011111010000000000000000000000", --42 0x2A BN gtfo           break;  (Branch if N flag)           | MEM n:    "---------" & IN_SLM & "-----" & "-----" & "-----" (Fetch)
 "000000000000000000000000110000001010000000", --43 0x2B INC R32 <= R32                                         | MEM n+1:  "---------" & x"--" & "-----" & "-----" & "N----"  (Set N)
 "000000000000000000000000110000110010000001", --44 0x2C DEC R32 <= R32     <-continueShifting                  | MEM n+2:  "---------" & x"NA" & "DR---" & "-----" & "SB---"  (Choose Register)
 "000000000000000000000000000011000010000000", --45 0x2D LSL R[DR] <= R[SB]                                     | NA = Next Opcode                                           
 "000000000001011001110000000000000000000000", --46 0x2E BNZ continueShifting   (Branch if not Z flag)          | N = Number of bits to shift by                             
 "000000000000000000011110000000000001000000", --47 0x2F ContinueProgram <-gtfo --------------------------------+ DR/SB = Register which to shift                            
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000001000000000001000000", --48 0x30 INSTRUCTION: B   #Offset[SB] --------------------------+
 "000000000000000000000110000000000001000000", --49 0x31 Load new instruction and advance PC                    | 
 "000000000000000000011110000000000001000000", --50 0x32 ContinueProgram ---------------------------------------+
 "000000000000000111010000000000000000000000", --51 0x33 INSTRUCTION: BN  #Offset[SB] --------------------------+\
 "000000000000000000011110000000000001000000", --52 0x34 ContinueProgram ---------------------------------------+/
 "000000000000000111000000000000000000000000", --53 0x35 INSTRUCTION: BZ  #Offset[SB] --------------------------+\
 "000000000000000000011110000000000001000000", --54 0x36 ContinueProgram ---------------------------------------+/
 "000000000000000110110000000000000000000000", --55 0x37 INSTRUCTION: BV  #Offset[SB] --------------------------+
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF                                                                    |
--|       A       ||S|CLILDABB| S |DWMWVCNZL                                                                    |
 "000000000000000000011110000000000001000000", --56 0x38 ContinueProgram ---------------------------------------+
 "000000000000000110100000000000000000000000", --57 0x39 INSTRUCTION: BC  #Offset[SB] --------------------------+\
 "000000000000000000011110000000000001000000", --58 0x3A ContinueProgram ---------------------------------------+/
 "000000000000000111110000000000000000000000", --59 0x3B INSTRUCTION: BNZ #Offset[SB] --------------------------+\
 "000000000000000000011110000000000001000000", --60 0x3C ContinueProgram ---------------------------------------+/
 "000000000000000111100000000000000000000000", --61 0x3D INSTRUCTION: BNC #Offset[SB] --------------------------+\
 "000000000000000000011110000000000001000000", --62 0x3E ContinueProgram ---------------------------------------+/
 "000000000000000000000000000000000000000000", --63 0x3F
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000011110100000101001000001", --64 0x40 INSTRUCTION: CMP R[SA], R[SB]
 "000000000000000000011110100100101001000001", --65 0x41 INSTRUCTION: CMP R[SA], #(0-31)[SB]
 "000000000000000111000000000000000000000000", --66 0x42 INSTRUCTION: BEQ #Offset[SB] (EQUAL)
 "000000000000000000011110000000000001000000", --67 0x43 ---x---
 "000000000000000111110000000000000000000000", --68 0x44 INSTRUCTION: BNE #Offset[SB] (NOT EQUAL)
 "000000000000000000011110000000000001000000", --69 0x45 ---x---
 "000000000000000110100000000000000000000000", --70 0x46 INSTRUCTION: BHS #Offset[SB] (HIGHER/SAME UNSIGNED)
 "000000000000000000011110000000000001000000", --71 0x47 ---x---
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000111100000000000000000000000", --72 0x48 INSTRUCTION: BLO #Offset[SB] (LOWER UNSIGNED)
 "000000000000000000011110000000000001000000", --73 0x49 ---x---
 "000000000000001011010000000000000000000000", --74 0x4A INSTRUCTION: BPL #Offset[SB] (POSITIVE or ZERO)
 "000000000000000110010000000000000000000000", --75 0x4B ---x--- 
 "000000000000000111010000000000000000000000", --76 0x4C INSTRUCTION: BMI #Offset[SB] (NEGATIVE)
 "000000000000000000011110000000000001000000", --77 0x4D ---x---
 "000000000000001011100000000000000000000000", --78 0x4E INSTRUCTION: BHI #Offset[SB] (HIGHER UNSIGNED)
 "000000000000000111110000000000000000000000", --79 0x4F ---x---
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000011110000000000001000000", --80 0x50 ---x---
 "000000000000001010100000000000000000000000", --81 0x51 INSTRUCTION: BLS #Offset[SB] (LOWER/SAME UNSIGNED)
 "000000000000000111000000000000000000000000", --82 0x52 ---x---
 "000000000000000000011110000000000001000000", --83 0x53 ---x---
 "000000000010101111010000000000000000000000", --84 0x54 INSTRUCTION: BGE #Offset[SB] (GREATER/EQUAL SIGNED)
 "000000000000001010110000000000000000000000", --85 0x55 ---x---
 "000000000000000110010000000000000000000000", --86 0x56 ---x---
 "000000000000000110110000000000000000000000", --87 0x57 ---x---
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000011110000000000001000000", --88 0x58 ---x---
 "000000000010111001010000000000000000000000", --89 0x59 INSTRUCTION: BLT #Offset[SB] (LESS SIGNED)
 "000000000000000110110000000000000000000000", --90 0x5A ---x---
 "000000000000000000011110000000000001000000", --91 0x5B ---x---
 "000000000000001010110000000000000000000000", --92 0x5C ---x---
 "000000000000000110010000000000000000000000", --93 0x5D ---x---
 "000000000010101001110000000000000000000000", --94 0x5E INSTRUCTION: BGT #Offset[SB] (GREATER SIGNED)
 "000000000000000000011110000000000001000000", --95 0x5F ---x---
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000010110011000000000000000000000000", --96 0x60 INSTRUCTION: BLE #Offset[SB] (LESS/EQUAL SIGNED)
 "000000000000000000011110000000000001000000", --97 0x61 ---x---
 "000000000000000000000000000000000000000000", --98 0x62
 "000000000000000000000000000000000000000000", --99 0x63
 "000000000000000000000000000000000000000000", --100 0x64
 "000000000000000000000000000000000000000000", --101 0x65
 "000000000000000000000000000000000000000000", --102 0x66
 "000000000000000000000000000000000000000000", --103 0x67
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000100100110000011000001", --104 0x68 INSTRUCTION: MLI R[DR] <= R[SA], #(0-31)[SB]
 "000000000000000000000000110000110010000001", --105 0x69 dec R32
 "000000000011011111010000000000000000000000", --106 0x6A if N
 "000000000000000000000000110000001010000000", --107 0x6B inc R32
 "000000000000000000000100000000010011000000", --108 0x6C add rx + rx <- addagain
 "000000000000000000000000110000110010000001", --109 0x6D dec r32
 "000000000011011001110000000000000000000000", --110 0x6E if nz -> addagain
 "000000000000000000011110000000000001000000", --111 0x6F continue
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --112 0x70
 "000000000000000000000000000000000000000000", --113 0x71
 "000000000000000000000000000000000000000000", --114 0x72
 "000000000000000000000000000000000000000000", --115 0x73
 "000000000000000000000000000000000000000000", --116 0x74
 "000000000000000000000000000000000000000000", --117 0x75
 "000000000000000000000000000000000000000000", --118 0x76
 "000000000000000000000000000000000000000000", --119 0x77
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --120 0x78
 "000000000000000000000000000000000000000000", --121 0x79
 "000000000000000000000000000000000000000000", --122 0x7A
 "000000000000000000000000000000000000000000", --123 0x7B
 "000000000000000000000000000000000000000000", --124 0x7C
 "000000000000000000000000000000000000000000", --125 0x7D
 "000000000000000000000000000000000000000000", --126 0x7E
 "000000000000000000000000000000000000000000", --127 0x7F
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --128 0x80
 "000000000000000000000000000000000000000000", --129 0x81
 "000000000000000000000000000000000000000000", --130 0x82
 "000000000000000000000000000000000000000000", --131 0x83
 "000000000000000000000000000000000000000000", --132 0x84
 "000000000000000000000000000000000000000000", --133 0x85
 "000000000000000000000000000000000000000000", --134 0x86
 "000000000000000000000000000000000000000000", --135 0x87
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --136 0x88
 "000000000000000000000000000000000000000000", --137 0x89
 "000000000000000000000000000000000000000000", --138 0x8A
 "000000000000000000000000000000000000000000", --139 0x8B
 "000000000000000000000000000000000000000000", --140 0x8C
 "000000000000000000000000000000000000000000", --141 0x8D
 "000000000000000000000000000000000000000000", --142 0x8E
 "000000000000000000000000000000000000000000", --143 0x8F
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --144 0x90
 "000000000000000000000000000000000000000000", --145 0x91
 "000000000000000000000000000000000000000000", --146 0x92
 "000000000000000000000000000000000000000000", --147 0x93
 "000000000000000000000000000000000000000000", --148 0x94
 "000000000000000000000000000000000000000000", --149 0x95
 "000000000000000000000000000000000000000000", --150 0x96
 "000000000000000000000000000000000000000000", --151 0x97
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --152 0x98
 "000000000000000000000000000000000000000000", --153 0x99
 "000000000000000000000000000000000000000000", --154 0x9A
 "000000000000000000000000000000000000000000", --155 0x9B
 "000000000000000000000000000000000000000000", --156 0x9C
 "000000000000000000000000000000000000000000", --157 0x9D
 "000000000000000000000000000000000000000000", --158 0x9E
 "000000000000000000000000000000000000000000", --159 0x9F
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --160 0xA0
 "000000000000000000000000000000000000000000", --161 0xA1
 "000000000000000000000000000000000000000000", --162 0xA2
 "000000000000000000000000000000000000000000", --163 0xA3
 "000000000000000000000000000000000000000000", --164 0xA4
 "000000000000000000000000000000000000000000", --165 0xA5
 "000000000000000000000000000000000000000000", --166 0xA6
 "000000000000000000000000000000000000000000", --167 0xA7
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --168 0xA8
 "000000000000000000000000000000000000000000", --169 0xA9
 "000000000000000000000000000000000000000000", --170 0xAA
 "000000000000000000000000000000000000000000", --171 0xAB
 "000000000000000000000000000000000000000000", --172 0xAC
 "000000000000000000000000000000000000000000", --173 0xAD
 "000000000000000000000000000000000000000000", --174 0xAE
 "000000000000000000000000000000000000000000", --175 0xAF
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --176 0xB0
 "000000000000000000000000000000000000000000", --177 0xB1
 "000000000000000000000000000000000000000000", --178 0xB2
 "000000000000000000000000000000000000000000", --179 0xB3
 "000000000000000000000000000000000000000000", --180 0xB4
 "000000000000000000000000000000000000000000", --181 0xB5
 "000000000000000000000000000000000000000000", --182 0xB6
 "000000000000000000000000000000000000000000", --183 0xB7
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --184 0xB8
 "000000000000000000000000000000000000000000", --185 0xB9
 "000000000000000000000000000000000000000000", --186 0xBA
 "000000000000000000000000000000000000000000", --187 0xBB
 "000000000000000000000000000000000000000000", --188 0xBC
 "000000000000000000000000000000000000000000", --189 0xBD
 "000000000000000000000000000000000000000000", --190 0xBE
 "000000000000000000000000000000000000000000", --191 0xBF
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --192 0xC0
 "000000000000000000000000000000000000000000", --193 0xC1
 "000000000000000000000000000000000000000000", --194 0xC2
 "000000000000000000000000000000000000000000", --195 0xC3
 "000000000000000000000000000000000000000000", --196 0xC4
 "000000000000000000000000000000000000000000", --197 0xC5
 "000000000000000000000000000000000000000000", --198 0xC6
 "000000000000000000000000000000000000000000", --199 0xC7
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --200 0xC8
 "000000000000000000000000000000000000000000", --201 0xC9
 "000000000000000000000000000000000000000000", --202 0xCA
 "000000000000000000000000000000000000000000", --203 0xCB
 "000000000000000000000000000000000000000000", --204 0xCC
 "000000000000000000000000000000000000000000", --205 0xCD
 "000000000000000000000000000000000000000000", --206 0xCE
 "000000000000000000000000000000000000000000", --207 0xCF
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --208 0xD0
 "000000000000000000000000000000000000000000", --209 0xD1
 "000000000000000000000000000000000000000000", --210 0xD2
 "000000000000000000000000000000000000000000", --211 0xD3
 "000000000000000000000000000000000000000000", --212 0xD4
 "000000000000000000000000000000000000000000", --213 0xD5
 "000000000000000000000000000000000000000000", --214 0xD6
 "000000000000000000000000000000000000000000", --215 0xD7
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --216 0xD8
 "000000000000000000000000000000000000000000", --217 0xD9
 "000000000000000000000000000000000000000000", --218 0xDA
 "000000000000000000000000000000000000000000", --219 0xDB
 "000000000000000000000000000000000000000000", --220 0xDC
 "000000000000000000000000000000000000000000", --221 0xDD
 "000000000000000000000000000000000000000000", --222 0xDE
 "000000000000000000000000000000000000000000", --223 0xDF
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --224 0xE0
 "000000000000000000000000000000000000000000", --225 0xE1
 "000000000000000000000000000000000000000000", --226 0xE2
 "000000000000000000000000000000000000000000", --227 0xE3
 "000000000000000000000000000000000000000000", --228 0xE4
 "000000000000000000000000000000000000000000", --229 0xE5
 "000000000000000000000000000000000000000000", --230 0xE6
 "000000000000000000000000000000000000000000", --231 0xE7
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --232 0xE8
 "000000000000000000000000000000000000000000", --233 0xE9
 "000000000000000000000000000000000000000000", --234 0xEA
 "000000000000000000000000000000000000000000", --235 0xEB
 "000000000000000000000000000000000000000000", --236 0xEC
 "000000000000000000000000000000000000000000", --237 0xED
 "000000000000000000000000000000000000000000", --238 0xEE
 "000000000000000000000000000000000000000000", --239 0xEF
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --240 0xF0
 "000000000000000000000000000000000000000000", --241 0xF1
 "000000000000000000000000000000000000000000", --242 0xF2
 "000000000000000000000000000000000000000000", --243 0xF3
 "000000000000000000000000000000000000000000", --244 0xF4
 "000000000000000000000000000000000000000000", --245 0xF5
 "000000000000000000000000000000000000000000", --246 0xF6
 "000000000000000000000000000000000000000000", --247 0xF7
--|       N       ||M|MIPPTTTM| F |MRMMRRRRF
--|       A       ||S|CLILDABB| S |DWMWVCNZL
 "000000000000000000000000000000000000000000", --248 0xF8
 "000000000000000000000000000000000000000000", --249 0xF9
 "000000000000000000000000000000000000000000", --250 0xFA
 "000000000000000000000000000000000000000000", --251 0xFB
 "000000000000000000000000000000000000000000", --252 0xFC
 "000000000000000000000000000000000000000000", --253 0xFD
 "000000000000000000000000000000000000000000", --254 0xFE
 "000000000000000000000000000000000000000000"  --255 0xFF
    );
    variable Adr : integer;
    variable Control_Out : std_logic_vector(41 downto 0);
    begin 
        Adr := conv_integer(unsigned(IN_CAR(7 downto 0)));
        Control_Out := Control_Mem(Adr);
        FL <= Control_Out(0);
        RZ <= Control_Out(1);
        RN <= Control_Out(2);
        RC <= Control_Out(3);
        RV <= Control_Out(4);
        MW <= Control_Out(5);
        MM <= Control_Out(6);
        RW <= Control_Out(7);
        MD <= Control_Out(8);
        FS <= Control_Out(13 downto 9);
        MB <= Control_Out(14);
        TB <= Control_Out(15);
        TA <= Control_Out(16);
        TD <= Control_Out(17);
        PL <= Control_Out(18);
        PI <= Control_Out(19);
        IL <= Control_Out(20);
        MC <= Control_Out(21);
        MS <= Control_Out(24 downto 22);
        NA <= Control_Out(41 downto 25);
    end process;
end Behavioral;