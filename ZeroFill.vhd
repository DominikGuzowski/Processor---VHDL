----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2020 10:23:25
-- Design Name: 
-- Module Name: ZeroFill - Behavioral
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

entity ZeroFill is
    Port ( SB : in STD_LOGIC_VECTOR (4 downto 0);
           Data_out : out STD_LOGIC_VECTOR (31 downto 0));
end ZeroFill;

architecture Behavioral of ZeroFill is

begin
    Data_Out <= "000000000000000000000000000" & SB;
end Behavioral;
