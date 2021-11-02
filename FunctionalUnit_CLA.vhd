----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2020 21:24:20
-- Design Name: 
-- Module Name: FunctionalUnit_32Bit - Behavioral
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

entity FunctionalUnit_CLA is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           FS : in STD_LOGIC_VECTOR (4 downto 0);
           Data_Out : out STD_LOGIC_VECTOR (31 downto 0);
           C : out STD_LOGIC;
           V : out STD_LOGIC;
           N : out STD_LOGIC;
           Z : out STD_LOGIC);
end FunctionalUnit_CLA;
architecture Behavioral of FunctionalUnit_CLA is
component Shifter_32Bit
   Port ( Value : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC_vector(1 downto 0);
           Result : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component ALU_CLA_32Bit 
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           C : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           SRC : in STD_LOGIC;
           Data_Out : out STD_LOGIC_VECTOR (31 downto 0);
           C_Out, V: out STD_LOGIC);
end component;

component ZeroDetect_32Bit
    Port ( Value : in STD_LOGIC_VECTOR (31 downto 0);
           Zero : out STD_LOGIC);
end component;

component Multiplexer2_32Bit
    Port ( SRC : in STD_LOGIC;
           Data_A, Data_B : in STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end component;
constant DELAY : Time:= 5ns;
constant ALU_DELAY : Time := 5ns;
signal Data_A, Data_B : std_logic_vector(31 downto 0);
signal tempC, tempZ, tempV : std_logic := '0';
begin

ALU: ALU_CLA_32Bit Port Map(A => A, B => B, C => FS(0), S0 => FS(1), S1 => FS(2), SRC => FS(3), Data_Out => Data_A, C_Out => tempC, V => tempV);
SHIFTER: Shifter_32Bit Port Map(Value => B, Sel => FS(3 downto 2), Result => Data_B);
ZERO: ZeroDetect_32Bit Port Map(Value => Data_A, Zero => tempZ);
MUX: Multiplexer2_32Bit Port Map(SRC => FS(4), Data_A => Data_A, Data_B => Data_B, DataOut => Data_Out);
N <= Data_A(31) after DELAY;
Z <= tempZ after DELAY;
V <= tempV after DELAY;
C <= tempC after DELAY;
end Behavioral;
