----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.11.2020 18:22:05
-- Design Name: 
-- Module Name: HalfAdder_TestBench - Behavioral
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

entity HalfAdder_TestBench is
--  Port ( );
end HalfAdder_TestBench;

architecture Behavioral of HalfAdder_TestBench is
component HalfAdder
    Port(A, B : in std_logic;
        Sum, Carry : out std_logic);
end component;
signal A,B,S,C : std_logic; 
signal Clk : std_logic:= '0';
begin
HA: HalfAdder Port Map(A => A, B => B, Sum => S, Carry => C);
Clk <= not Clk after 5ns;
    SIM: process begin
    A <= '0';
    B <= '0';
    wait for 10ns;
    A <= '1';
    B <= '0';
    wait for 10ns;
    A <= '0';
    B <= '1';
    wait for 10ns;
    A <= '1';
    B <= '1';
    wait for 10ns;
    end process;


end Behavioral;
