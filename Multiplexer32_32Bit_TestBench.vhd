----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.10.2020 18:11:06
-- Design Name: 
-- Module Name: Multiplexer32_32Bit_TestBench - Behavioral
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

entity Multiplexer32_32Bit_TestBench is
--  Port ( );
end Multiplexer32_32Bit_TestBench;

architecture Behavioral of Multiplexer32_32Bit_TestBench is
component Multiplexer32_32Bit
Port ( R00, R01, R02, R03, R04, R05, R06, R07, R08, R09, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22, R23, R24, R25, R26, MAR, MDR, PCR, INR, ACR : in STD_LOGIC_VECTOR (31 downto 0);
           SRC : in STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end component;
signal reg0_output, reg1_output, reg2_output, reg3_output, 
       reg4_output, reg5_output, reg6_output, reg7_output, 
       reg8_output, reg9_output, reg10_output, reg11_output, 
       reg12_output, reg13_output, reg14_output, reg15_output, 
       reg16_output, reg17_output, reg18_output, reg19_output, 
       reg20_output, reg21_output, reg22_output, reg23_output, 
       reg24_output, reg25_output, reg26_output, reg27_output, 
       reg28_output, reg29_output, reg30_output, reg31_output : std_logic_vector(31 downto 0);
signal SRC : std_logic_vector(4 downto 0);
signal DataOut : std_logic_vector(31 downto 0);
begin
reg0_output  <= x"ABCDEF00";
reg1_output  <= x"ABCDEF01";
reg2_output  <= x"ABCDEF02";
reg3_output  <= x"ABCDEF03";
reg4_output  <= x"ABCDEF04";
reg5_output  <= x"ABCDEF05";
reg6_output  <= x"ABCDEF06";
reg7_output  <= x"ABCDEF07";
reg8_output  <= x"ABCDEF08";
reg9_output  <= x"ABCDEF09";
reg10_output <= x"ABCDEF10";
reg11_output <= x"ABCDEF11";
reg12_output <= x"ABCDEF12";
reg13_output <= x"ABCDEF13";
reg14_output <= x"ABCDEF14";
reg15_output <= x"ABCDEF15";
reg16_output <= x"ABCDEF16";
reg17_output <= x"ABCDEF17";
reg18_output <= x"ABCDEF18";
reg19_output <= x"ABCDEF19";
reg20_output <= x"ABCDEF20";
reg21_output <= x"ABCDEF21";
reg22_output <= x"ABCDEF22";
reg23_output <= x"ABCDEF23";
reg24_output <= x"ABCDEF24";
reg25_output <= x"ABCDEF25";
reg26_output <= x"ABCDEF26";
reg27_output <= x"ABCDEF27";
reg28_output <= x"ABCDEF28";
reg29_output <= x"ABCDEF29";
reg30_output <= x"ABCDEF30";
reg31_output <= x"ABCDEF31";
UUT: Multiplexer32_32Bit Port Map(R00 => reg0_output, R01 => reg1_output, R02 => reg2_output, R03 => reg3_output, 
                                  R04 => reg4_output, R05 => reg5_output, R06 => reg6_output, R07 => reg7_output, 
                                  R08 => reg8_output, R09 => reg9_output, R10 => reg10_output, R11 => reg11_output, 
                                  R12 => reg12_output, R13 => reg13_output, R14 => reg14_output, R15 => reg15_output, 
                                  R16 => reg16_output, R17 => reg17_output, R18 => reg18_output, R19 => reg19_output, 
                                  R20 => reg20_output, R21 => reg21_output, R22 => reg22_output, R23 => reg23_output, 
                                  R24 => reg24_output, R25 => reg25_output, R26 => reg26_output, MAR => reg27_output, 
                                  MDR => reg28_output, PCR => reg29_output, INR => reg30_output, ACR => reg31_output,
                                  SRC => SRC, DataOut => DataOut);
                                  
    Multiplexer_Sim : process begin
        SRC <= "00000";
        wait for 10ns;

        SRC <= "00001";
        wait for 10ns;

        SRC <= "00010";
        wait for 10ns;

        SRC <= "00011";
        wait for 10ns;

        SRC <= "00100";
        wait for 10ns;

        SRC <= "00101";
        wait for 10ns;

        SRC <= "00110";
        wait for 10ns;

        SRC <= "00111";
        wait for 10ns;

        SRC <= "01000";
        wait for 10ns;

        SRC <= "01001";
        wait for 10ns;

        SRC <= "01010";
        wait for 10ns;

        SRC <= "01011";
        wait for 10ns;

        SRC <= "01100";
        wait for 10ns;

        SRC <= "01101";
        wait for 10ns;

        SRC <= "01110";
        wait for 10ns;

        SRC <= "01111";
        wait for 10ns;

        SRC <= "10000";
        wait for 10ns;

        SRC <= "10001";
        wait for 10ns;

        SRC <= "10010";
        wait for 10ns;

        SRC <= "10011";
        wait for 10ns;

        SRC <= "10100";
        wait for 10ns;

        SRC <= "10101";
        wait for 10ns;

        SRC <= "10110";
        wait for 10ns;

        SRC <= "10111";
        wait for 10ns;

        SRC <= "11000";
        wait for 10ns;

        SRC <= "11001";
        wait for 10ns;

        SRC <= "11010";
        wait for 10ns;

        SRC <= "11011";
        wait for 10ns;

        SRC <= "11100";
        wait for 10ns;

        SRC <= "11101";
        wait for 10ns;

        SRC <= "11110";
        wait for 10ns;

        SRC <= "11111";
        wait for 10ns;

        wait for 10ns;
    end process;
end Behavioral; 