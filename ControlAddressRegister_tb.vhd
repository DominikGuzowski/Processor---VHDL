----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2020 12:41:24
-- Design Name: 
-- Module Name: ControlAddressRegister_tb - Behavioral
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

entity ControlAddressRegister_tb is
--  Port ( );
end ControlAddressRegister_tb;

architecture Behavioral of ControlAddressRegister_tb is

component ControlAddressRegister is
    Port ( Data_in : in STD_LOGIC_VECTOR (16 downto 0);
           S : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR (16 downto 0));
end component;

signal Data_in, Data_out : std_logic_vector(16 downto 0);
signal S, Reset : std_logic;
signal Clk : std_logic:= '0';
begin
CAR: ControlAddressRegister Port Map(Data_in => Data_in, S => S, Clk => Clk, Reset => Reset, Data_out => Data_out);
Clk <= not Clk after 200ns;
process begin
    Reset <= '1';
    wait for 400ns;
    Reset <= '0';
    Data_in <= "00000000000010000";
    S <= '0';
    wait for 2000ns;
    S <= '1';
    wait for 400ns;
    S <= '0';
    wait for 1600ns;
    Reset <= '1';
    wait for 400ns;
end process;
end Behavioral;
