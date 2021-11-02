----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2020 22:45:53
-- Design Name: 
-- Module Name: ALU_CLA_TestBench - Behavioral
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

entity ALU_CLA_32Bit_tb is
--  Port ( );
end ALU_CLA_32Bit_tb;

architecture Behavioral of ALU_CLA_32Bit_tb is
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

signal C, S0, S1, SRC, C_Out, V : std_logic;
signal A, B, Data_Out : std_logic_vector(31 downto 0);
signal FS : std_logic_vector(3 downto 0);
signal clk : std_logic:= '0';
begin
UUT: ALU_CLA_32Bit Port Map(A => A, B => B, C => C, S0 => S0, S1 => S1, SRC => SRC, Data_Out => Data_Out, C_Out => C_Out, V => V);
    SRC <= FS(3);
    S1 <= FS(2);
    S0 <= FS(1);
    C <= FS(0);
    clk  <= not clk after 300ns;
    ALU_SIM: process begin
    A <= x"0000000A";
    B <= x"00000005";
    
        FS <= "0000"; --Expected Result: 0xA --> Passed
    wait for 600ns;
        FS <= "0001"; --Expected Result: 0xB --> Passed
    wait for 600ns;
        FS <= "0010"; --Expected Result: 0xF --> Passed
    wait for 600ns;
        FS <= "0011"; --Expected Result: 0x10 --> Passed
    wait for 600ns; 
        FS <= "0100"; --Expected Result: 0x4 --> Passed
    wait for 600ns;
        FS <= "0101"; --Expected Result: 0x5 --> Passed
    wait for 600ns;
        FS <= "0110"; --Expected Result: 0x9 --> Passed
    wait for 600ns;
        FS <= "0111"; --Expected Result: 0xA --> Passed
    wait for 600ns;
        FS <= "1000"; --Expected Result: 0x0 --> Passed
    wait for 600ns;
        FS <= "1010"; --Expected Result: 0xF --> Passed
    wait for 600ns;
        FS <= "1100"; --Expected Result: 0xF --> Passed
    wait for 600ns;
        FS <= "1110"; --Expected Result: 0xFFFFFFF5 --> Passed
    wait for 600ns;
    --Sim time: 7200ns
    end process;
end Behavioral;
