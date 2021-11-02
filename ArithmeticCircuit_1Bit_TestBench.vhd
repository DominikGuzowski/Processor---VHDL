----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2020 10:31:27
-- Design Name: 
-- Module Name: ArithmeticCircuit_1Bit_TestBench - Behavioral
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

entity ArithmeticCircuit_1Bit_TestBench is
--  Port ( );
end ArithmeticCircuit_1Bit_TestBench;

architecture Behavioral of ArithmeticCircuit_1Bit_TestBench is
component ArithmeticCircuit_1Bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           C_Out : out STD_LOGIC;
           Sum : out STD_LOGIC);
end component;

signal PASSED, expectedCarry, expectedSum: std_logic;
signal A, B, C, S1, S0, C_Out, Sum: std_logic;
signal Clk : std_logic := '0';
signal CW : std_logic_vector(4 downto 0);

begin
UUT: ArithmeticCircuit_1Bit Port Map(A => A, B => B, C => C, S0 => S0, S1 => S1, C_Out => C_Out, Sum => Sum);
S0 <= CW(0);
S1 <= CW(1);
C <= CW(2);
B <= CW(3);
A <= CW(4);
Clk <= not Clk after 25ns;

--For simulation purposes only - Used to easily check whether the output is correct.
process(Sum, C_Out, Clk) begin --Compares the output with the expected output to check whether the signals match(ie. are correct).
if(rising_edge(Clk)) then      --If PASSED ever changes to 0 it means that there is an output that is not calculated correctly.
    PASSED <= (not(Sum xor expectedSum)) and (not(expectedCarry xor C_Out));
end if;
end process;

AC_SIM: process begin
      --Results on the rising edge.
      CW <= "00000"; --Expected Result: Sum = '0', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "00001"; --Expected Result: Sum = '0', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "00010"; --Expected Result: Sum = '1', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '1';
      wait for 50ns;
    
      CW <= "00011"; --Expected Result: Sum = '1', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '1';
      wait for 50ns;
    
      CW <= "00100"; --Expected Result: Sum = '1', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '1';
      wait for 50ns;
    
      CW <= "00101"; --Expected Result: Sum = '1', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '1';
      wait for 50ns;
    
      CW <= "00110"; --Expected Result: Sum = '0', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "00111"; --Expected Result: Sum = '0', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "01000"; --Expected Result: Sum = '0', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "01001"; --Expected Result: Sum = '1', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '1';
      wait for 50ns;
    
      CW <= "01010"; --Expected Result: Sum = '0', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "01011"; --Expected Result: Sum = '1', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '1';
      wait for 50ns;
    
      CW <= "01100"; --Expected Result: Sum = '1', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '1';
      wait for 50ns;
    
      CW <= "01101"; --Expected Result: Sum = '0', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "01110"; --Expected Result: Sum = '1', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '1';
      wait for 50ns;
    
      CW <= "01111"; --Expected Result: Sum = '0', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "10000"; --Expected Result: Sum = '1', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '1';
      wait for 50ns;
    
      CW <= "10001"; --Expected Result: Sum = '1', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '1';
      wait for 50ns;
    
      CW <= "10010"; --Expected Result: Sum = '0', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "10011"; --Expected Result: Sum = '0', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "10100"; --Expected Result: Sum = '0', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "10101"; --Expected Result: Sum = '0', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "10110"; --Expected Result: Sum = '1', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '1';
      wait for 50ns;
    
      CW <= "10111"; --Expected Result: Sum = '1', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '1';
      wait for 50ns;
    
      CW <= "11000"; --Expected Result: Sum = '1', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '1';
      wait for 50ns;
    
      CW <= "11001"; --Expected Result: Sum = '0', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "11010"; --Expected Result: Sum = '1', C_Out = '0' --> Passed
      expectedCarry <= '0';
      expectedSum <= '1';
      wait for 50ns;
    
      CW <= "11011"; --Expected Result: Sum = '0', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "11100"; --Expected Result: Sum = '0', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "11101"; --Expected Result: Sum = '1', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '1';
      wait for 50ns;
    
      CW <= "11110"; --Expected Result: Sum = '0', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '0';
      wait for 50ns;
    
      CW <= "11111"; --Expected Result: Sum = '1', C_Out = '1' --> Passed
      expectedCarry <= '1';
      expectedSum <= '1';
      wait for 50ns;
    
      --Sim time: 1600ns
    end process;
end Behavioral;
