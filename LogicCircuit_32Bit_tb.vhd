----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2021 15:32:15
-- Design Name: 
-- Module Name: LogicCircuit_32Bit_tb - Behavioral
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

entity LogicCircuit_32Bit_tb is
--  Port ( );
end LogicCircuit_32Bit_tb;

architecture Behavioral of LogicCircuit_32Bit_tb is
component LogicCircuit_32Bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR (31 downto 0));
end component;
signal A, B, Data_out : std_logic_vector(31 downto 0);
signal S0, S1 : std_logic;
begin

UUT: LogicCircuit_32Bit Port Map(A => A, B => B, S0 => S0, S1 => S1, Data_out => Data_out);

process begin
A <= x"FFAA55FF";
B <= x"F5A5A5AF";
S0 <= '0';
S1 <= '0';
wait for 20ns;
S0 <= '1';
S1 <= '0';
wait for 20ns;
S0 <= '0';
S1 <= '1';
wait for 20ns;
S0 <= '1';
S1 <= '1';
wait for 20ns;
end process;


end Behavioral;
