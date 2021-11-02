----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.11.2020 16:20:48
-- Design Name: 
-- Module Name: FullAdder - Behavioral
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

entity FullAdder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Carry_in : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Carry_out : out STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is
component HalfAdder
    Port(A, B : in std_logic;
        Sum, Carry : out std_logic);
end component;
constant DELAY: Time := 5ns;
signal Half_Carry, Half_Sum, Full_Carry: std_logic;
begin
HA1: HalfAdder Port Map(A => A, B => B, Sum => Half_Sum, Carry => Half_Carry);
HA2: HalfAdder Port Map(A => Half_Sum, B => Carry_in, Sum => Sum, Carry => Full_Carry);
Carry_out <= Full_Carry or Half_Carry after DELAY;
end Behavioral;
