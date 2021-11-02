----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2020 10:42:35
-- Design Name: 
-- Module Name: ArithmeticCircuit_32Bit - Behavioral
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

entity ArithmeticCircuit_32Bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           C : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR (31 downto 0);
           Cout : out STD_LOGIC;
           V : out STD_LOGIC);
end ArithmeticCircuit_32Bit;

architecture Behavioral of ArithmeticCircuit_32Bit is
component ArithmeticCircuit_1Bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           C_Out : out STD_LOGIC;
           Sum : out STD_LOGIC);
end component;
signal C0: std_logic_vector(31 downto 0);
constant DELAY: Time := 5ns;
begin
AC0: ArithmeticCircuit_1Bit Port Map(A => A(0), B => B(0), C => C, S0 => S0, S1 => S1, C_Out => C0(0), Sum => Data_out(0));
AC1: ArithmeticCircuit_1Bit Port Map(A => A(1), B => B(1), C => C0(0), S0 => S0, S1 => S1, C_Out => C0(1), Sum => Data_out(1));
AC2: ArithmeticCircuit_1Bit Port Map(A => A(2), B => B(2), C => C0(1), S0 => S0, S1 => S1, C_Out => C0(2), Sum => Data_out(2));
AC3: ArithmeticCircuit_1Bit Port Map(A => A(3), B => B(3), C => C0(2), S0 => S0, S1 => S1, C_Out => C0(3), Sum => Data_out(3));
AC4: ArithmeticCircuit_1Bit Port Map(A => A(4), B => B(4), C => C0(3), S0 => S0, S1 => S1, C_Out => C0(4), Sum => Data_out(4));
AC5: ArithmeticCircuit_1Bit Port Map(A => A(5), B => B(5), C => C0(4), S0 => S0, S1 => S1, C_Out => C0(5), Sum => Data_out(5));
AC6: ArithmeticCircuit_1Bit Port Map(A => A(6), B => B(6), C => C0(5), S0 => S0, S1 => S1, C_Out => C0(6), Sum => Data_out(6));
AC7: ArithmeticCircuit_1Bit Port Map(A => A(7), B => B(7), C => C0(6), S0 => S0, S1 => S1, C_Out => C0(7), Sum => Data_out(7));
AC8: ArithmeticCircuit_1Bit Port Map(A => A(8), B => B(8), C => C0(7), S0 => S0, S1 => S1, C_Out => C0(8), Sum => Data_out(8));
AC9: ArithmeticCircuit_1Bit Port Map(A => A(9), B => B(9), C => C0(8), S0 => S0, S1 => S1, C_Out => C0(9), Sum => Data_out(9));
AC10: ArithmeticCircuit_1Bit Port Map(A => A(10), B => B(10), C => C0(9), S0 => S0, S1 => S1, C_Out => C0(10), Sum => Data_out(10));
AC11: ArithmeticCircuit_1Bit Port Map(A => A(11), B => B(11), C => C0(10), S0 => S0, S1 => S1, C_Out => C0(11), Sum => Data_out(11));
AC12: ArithmeticCircuit_1Bit Port Map(A => A(12), B => B(12), C => C0(11), S0 => S0, S1 => S1, C_Out => C0(12), Sum => Data_out(12));
AC13: ArithmeticCircuit_1Bit Port Map(A => A(13), B => B(13), C => C0(12), S0 => S0, S1 => S1, C_Out => C0(13), Sum => Data_out(13));
AC14: ArithmeticCircuit_1Bit Port Map(A => A(14), B => B(14), C => C0(13), S0 => S0, S1 => S1, C_Out => C0(14), Sum => Data_out(14));
AC15: ArithmeticCircuit_1Bit Port Map(A => A(15), B => B(15), C => C0(14), S0 => S0, S1 => S1, C_Out => C0(15), Sum => Data_out(15));
AC16: ArithmeticCircuit_1Bit Port Map(A => A(16), B => B(16), C => C0(15), S0 => S0, S1 => S1, C_Out => C0(16), Sum => Data_out(16));
AC17: ArithmeticCircuit_1Bit Port Map(A => A(17), B => B(17), C => C0(16), S0 => S0, S1 => S1, C_Out => C0(17), Sum => Data_out(17));
AC18: ArithmeticCircuit_1Bit Port Map(A => A(18), B => B(18), C => C0(17), S0 => S0, S1 => S1, C_Out => C0(18), Sum => Data_out(18));
AC19: ArithmeticCircuit_1Bit Port Map(A => A(19), B => B(19), C => C0(18), S0 => S0, S1 => S1, C_Out => C0(19), Sum => Data_out(19));
AC20: ArithmeticCircuit_1Bit Port Map(A => A(20), B => B(20), C => C0(19), S0 => S0, S1 => S1, C_Out => C0(20), Sum => Data_out(20));
AC21: ArithmeticCircuit_1Bit Port Map(A => A(21), B => B(21), C => C0(20), S0 => S0, S1 => S1, C_Out => C0(21), Sum => Data_out(21));
AC22: ArithmeticCircuit_1Bit Port Map(A => A(22), B => B(22), C => C0(21), S0 => S0, S1 => S1, C_Out => C0(22), Sum => Data_out(22));
AC23: ArithmeticCircuit_1Bit Port Map(A => A(23), B => B(23), C => C0(22), S0 => S0, S1 => S1, C_Out => C0(23), Sum => Data_out(23));
AC24: ArithmeticCircuit_1Bit Port Map(A => A(24), B => B(24), C => C0(23), S0 => S0, S1 => S1, C_Out => C0(24), Sum => Data_out(24));
AC25: ArithmeticCircuit_1Bit Port Map(A => A(25), B => B(25), C => C0(24), S0 => S0, S1 => S1, C_Out => C0(25), Sum => Data_out(25));
AC26: ArithmeticCircuit_1Bit Port Map(A => A(26), B => B(26), C => C0(25), S0 => S0, S1 => S1, C_Out => C0(26), Sum => Data_out(26));
AC27: ArithmeticCircuit_1Bit Port Map(A => A(27), B => B(27), C => C0(26), S0 => S0, S1 => S1, C_Out => C0(27), Sum => Data_out(27));
AC28: ArithmeticCircuit_1Bit Port Map(A => A(28), B => B(28), C => C0(27), S0 => S0, S1 => S1, C_Out => C0(28), Sum => Data_out(28));
AC29: ArithmeticCircuit_1Bit Port Map(A => A(29), B => B(29), C => C0(28), S0 => S0, S1 => S1, C_Out => C0(29), Sum => Data_out(29));
AC30: ArithmeticCircuit_1Bit Port Map(A => A(30), B => B(30), C => C0(29), S0 => S0, S1 => S1, C_Out => C0(30), Sum => Data_out(30));
AC31: ArithmeticCircuit_1Bit Port Map(A => A(31), B => B(31), C => C0(30), S0 => S0, S1 => S1, C_Out => C0(31), Sum => Data_out(31));
Cout <= C0(31);
V <= C0(31) xor C0(30) after DELAY;
end Behavioral;
