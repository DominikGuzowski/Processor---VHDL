----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2021 13:48:39
-- Design Name: 
-- Module Name: ArithmeticCircuit_CLA_tb - Behavioral
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

entity ArithmeticCircuit_CLA_tb is
--  Port ( );
end ArithmeticCircuit_CLA_tb;

architecture Behavioral of ArithmeticCircuit_CLA_tb is
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
signal S0, S1, C : std_logic;
signal A, B, Data_out : std_logic_vector(31 downto 0);
signal Cout, V: std_logic;
signal Clk : std_logic := '0';
begin

UUT: ArithmeticCircuit_CLA Port Map(A => A, B => B, S0 => S0, S1 => S1, C => C, Data_out => Data_out, Cout => Cout, V => V);

A <= x"00000010"; --16
B <= x"00000008"; --8
Clk <= not Clk after 200ns;
process begin
S1 <= '0';
S0 <= '0';
C <= '0';
wait for 400ns; --Transfer A : expected value: 0x10

S1 <= '1';
S0 <= '0';
C <= '0';
wait for 400ns; --Add A + 1s C of B : expected value: 0x7

S1 <= '0';
S0 <= '1';
C <= '0';
wait for 400ns; --Add A + B : expected value: 0x18

S1 <= '1';
S0 <= '1';
C <= '0';
wait for 400ns; --Decrement A : expected value: 0xF

S1 <= '0';
S0 <= '0';
C <= '1';
wait for 400ns; --Increment A : expected value: 0x11

S1 <= '1';
S0 <= '0';
C <= '1';
wait for 400ns; --Subtract A - B : expected value: 0x8

S1 <= '0';
S0 <= '1';
C <= '1';
wait for 400ns; -- Add A + B + C : expected value: 0x19

S1 <= '1';
S0 <= '1';
C <= '1';
wait for 400ns; --Transfer A: expected value: 0x10


end process;
end Behavioral;
