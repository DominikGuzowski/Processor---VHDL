----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2020 19:58:52
-- Design Name: 
-- Module Name: FunctionalUnit_tb - Behavioral
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

entity FunctionalUnit_CLA_tb is
--  Port ( );
end FunctionalUnit_CLA_tb;

architecture Behavioral of FunctionalUnit_CLA_tb is
component FunctionalUnit_CLA is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           FS : in STD_LOGIC_VECTOR (4 downto 0);
           Data_Out : out STD_LOGIC_VECTOR (31 downto 0);
           C : out STD_LOGIC;
           V : out STD_LOGIC;
           N : out STD_LOGIC;
           Z : out STD_LOGIC);
end component;
signal A, B, Data_out : std_logic_vector(31 downto 0);
signal FS : std_logic_vector(4 downto 0);
signal C, V, N, Z : std_logic;
signal Clk : std_logic := '0';
begin
UUT: FunctionalUnit_CLA Port Map(A => A, B => B, FS => FS, Data_out => Data_out, C => C, V => V, N => N, Z => Z);
A <= x"00000005";
B <= x"0000000A";
Clk <= not Clk after 350ns;
SIM: process begin
FS <= "00000";  --MOV RES <- A
wait for 700ns; --Expected Result: 0x5 --> Passed

FS <= "00001";  --INC RES <- A
wait for 700ns; --Expected Result: 0x6 --> Passed

FS <= "00010";  --ADD RES <- A, B
wait for 700ns; --Expected Result: 0xF --> Passed

FS <= "00011";  --ADDC RES <- A, B
wait for 700ns; --Expected Result: 0x10 --> Passed

FS <= "00100";  --ADD RES <- A, B'1c
wait for 700ns; --Expected Result: 0xFFFFFFFA --> Passed

FS <= "00101";  --SUB RES <- A, B
wait for 700ns; --Expected Result: 0xFFFFFFFB --> Passed

FS <= "00110";  --DEC RES <- A
wait for 700ns; --Expected Result: 0x4 --> Passed

FS <= "00111";  --MOV RES <- A
wait for 700ns; --Expected Result: 0x5 --> Passed

FS <= "01000";  --AND RES <- A, B
wait for 700ns; --Expected Result: 0x0 --> Passed

FS <= "01010";  --OR RES <- A, B
wait for 700ns; --Expected Result: 0xF --> Passed

FS <= "01100";  --XOR RES <- A, B
wait for 700ns; --Expected Result: 0xF --> Passed

FS <= "01110";  --NOT RES <- A
wait for 700ns; --Expected Result: 0xFFFFFFFA --> Passed

FS <= "10000";  --MOV RES <- B
wait for 700ns; --Expected Result: 0xA --> Passed

FS <= "10100";  --LSR RES <- B
wait for 700ns; --Expected Result: 0x5 --> Passed

FS <= "11000";  --LSL RES <- B
wait for 700ns; --Expected Result: 0x14 --> Passed

--Sim time: 10500ns
end process;

end Behavioral;
