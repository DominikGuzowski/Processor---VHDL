----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2020 17:03:03
-- Design Name: 
-- Module Name: ALU_CLA_32Bit - Behavioral
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

entity ALU_CLA_32Bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           C : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           SRC : in STD_LOGIC;
           Data_Out : out STD_LOGIC_VECTOR (31 downto 0);
           C_Out, V: out STD_LOGIC);
end ALU_CLA_32Bit;

architecture Behavioral of ALU_CLA_32Bit is

component LogicCircuit_32Bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component ArithmeticCircuit_CLA is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           C : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR (31 downto 0);
           Cout : out STD_LOGIC;
           V : out STD_LOGIC);
end component;

constant DELAY: Time:= 5ns;
signal LogicData, ArithmeticData: std_logic_vector(31 downto 0);
begin
AC: ArithmeticCircuit_CLA Port Map(A => A, B => B, S0 => S0, S1 => S1, C => C, Data_out => ArithmeticData, Cout => C_out, V => V);
LC: LogicCircuit_32Bit Port Map(A => A, B => B, S0 => S0, S1 => S1, Data_out => LogicData);
with SRC select
    Data_out <= ArithmeticData after DELAY when '0',
                LogicData after DELAY when '1',
                ArithmeticData after DELAY when others;

end Behavioral;
