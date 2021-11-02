----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2021 15:50:24
-- Design Name: 
-- Module Name: ArithmeticSelect_tb - Behavioral
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

entity ArithmeticSelect_tb is
--  Port ( );
end ArithmeticSelect_tb;

architecture Behavioral of ArithmeticSelect_tb is
component ArithmeticSelect is
    Port ( B : in STD_LOGIC_VECTOR (31 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR (31 downto 0));
end component;
signal S0, S1 : std_logic;
signal B, Data_out : std_logic_vector(31 downto 0);
begin
UUT: ArithmeticSelect Port Map(B => B, S0 => S0, S1 => S1, Data_out => Data_out);
B <= x"0000FFFF";
process begin
S0 <= '0';
S1 <= '0';
wait for 10ns; --expected value: 0x00000000
S0 <= '1';
wait for 10ns; --expected value: 0x0000FFFF
S0 <= '0';
S1 <= '1';
wait for 10ns; --expected value: 0xFFFF0000
S0 <= '1';
wait for 10ns; --expected value: 0xFFFFFFFF
end process;

end Behavioral;
