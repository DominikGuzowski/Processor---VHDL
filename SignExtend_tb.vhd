----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2021 19:12:20
-- Design Name: 
-- Module Name: SignExtend_tb - Behavioral
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

entity SignExtend_tb is
--  Port ( );
end SignExtend_tb;

architecture Behavioral of SignExtend_tb is
component SignExtend is --Done
    Port ( Data_in : in STD_LOGIC_VECTOR (9 downto 0);
           Data_out : out STD_LOGIC_VECTOR (31 downto 0));
end component;
signal Data_in : std_logic_vector(9 downto 0);
signal Data_out : std_logic_vector(31 downto 0);
begin
UUT: SignExtend Port Map(Data_in => Data_in, Data_out => Data_out);

process begin
    Data_in <= "0111111111";
    wait for 10ns;
    Data_in <= "1111111111";
    wait for 10ns;
end process;
end Behavioral;
