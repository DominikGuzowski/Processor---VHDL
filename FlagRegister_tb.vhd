----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2021 19:55:56
-- Design Name: 
-- Module Name: FlagRegister_tb - Behavioral
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

entity FlagRegister_tb is
--  Port ( );
end FlagRegister_tb;

architecture Behavioral of FlagRegister_tb is
component FlagRegister is --Done
    Port ( C : in STD_LOGIC;
           N : in STD_LOGIC;
           V : in STD_LOGIC;
           Z : in STD_LOGIC;
           FL : in STD_LOGIC;
           Clk : in STD_LOGIC;
           ResetNZVC : in STD_LOGIC_VECTOR (3 downto 0);
           NZVC : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal C, N, V, Z, FL : std_logic;
signal Clk : std_logic := '0';
signal NZVC, ResetNZVC : std_logic_vector(3 downto 0);
begin

UUT: FlagRegister Port Map(C => C, V => V, Z => Z, N => N, FL => FL, Clk => Clk, NZVC => NZVC, ResetNZVC => ResetNZVC);
Clk <= not Clk after 10ns;
process begin

    FL <= '0';
    ResetNZVC <= "1111";
    C <= '1';
    Z <= '1';
    N <= '1';
    V <= '1';
    wait for 20ns;
    ResetNZVC <= "0000";
    FL <= '1';
    wait for 20ns;
    Z <= '0';
    wait for 20ns;
    ResetNZVC <= "1000";
    wait for 20ns;
end process;
end Behavioral;
