----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.10.2020 11:44:01
-- Design Name: 
-- Module Name: Register32Bit - Behavioral
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

entity Register32Bit is
    Port ( InData : in STD_LOGIC_VECTOR (31 downto 0);
           Load : in STD_LOGIC;
           Clock : in STD_LOGIC;
           OutData : out STD_LOGIC_VECTOR (31 downto 0));
end Register32Bit;

architecture Behavioral of Register32Bit is
constant DELAY : Time := 5ns;
begin
process(Clock)
begin
    if(rising_edge(Clock)) then
        if(Load = '1') then
            OutData <= InData after DELAY;
        end if;
    end if;
end process;
end Behavioral;
