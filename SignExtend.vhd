----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2020 12:00:16
-- Design Name: 
-- Module Name: SignExtend - Behavioral
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

entity SignExtend is
    Port ( Data_in : in STD_LOGIC_VECTOR (9 downto 0);
           Data_out : out STD_LOGIC_VECTOR (31 downto 0));
end SignExtend;

architecture Behavioral of SignExtend is

begin
Data_out(9 downto 0) <= Data_in;
Data_out(10) <= Data_in(9);
Data_out(11) <= Data_in(9);
Data_out(12) <= Data_in(9);
Data_out(13) <= Data_in(9);
Data_out(14) <= Data_in(9);
Data_out(15) <= Data_in(9);
Data_out(16) <= Data_in(9);
Data_out(17) <= Data_in(9);
Data_out(18) <= Data_in(9);
Data_out(19) <= Data_in(9);
Data_out(20) <= Data_in(9);
Data_out(21) <= Data_in(9);
Data_out(22) <= Data_in(9);
Data_out(23) <= Data_in(9);
Data_out(24) <= Data_in(9);
Data_out(25) <= Data_in(9);
Data_out(26) <= Data_in(9);
Data_out(27) <= Data_in(9);
Data_out(28) <= Data_in(9);
Data_out(29) <= Data_in(9);
Data_out(30) <= Data_in(9);
Data_out(31) <= Data_in(9);
end Behavioral;
