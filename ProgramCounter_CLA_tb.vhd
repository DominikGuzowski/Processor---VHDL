----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2020 11:35:08
-- Design Name: 
-- Module Name: ProgramCounter_CLA_tb - Behavioral
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

entity ProgramCounter_CLA_tb is
--  Port ( );
end ProgramCounter_CLA_tb;

architecture Behavioral of ProgramCounter_CLA_tb is
component ProgramCounter_CLA is
    Port ( SEADD : in STD_LOGIC_VECTOR (31 downto 0);
           PL : in STD_LOGIC;
           PI : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Address : out STD_LOGIC_VECTOR (31 downto 0);
           Reset : in STD_LOGIC);
end component;
signal SEADD, Address : std_logic_vector(31 downto 0);
signal PL, PI, Reset : std_logic;
signal Clk : std_logic := '0';
begin
PC: ProgramCounter_CLA Port Map(SEADD => SEADD, PL => PL, PI => PI, Clk => Clk, Address => Address, Reset => Reset);
Clk <= not Clk after 300ns;
SIM: process begin
    PL <= '0';
    PI <= '0';
    Reset <= '1';
    SEADD <= "00000000000000000000000000000101";
    wait for 1800ns;
    Reset <= '0';
    PI <= '1';
    wait for 1200ns;
    PL <= '1';
    PI <= '0';
    wait for 600ns;
    PL <= '0';
    PI <= '1';
    wait for 600ns;
end process;
end Behavioral;
