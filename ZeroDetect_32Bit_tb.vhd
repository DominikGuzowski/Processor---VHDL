----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2020 22:27:04
-- Design Name: 
-- Module Name: ZeroDetect_32Bit_tb - Behavioral
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

entity ZeroDetect_32Bit_tb is
--  Port ( );
end ZeroDetect_32Bit_tb;

architecture Behavioral of ZeroDetect_32Bit_tb is
component ZeroDetect_32Bit is
    Port ( Value : in STD_LOGIC_VECTOR (31 downto 0);
           Zero : out STD_LOGIC);
end component;
signal Value : std_logic_vector(31 downto 0);
signal Zero : std_logic;
begin
UUT: ZeroDetect_32Bit Port Map(Value => Value, Zero => Zero);

process begin
Value <= x"03301240";
wait for 10ns;
Value <= x"00000000";
wait for 10ns;
Value <= x"10000000";
wait for 10ns;
Value <= x"00000000";
wait for 10ns;
end process;
end Behavioral;
