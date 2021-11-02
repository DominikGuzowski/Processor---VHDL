----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2020 11:22:52
-- Design Name: 
-- Module Name: FullAdder_TestBench - Behavioral
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

entity FullAdder_TestBench is
--  Port ( );
end FullAdder_TestBench;

architecture Behavioral of FullAdder_TestBench is
component FullAdder
    Port(A, B, Carry_in : in std_logic;
         Sum, Carry_Out : out std_logic);
end component;
signal A, B, C, S, C0: std_logic;
signal Clk : std_logic:='0';
begin
UUT: FullAdder Port Map(A => A, B => B, Carry_in => C, Sum => S, Carry_out => C0);
Clk <= not Clk after 15ns;
FA_Sim: process begin
    A <= '0';
	B <= '0';
	C <= '0';
	wait for 30ns;
	
	A <= '0';
	B <= '0';
	C <= '1';
	wait for 30ns;
	
	A <= '0';
	B <= '1';
	C <= '0';
	wait for 30ns;
	
	A <= '0';
	B <= '1';
	C <= '1';
	wait for 30ns;
	
	A <= '1';
	B <= '0';
	C <= '0';
	wait for 30ns;
	
	A <= '1';
	B <= '0';
	C <= '1';
	wait for 30ns;
	
	A <= '1';
	B <= '1';
	C <= '0';
	wait for 30ns;
	
	A <= '1';
	B <= '1';
	C <= '1';
	wait for 30ns;
    end process;

end Behavioral;
