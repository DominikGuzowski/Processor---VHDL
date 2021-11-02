----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2021 19:32:38
-- Design Name: 
-- Module Name: FlagMultiplexer_tb - Behavioral
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

entity FlagMultiplexer_tb is
--  Port ( );
end FlagMultiplexer_tb;

architecture Behavioral of FlagMultiplexer_tb is

component FlagMultiplexer is --Done
    Port ( NZVC : in STD_LOGIC_VECTOR (3 downto 0);
           MS : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC);
end component;

signal NZVC : std_logic_vector(3 downto 0);
signal MS : std_logic_vector(2 downto 0);
signal S : std_logic;
begin
UUT: FlagMultiplexer Port Map(NZVC => NZVC, MS => MS, S => S);

process begin
NZVC <= "1010";
MS <= "000";
wait for 10ns;
MS <= "001";
wait for 10ns;
MS <= "010";
wait for 10ns;
MS <= "011";
wait for 10ns;
MS <= "100";
wait for 10ns;
MS <= "101";
wait for 10ns;
MS <= "110";
wait for 10ns;
MS <= "111";
wait for 10ns;
end process;

end Behavioral;
