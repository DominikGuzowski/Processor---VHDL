----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2020 14:17:09
-- Design Name: 
-- Module Name: Shifter_32Bit - Behavioral
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

entity Shifter_32Bit is
    Port ( Value : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC_vector(1 downto 0);
           Result : out STD_LOGIC_VECTOR (31 downto 0));
end Shifter_32Bit;

architecture Behavioral of Shifter_32Bit is
constant DELAY: Time := 5ns;
begin

with Sel select
Result <= '0' & Value(31 downto 1) after DELAY when "01",
          Value(30 downto 0) & '0' after DELAY when "10",
          Value after DELAY when others;
          
end Behavioral;
