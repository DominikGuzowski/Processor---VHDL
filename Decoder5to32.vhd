----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2020 18:03:35
-- Design Name: 
-- Module Name: Decoder5to32 - Behavioral
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

entity Decoder5to32 is
    Port ( DestAdr : in std_logic_vector(4 downto 0);
           TD : in STD_LOGIC;
           DestEnable : out std_logic_vector(32 downto 0));
end Decoder5to32;

architecture Behavioral of Decoder5to32 is
constant DELAY: Time:= 5ns;
constant TD_Enable : std_logic_vector(32 downto 0) := "100000000000000000000000000000000"; 
signal Dest_Enable : std_logic_vector(32 downto 0);
begin                         

with TD & DestAdr select
DestEnable <= "000000000000000000000000000000001" after DELAY when "000000",
               "000000000000000000000000000000010" after DELAY when "000001",
               "000000000000000000000000000000100" after DELAY when "000010",
               "000000000000000000000000000001000" after DELAY when "000011",
               "000000000000000000000000000010000" after DELAY when "000100",
               "000000000000000000000000000100000" after DELAY when "000101",
               "000000000000000000000000001000000" after DELAY when "000110",
               "000000000000000000000000010000000" after DELAY when "000111",
               "000000000000000000000000100000000" after DELAY when "001000",
               "000000000000000000000001000000000" after DELAY when "001001",
               "000000000000000000000010000000000" after DELAY when "001010",
               "000000000000000000000100000000000" after DELAY when "001011",
               "000000000000000000001000000000000" after DELAY when "001100",
               "000000000000000000010000000000000" after DELAY when "001101",
               "000000000000000000100000000000000" after DELAY when "001110",
               "000000000000000001000000000000000" after DELAY when "001111",
               "000000000000000010000000000000000" after DELAY when "010000",
               "000000000000000100000000000000000" after DELAY when "010001",
               "000000000000001000000000000000000" after DELAY when "010010",
               "000000000000010000000000000000000" after DELAY when "010011",
               "000000000000100000000000000000000" after DELAY when "010100",
               "000000000001000000000000000000000" after DELAY when "010101",
               "000000000010000000000000000000000" after DELAY when "010110",
               "000000000100000000000000000000000" after DELAY when "010111",
               "000000001000000000000000000000000" after DELAY when "011000",
               "000000010000000000000000000000000" after DELAY when "011001",
               "000000100000000000000000000000000" after DELAY when "011010",
               "000001000000000000000000000000000" after DELAY when "011011",
               "000010000000000000000000000000000" after DELAY when "011100",
               "000100000000000000000000000000000" after DELAY when "011101",
               "001000000000000000000000000000000" after DELAY when "011110",
               "010000000000000000000000000000000" after DELAY when "011111",
               "100000000000000000000000000000000" after DELAY when "1-----",
               "000000000000000000000000000000000" after DELAY when others;
                        
--with TD select
--DestEnable <= TD_Enable after DELAY when '1',
--              Dest_Enable after DELAY when others;
end Behavioral;
