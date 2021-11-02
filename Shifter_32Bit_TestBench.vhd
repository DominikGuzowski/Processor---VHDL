----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2020 15:08:31
-- Design Name: 
-- Module Name: Shifter_32Bit_TestBench - Behavioral
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

entity Shifter_32Bit_TestBench is
--  Port ( );
end Shifter_32Bit_TestBench;

architecture Behavioral of Shifter_32Bit_TestBench is
component Shifter_32Bit
    Port ( Value : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC_VECTOR(1 downto 0);
           Result : out STD_LOGIC_VECTOR (31 downto 0));
end component;
signal val, res:std_logic_vector(31 downto 0);
signal leftright : std_logic_vector(1 downto 0);
begin
SH: Shifter_32Bit Port Map(Value => val, Sel => leftright, Result => res);
process begin
    leftright <= "01";  --Right shift
    val <= x"11111111"; --Expected result: 0x08888888 --> Passed
    wait for 10ns;
    val <= x"55555555"; --Expected result: 0x2AAAAAAA --> Passed
    wait for 10ns;
    
    leftright <= "10";  --Left shift
    val <= x"11111111"; --Expected result: 0x22222222 --> Passed
    wait for 10ns;
    val <= x"55555555"; --Expected result: 0xAAAAAAAA --> Passed
    wait for 10ns;
    
    leftright <= "00";  --No shift
    val <= x"11111111"; --Expected result: 0x11111111 --> Passed
    wait for 10ns;
    val <= x"55555555"; --Expected result: 0x55555555 --> Passed
    wait for 10ns;
    --Sim time: 60ns
end process;
end Behavioral;
