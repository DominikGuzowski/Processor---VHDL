----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2020 19:01:20
-- Design Name: 
-- Module Name: FlagRegister - Behavioral
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

entity FlagRegister is
    Port ( C : in STD_LOGIC;
           N : in STD_LOGIC;
           V : in STD_LOGIC;
           Z : in STD_LOGIC;
           FL : in STD_LOGIC;
           Clk : in STD_LOGIC;
           ResetNZVC : in STD_LOGIC_VECTOR (3 downto 0);
           NZVC : out STD_LOGIC_VECTOR (3 downto 0));
end FlagRegister;

architecture Behavioral of FlagRegister is

begin
process(Clk) begin
if(rising_edge(Clk)) then
    if (FL = '1') then

        NZVC(3) <= N;
        NZVC(2) <= Z;
        NZVC(1) <= V;
        NZVC(0) <= C;
    end if;
    
    if (ResetNZVC(3) = '1') then
        NZVC(3) <= '0';
    end if;
    
    if (ResetNZVC(2) = '1') then
        NZVC(2) <= '0';
    end if;
    
    if (ResetNZVC(1) = '1') then
        NZVC(1) <= '0';
    end if;
    
    if (ResetNZVC(0) = '1') then
        NZVC(0) <= '0';
    end if;
end if;

end process;
end Behavioral;
