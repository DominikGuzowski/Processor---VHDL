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

entity ArithmeticCircuit_CLA is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           C : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR (31 downto 0);
           Cout : out STD_LOGIC;
           V : out STD_LOGIC);
end ArithmeticCircuit_CLA;

architecture Behavioral of ArithmeticCircuit_CLA is
component ArithmeticSelect is
    Port ( B : in STD_LOGIC_VECTOR (31 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component CLA_32Bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           C : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (31 downto 0);
           Cout : out STD_LOGIC);
end component;

signal B0, Sum: std_logic_vector(31 downto 0);
constant DELAY: Time:= 5ns;
begin
AS: ArithmeticSelect Port Map(B => B, S0 => S0, S1 => S1, Data_out => B0);
CLA: CLA_32Bit Port Map(A => A, B => B0, C => C, S => Sum, Cout => Cout);
V <= (A(31) xnor B0(31)) and (A(31) xor Sum(31)) after DELAY;
Data_out <= Sum;
end Behavioral;
