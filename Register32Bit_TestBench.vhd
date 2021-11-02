----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.10.2020 19:04:43
-- Design Name: 
-- Module Name: Register32Bit_TestBench - Behavioral
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

entity Register32Bit_TestBench is
--  Port ( );
end Register32Bit_TestBench;

architecture Behavioral of Register32Bit_TestBench is
component Register32Bit
    Port ( InData : in STD_LOGIC_VECTOR (31 downto 0);
           Load : in STD_LOGIC;
           Clock : in STD_LOGIC;
           OutData : out STD_LOGIC_VECTOR (31 downto 0));
end component;
signal InData, OutData : std_logic_vector(31 downto 0);
signal Enable, Clock : std_logic;
begin
UUT: Register32Bit Port Map(InData => InData, Load => Enable, Clock => Clock, OutData => OutData);
    Register32Bit_Sim : process begin
        InData <= x"19334866";
        Enable <= '1';
        Clock <= '0';
        wait for 10ns;
        Clock <= '1';
        wait for 10ns;

        InData <= x"abcdef00";
        Clock <= '0';
        wait for 10ns;
        Clock <= '1';
        wait for 10ns;
        
        InData <= x"12345678";
        Enable <= '0';
        Clock <= '0';
        wait for 10ns;
        Clock <= '1';
        wait for 10ns;
        
        InData <= x"00000000";
        Clock <= '0';
        wait for 10ns;
        Clock <= '1';
        wait for 10ns;
    end process;
    
end Behavioral;
