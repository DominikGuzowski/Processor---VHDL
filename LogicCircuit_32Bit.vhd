----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2020 17:24:55
-- Design Name: 
-- Module Name: LogicCircuit_32Bit - Behavioral
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

entity LogicCircuit_32Bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR (31 downto 0));
end LogicCircuit_32Bit;

architecture Behavioral of LogicCircuit_32Bit is
constant DELAY : Time := 5ns;
signal Sel : std_logic_vector(1 downto 0);
begin
Sel(0) <= S0;
Sel(1) <= S1;

with Sel select
Data_out <= A and B after DELAY when "00",
            A or  B after DELAY when "01",
            A xor B after DELAY when "10",
              not A after DELAY when "11",
            A after DELAY when others;
            
end Behavioral;
