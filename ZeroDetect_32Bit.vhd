----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2020 21:18:09
-- Design Name: 
-- Module Name: ZeroDetect_32Bit - Behavioral
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

entity ZeroDetect_32Bit is
    Port ( Value : in STD_LOGIC_VECTOR (31 downto 0);
           Zero : out STD_LOGIC);
end ZeroDetect_32Bit;

architecture Behavioral of ZeroDetect_32Bit is
constant DELAY: Time:= 5ns;
begin
with Value select
    Zero <= '1' after DELAY when x"00000000",
            '0' after DELAY when others;
end Behavioral;
