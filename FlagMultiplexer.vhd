----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2020 13:36:03
-- Design Name: 
-- Module Name: FlagMultiplexer - Behavioral
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

entity FlagMultiplexer is
    Port ( NZVC : in STD_LOGIC_VECTOR (3 downto 0);
           MS : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC);
end FlagMultiplexer;

architecture Behavioral of FlagMultiplexer is
constant DELAY : Time := 5ns;
begin
with MS select
    S <= '0' after DELAY when "000",
         '1' after DELAY when "001",
         NZVC(0) after DELAY when "010",
         NZVC(1) after DELAY when "011",
         NZVC(2) after DELAY when "100",
         NZVC(3) after DELAY when "101",
         not NZVC(0) after DELAY when "110",
         not NZVC(2) after DELAY when "111",
         '0' after DELAY when others;

end Behavioral;
