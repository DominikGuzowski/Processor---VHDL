----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2020 20:47:50
-- Design Name: 
-- Module Name: ALU_32Bit - Behavioral
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

entity ALU_32Bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           C : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           SRC : in STD_LOGIC;
           Data_Out : out STD_LOGIC_VECTOR (31 downto 0);
           C_Out, V: out STD_LOGIC);
end ALU_32Bit;

architecture Behavioral of ALU_32Bit is
component ALU_1Bit
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           SRC : in STD_LOGIC;
           C_Out : out STD_LOGIC;
           Data_Out : out STD_LOGIC);
end component;
constant DELAY: Time:= 5ns;
signal Carry : std_logic_vector(31 downto 0);
begin
ALU0: ALU_1Bit Port Map(A => A(0), B => B(0), C => C, S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(0), Data_Out => Data_Out(0));
ALU1: ALU_1Bit Port Map(A => A(1), B => B(1), C => Carry(0), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(1), Data_Out => Data_Out(1));
ALU2: ALU_1Bit Port Map(A => A(2), B => B(2), C => Carry(1), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(2), Data_Out => Data_Out(2));
ALU3: ALU_1Bit Port Map(A => A(3), B => B(3), C => Carry(2), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(3), Data_Out => Data_Out(3));
ALU4: ALU_1Bit Port Map(A => A(4), B => B(4), C => Carry(3), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(4), Data_Out => Data_Out(4));
ALU5: ALU_1Bit Port Map(A => A(5), B => B(5), C => Carry(4), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(5), Data_Out => Data_Out(5));
ALU6: ALU_1Bit Port Map(A => A(6), B => B(6), C => Carry(5), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(6), Data_Out => Data_Out(6));
ALU7: ALU_1Bit Port Map(A => A(7), B => B(7), C => Carry(6), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(7), Data_Out => Data_Out(7));
ALU8: ALU_1Bit Port Map(A => A(8), B => B(8), C => Carry(7), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(8), Data_Out => Data_Out(8));
ALU9: ALU_1Bit Port Map(A => A(9), B => B(9), C => Carry(8), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(9), Data_Out => Data_Out(9));
ALU10: ALU_1Bit Port Map(A => A(10), B => B(10), C => Carry(9), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(10), Data_Out => Data_Out(10));
ALU11: ALU_1Bit Port Map(A => A(11), B => B(11), C => Carry(10), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(11), Data_Out => Data_Out(11));
ALU12: ALU_1Bit Port Map(A => A(12), B => B(12), C => Carry(11), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(12), Data_Out => Data_Out(12));
ALU13: ALU_1Bit Port Map(A => A(13), B => B(13), C => Carry(12), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(13), Data_Out => Data_Out(13));
ALU14: ALU_1Bit Port Map(A => A(14), B => B(14), C => Carry(13), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(14), Data_Out => Data_Out(14));
ALU15: ALU_1Bit Port Map(A => A(15), B => B(15), C => Carry(14), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(15), Data_Out => Data_Out(15));
ALU16: ALU_1Bit Port Map(A => A(16), B => B(16), C => Carry(15), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(16), Data_Out => Data_Out(16));
ALU17: ALU_1Bit Port Map(A => A(17), B => B(17), C => Carry(16), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(17), Data_Out => Data_Out(17));
ALU18: ALU_1Bit Port Map(A => A(18), B => B(18), C => Carry(17), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(18), Data_Out => Data_Out(18));
ALU19: ALU_1Bit Port Map(A => A(19), B => B(19), C => Carry(18), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(19), Data_Out => Data_Out(19));
ALU20: ALU_1Bit Port Map(A => A(20), B => B(20), C => Carry(19), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(20), Data_Out => Data_Out(20));
ALU21: ALU_1Bit Port Map(A => A(21), B => B(21), C => Carry(20), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(21), Data_Out => Data_Out(21));
ALU22: ALU_1Bit Port Map(A => A(22), B => B(22), C => Carry(21), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(22), Data_Out => Data_Out(22));
ALU23: ALU_1Bit Port Map(A => A(23), B => B(23), C => Carry(22), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(23), Data_Out => Data_Out(23));
ALU24: ALU_1Bit Port Map(A => A(24), B => B(24), C => Carry(23), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(24), Data_Out => Data_Out(24));
ALU25: ALU_1Bit Port Map(A => A(25), B => B(25), C => Carry(24), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(25), Data_Out => Data_Out(25));
ALU26: ALU_1Bit Port Map(A => A(26), B => B(26), C => Carry(25), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(26), Data_Out => Data_Out(26));
ALU27: ALU_1Bit Port Map(A => A(27), B => B(27), C => Carry(26), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(27), Data_Out => Data_Out(27));
ALU28: ALU_1Bit Port Map(A => A(28), B => B(28), C => Carry(27), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(28), Data_Out => Data_Out(28));
ALU29: ALU_1Bit Port Map(A => A(29), B => B(29), C => Carry(28), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(29), Data_Out => Data_Out(29));
ALU30: ALU_1Bit Port Map(A => A(30), B => B(30), C => Carry(29), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(30), Data_Out => Data_Out(30));
ALU31: ALU_1Bit Port Map(A => A(31), B => B(31), C => Carry(30), S0 => S0, S1 => S1, SRC => SRC, C_Out => Carry(31), Data_Out => Data_Out(31));
C_Out <= Carry(31);
V <= Carry(30) xor Carry(31) after DELAY;
end Behavioral;
