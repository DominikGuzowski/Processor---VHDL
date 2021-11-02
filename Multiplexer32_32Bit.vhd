----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.10.2020 12:16:23
-- Design Name: 
-- Module Name: Multiplexer32_32Bit - Behavioral
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

entity Multiplexer32_32Bit is
    Port ( R00, R01, R02, R03, R04, R05, R06, R07, R08, R09, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22, R23, R24, R25, R26, MAR, MDR, PCR, INR, ACR : in STD_LOGIC_VECTOR (31 downto 0);
           SRC : in STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end Multiplexer32_32Bit;

architecture Behavioral of Multiplexer32_32Bit is
constant DELAY: time:= 5ns;
begin
with SRC select
DataOut <= R00 after DELAY when "00000",
           R01 after DELAY when "00001",
           R02 after DELAY when "00010",
           R03 after DELAY when "00011",
           R04 after DELAY when "00100",
           R05 after DELAY when "00101",
           R06 after DELAY when "00110",
           R07 after DELAY when "00111",
           R08 after DELAY when "01000",
           R09 after DELAY when "01001",
           R10 after DELAY when "01010",
           R11 after DELAY when "01011",
           R12 after DELAY when "01100",
           R13 after DELAY when "01101",
           R14 after DELAY when "01110",
           R15 after DELAY when "01111",
           R16 after DELAY when "10000",
           R17 after DELAY when "10001",
           R18 after DELAY when "10010",
           R19 after DELAY when "10011",
           R20 after DELAY when "10100",
           R21 after DELAY when "10101",
           R22 after DELAY when "10110",
           R23 after DELAY when "10111",
           R24 after DELAY when "11000",
           R25 after DELAY when "11001",
           R26 after DELAY when "11010",
           MAR after DELAY when "11011",
           MDR after DELAY when "11100",
           PCR after DELAY when "11101",
           INR after DELAY when "11110",
           ACR after DELAY when "11111",
           x"00000000" when others;
end Behavioral;
