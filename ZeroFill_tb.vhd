----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2021 18:10:24
-- Design Name: 
-- Module Name: ZeroFill_tb - Behavioral
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

entity ZeroFill_tb is
--  Port ( );
end ZeroFill_tb;

architecture Behavioral of ZeroFill_tb is
component ZeroFill is
    Port ( SB : in STD_LOGIC_VECTOR (4 downto 0);
           Data_out : out STD_LOGIC_VECTOR (31 downto 0));
end component;
signal SB : std_logic_vector(4 downto 0);
signal Data_out : std_logic_vector(31 downto 0);
begin

UUT: ZeroFill Port Map(SB => SB, Data_out => Data_out);
SB <= "10101";
process begin
wait for 10ns;
end process;

end Behavioral;
