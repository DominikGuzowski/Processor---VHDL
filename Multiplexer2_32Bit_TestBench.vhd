----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.10.2020 18:52:41
-- Design Name: 
-- Module Name: Multiplexer2_32Bit_TestBench - Behavioral
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

entity Multiplexer2_32Bit_TestBench is
--  Port ( );
end Multiplexer2_32Bit_TestBench;

architecture Behavioral of Multiplexer2_32Bit_TestBench is
component Multiplexer2_32Bit
    Port ( SRC : in STD_LOGIC;
           Data_A, Data_B : in STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end component;
signal SRC : std_logic;
signal Data_A, Data_B, DataOut : std_logic_vector(31 downto 0);
begin
Data_A <= "10101010101010101010101010101010";
Data_B <= "11111111111111110000000000000000";

UUT: Multiplexer2_32Bit Port Map(SRC => SRC, Data_A => Data_A,
                                 Data_B => Data_B, DataOut => DataOut);
    Multiplexer2_32Bit_Sim : process begin
        SRC <= '0';
        wait for 10ns;
        
        SRC <= '1';
        wait for 10ns;
    end process;
end Behavioral;
