----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2020 20:28:48
-- Design Name: 
-- Module Name: ArithmeticCircuit_1Bit - Behavioral
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

entity ArithmeticCircuit_1Bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           C_Out : out STD_LOGIC;
           Sum : out STD_LOGIC);
end ArithmeticCircuit_1Bit;

architecture Behavioral of ArithmeticCircuit_1Bit is
component FullAdder
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Carry_in : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Carry_out : out STD_LOGIC);
end component;
constant DELAY: Time:= 5ns;
--signal B2, B3, D, F0, F1, F2, T: std_logic;
signal AND1, AND2, OR1 : std_logic;
begin
AND1 <= B and S0 after DELAY;
AND2 <= (not B) and S1 after DELAY;
OR1 <= AND1 or AND2 after DELAY;
FA: FullAdder Port Map(A => A, B => OR1, Carry_in => C, Sum => Sum, Carry_Out => C_Out);
--Sum <= ((A xor (((not B) and S1) or (B and S0))) xor C) after DELAY;
--C_Out <= ((C and (A xor (((not B) and S1) or (B and S0)))) or (A and (((not B) and S1) or (B and S0)))) after DELAY;
end Behavioral;
