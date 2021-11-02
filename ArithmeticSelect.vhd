----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2020 17:07:02
-- Design Name: 
-- Module Name: ArithmeticSelect - Behavioral
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

entity ArithmeticSelect is
    Port ( B : in STD_LOGIC_VECTOR (31 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR (31 downto 0));
end ArithmeticSelect;

architecture Behavioral of ArithmeticSelect is
constant DELAY: Time:= 5ns;

begin
Data_out(0) <= (B(0) and S0) or (not(B(0)) and S1) after DELAY;
Data_out(1) <= (B(1) and S0) or (not(B(1)) and S1) after DELAY;
Data_out(2) <= (B(2) and S0) or (not(B(2)) and S1) after DELAY;
Data_out(3) <= (B(3) and S0) or (not(B(3)) and S1) after DELAY;
Data_out(4) <= (B(4) and S0) or (not(B(4)) and S1) after DELAY;
Data_out(5) <= (B(5) and S0) or (not(B(5)) and S1) after DELAY;
Data_out(6) <= (B(6) and S0) or (not(B(6)) and S1) after DELAY;
Data_out(7) <= (B(7) and S0) or (not(B(7)) and S1) after DELAY;
Data_out(8) <= (B(8) and S0) or (not(B(8)) and S1) after DELAY;
Data_out(9) <= (B(9) and S0) or (not(B(9)) and S1) after DELAY;
Data_out(10) <= (B(10) and S0) or (not(B(10)) and S1) after DELAY;
Data_out(11) <= (B(11) and S0) or (not(B(11)) and S1) after DELAY;
Data_out(12) <= (B(12) and S0) or (not(B(12)) and S1) after DELAY;
Data_out(13) <= (B(13) and S0) or (not(B(13)) and S1) after DELAY;
Data_out(14) <= (B(14) and S0) or (not(B(14)) and S1) after DELAY;
Data_out(15) <= (B(15) and S0) or (not(B(15)) and S1) after DELAY;
Data_out(16) <= (B(16) and S0) or (not(B(16)) and S1) after DELAY;
Data_out(17) <= (B(17) and S0) or (not(B(17)) and S1) after DELAY;
Data_out(18) <= (B(18) and S0) or (not(B(18)) and S1) after DELAY;
Data_out(19) <= (B(19) and S0) or (not(B(19)) and S1) after DELAY;
Data_out(20) <= (B(20) and S0) or (not(B(20)) and S1) after DELAY;
Data_out(21) <= (B(21) and S0) or (not(B(21)) and S1) after DELAY;
Data_out(22) <= (B(22) and S0) or (not(B(22)) and S1) after DELAY;
Data_out(23) <= (B(23) and S0) or (not(B(23)) and S1) after DELAY;
Data_out(24) <= (B(24) and S0) or (not(B(24)) and S1) after DELAY;
Data_out(25) <= (B(25) and S0) or (not(B(25)) and S1) after DELAY;
Data_out(26) <= (B(26) and S0) or (not(B(26)) and S1) after DELAY;
Data_out(27) <= (B(27) and S0) or (not(B(27)) and S1) after DELAY;
Data_out(28) <= (B(28) and S0) or (not(B(28)) and S1) after DELAY;
Data_out(29) <= (B(29) and S0) or (not(B(29)) and S1) after DELAY;
Data_out(30) <= (B(30) and S0) or (not(B(30)) and S1) after DELAY;
Data_out(31) <= (B(31) and S0) or (not(B(31)) and S1) after DELAY;

end Behavioral;
