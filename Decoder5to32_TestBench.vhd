----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.10.2020 17:43:13
-- Design Name: 
-- Module Name: Decoder5to32_TestBench - Behavioral
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

entity Decoder5to32_TestBench is
--  Port ( );
end Decoder5to32_TestBench;

architecture Behavioral of Decoder5to32_TestBench is

component Decoder5to32
Port ( DestAdr : in std_logic_vector(4 downto 0);
       TD : in std_logic;
           DestEnable : out std_logic_vector(32 downto 0));
end component;

signal DestAdr : std_logic_vector(4 downto 0);
signal DestEnable : std_logic_vector(32 downto 0);
signal TD : std_logic;

begin
UUT: Decoder5to32 Port Map(DestAdr => DestAdr, TD => TD, DestEnable => DestEnable);

    Decoder_Sim : process
        begin
            TD <= '0';
            DestAdr <= "00000";
             
            wait for 10ns;
            
            DestAdr <= "00001";
             
            wait for 10ns;
            
            DestAdr <= "00010";
             
            wait for 10ns;
            
            DestAdr <= "00011";
             
            wait for 10ns;
            
            DestAdr <= "00100";
             
            wait for 10ns;
            
            DestAdr <= "00101";
             
            wait for 10ns;
            
            DestAdr <= "00110";
             
            wait for 10ns;
            
            DestAdr <= "00111";
             
            wait for 10ns;
            
            DestAdr <= "01000";
             
            wait for 10ns;
            
            DestAdr <= "01001";
             
            wait for 10ns;
            
            DestAdr <= "01010";
             
            wait for 10ns;
            
            DestAdr <= "01011";
             
            wait for 10ns;
            
            DestAdr <= "01100";
             
            wait for 10ns;
            
            DestAdr <= "01101";
             
            wait for 10ns;
            
            DestAdr <= "01110";
             
            wait for 10ns;
            
            DestAdr <= "01111";
             
            wait for 10ns;
            
            DestAdr <= "10000";
             
            wait for 10ns;
            
            DestAdr <= "10001";
             
            wait for 10ns;
            
            DestAdr <= "10010";
             
            wait for 10ns;
            
            DestAdr <= "10011";
             
            wait for 10ns;
            
            DestAdr <= "10100";
             
            wait for 10ns;
            
            DestAdr <= "10101";
             
            wait for 10ns;
            
            DestAdr <= "10110";
             
            wait for 10ns;
            
            DestAdr <= "10111";
             
            wait for 10ns;
            
            DestAdr <= "11000";
             
            wait for 10ns;
            
            DestAdr <= "11001";
             
            wait for 10ns;
            
            DestAdr <= "11010";
             
            wait for 10ns;
            
            DestAdr <= "11011";
             
            wait for 10ns;
            
            DestAdr <= "11100";
             
            wait for 10ns;
            
            DestAdr <= "11101";
             
            wait for 10ns;
            
            DestAdr <= "11110";
             
            wait for 10ns;
            
            DestAdr <= "11111";
             
            wait for 10ns;
            
            TD <= '1';
            
            wait for 10ns;
        end process;
end Behavioral;
