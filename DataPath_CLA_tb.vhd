----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2020 17:12:34
-- Design Name: 
-- Module Name: Datapath_TB - Behavioral
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

entity Datapath_CLA_tb is
--  Port ( );
end Datapath_CLA_tb;

architecture Behavioral of Datapath_CLA_tb is
component DataPath_CLA is
    Port ( Control_Word : in STD_LOGIC_VECTOR(22 downto 0);
           Constant_In, Data_In: in STD_LOGIC_VECTOR (31 downto 0);
           Clk, TD, TA, TB : in STD_LOGIC;
           N, Z, V, C : out STD_LOGIC;
           Address_Out : out STD_LOGIC_VECTOR (31 downto 0);
           Data_Out : out STD_LOGIC_VECTOR (31 downto 0)
           ; Reg00, Reg01, Reg02, Reg03, Reg04, Reg05, Reg06, Reg07, Reg08, Reg09, Reg10, Reg11, Reg12, Reg13, Reg14, Reg15, Reg16, Reg17, Reg18, Reg19, Reg20, Reg21, Reg22, Reg23, Reg24, Reg25, Reg26, Reg27, Reg28, Reg29, Reg30, Reg31, Reg32 : out std_logic_vector(31 downto 0)                                  
           );
end component;
signal RESULT : STD_LOGIC_VECTOR(31 downto 0);
signal Const, Data_in, ADR, Data_out : std_logic_vector(31 downto 0);
signal CW : std_logic_vector(22 downto 0);
signal Clk : std_logic:= '0';
constant WAITTIME: Time:= 700ns;
signal N, Z, V, C : STD_LOGIC;
signal TD, TA, TB : std_logic;
signal 
Reg00, Reg01, Reg02, Reg03, 
Reg04, Reg05, Reg06, Reg07, 
Reg08, Reg09, Reg10, Reg11, 
Reg12, Reg13, Reg14, Reg15, 
Reg16, Reg17, Reg18, Reg19, 
Reg20, Reg21, Reg22, Reg23, 
Reg24, Reg25, Reg26, Reg27, 
Reg28, Reg29, Reg30, Reg31, Reg32 : std_logic_vector(31 downto 0);

begin
UUT: DataPath_CLA Port Map(Control_Word => CW, Constant_in => Const, Data_in => Data_in, Clk => Clk, TD => TD, TA => TA, TB => TB,
                             Address_Out => ADR, Data_Out => Data_Out, N => N, Z => Z, C => C, V => V
                             ,Reg00 => Reg00, Reg01 => Reg01, Reg02 => Reg02, Reg03 => Reg03, 
                             Reg04 => Reg04, Reg05 => Reg05, Reg06 => Reg06, Reg07 => Reg07, 
                             Reg08 => Reg08, Reg09 => Reg09, Reg10 => Reg10, Reg11 => Reg11, 
                             Reg12 => Reg12, Reg13 => Reg13, Reg14 => Reg14, Reg15 => Reg15, 
                             Reg16 => Reg16, Reg17 => Reg17, Reg18 => Reg18, Reg19 => Reg19, 
                             Reg20 => Reg20, Reg21 => Reg21, Reg22 => Reg22, Reg23 => Reg23, 
                             Reg24 => Reg24, Reg25 => Reg25, Reg26 => Reg26, Reg27 => Reg27, 
                             Reg28 => Reg28, Reg29 => Reg29, Reg30 => Reg30, Reg31 => Reg31, Reg32 => Reg32 
                             );
Clk <= not Clk after 350ns;
RESULT <= ADR;

    TEST: process begin
    TD <= '0';
    TA <= '0';
    TB <= '0';
    --Load 0xA from memory to R01
    Data_in <= x"0000000A";
    CW <= "00001000010000100000011"; --EXPECTED RESULT: 0xA
    wait for WAITTIME;
    --MOV R00, R01			R00: 0xA, R01: 0xA
    CW <= "00000000010000000000001"; --EXPECTED RESULT: 0xA
    wait for WAITTIME;
    --Load 0x6 from memory to R01	R01: 0x6
    Data_in <= x"00000006";
    CW <= "00001000010000100000011"; --EXPECTED RESULT: 0x6
    wait for WAITTIME;
    --ADD R00, R00, R01;    R00: 0xA + 0x6 = 0x10
    CW <= "00000000000000100001001"; --EXPECTED RESULT: 0x10
    wait for WAITTIME;
    --INC R00, R00;         R00: 0x10 + 0x1 = 0x11
    CW <= "00000000000000000000101"; --EXPECTED RESULT: 0x11
    wait for WAITTIME;
    --ADDC R00, R00, R01;   R00: 0x11 + 0x6 + 0x1 = 0x18
    CW <= "00000000000000100001101"; --EXPECTED RESULT: 0x18
    wait for WAITTIME;
    --ADD B1'sC R00, R00, R01; R00: 0x18 + 0xFFFFFFF9 = 0x11; C SET
    CW <= "00000000000000100010001"; --EXPECTED RESULT: 0x11
    wait for WAITTIME;
    --SUB R00, R00, R01;    R00: 0x11 - 0x6 = 0xB; C SET 
    CW <= "00000000000000100010101"; --EXPECTED RESULT: 0xB
    wait for WAITTIME;
    --DEC R00, R00;         R00: 0xB - 0x1 = 0xA;
    CW <= "00000000000000000011001"; --EXPECTED RESULT: 0xA
    wait for WAITTIME;
    --MOV R02, R00;			R00: 0xA, R02: 0xA
    CW <= "00010000000000000011101"; --EXPECTED RESULT: 0xA
    wait for WAITTIME;
    --AND R00, R00, #0x7;   R00: 0xA and 0x7 = 0x2
    Const <= x"00000007";
    CW <= "00000000000001010100001"; --EXPECTED RESULT: 0x2
    wait for WAITTIME;
    --OR R00, R00, #0x8;    R00: 0x2 or 0x8 = 0xA
    Const <= x"00000008";
    CW <= "00000000000000010101001"; --EXPECTED RESULT: 0xA
    wait for WAITTIME;
    --XOR R00, R00, R01;    R00: 0xA xor 0x6 = 0xC
    CW <= "00000000000000100110001"; --EXPECTED RESULT: 0xC
    wait for WAITTIME;
    --NOT R00, R00;         R00: not 0xC = 0xFFFFFFFF3;
    CW <= "00000000000000000111001"; --EXPECTED RESULT: 0xFFFFFFF3
    wait for WAITTIME;
    --MOV R00, R01;         R00: 0x6
    CW <= "00000000000000101000001"; --EXPECTED RESULT: 0x6
    wait for WAITTIME;
    --LSR R00, R00;         R00: 0x6 >> 1 = 0x3
    CW <= "00000000000000001010001"; --EXPECTED RESULT: 0x3
    wait for WAITTIME;
    --LSL R00, R00;         R00: 0x3 << 1 = 0x6
    CW <= "00000000000000001100001"; --EXPECTED RESULT: 0x6
    wait for WAITTIME;
    --LDR R04, #0x12344321  R04: 0x12344321
    Data_in <= x"12344321";
    CW <= "0010000100------0000011"; --EXPECTED RESULT: 0xUUUUUUUU - Value is still being loaded into Reg 4
    wait for WAITTIME;
    --MOV R12, R04          R12: 0x12344321
    CW <= "0110000100------1000001"; --EXPECTED RESULT: 0x12344321 now value visible in Reg 4
    wait for WAITTIME;
    CW <= "-----011000000000000000"; --EXPECTED RESULT: 0x12344321; just viewing value from Reg 12
    wait for WAITTIME;
    --LDR R00, #0x80000000  R00: 0x80000000
    CW <= "00000000000000000000011"; --EXPECTED RESULT: 0x80000000
    Data_in <= x"80000000";
    wait for WAITTIME;
    --ADD R00, R00, R00     R00: 0x0; C = 1, N = 0, V = 1, Z = 1
    CW <= "00000000000000000001001"; --EXPECTED RESULT: 0x0
    wait for WAITTIME;
    --Sim time: 15400ns
    TD <= '1';
    Data_in <= x"32323232";
    CW <= "00000000000000000000011";
    wait for WAITTIME;
    end process;
    end Behavioral;
