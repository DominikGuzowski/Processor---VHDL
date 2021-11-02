----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.01.2021 18:55:52
-- Design Name: 
-- Module Name: Processor_32Bit_tb - Behavioral
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

entity Processor_32Bit_tb is
--  Port ( );
end Processor_32Bit_tb;

architecture Behavioral of Processor_32Bit_tb is
component Processor_32Bit is
  Port ( Reset, Clk : in STD_LOGIC;
         F_N, F_V, F_C, F_Z : out STD_LOGIC;
         OPCODE : out STD_LOGIC_VECTOR(7 downto 0);
         PC_OUT, Reg00, Reg01, Reg02, Reg03, Reg04, Reg05, Reg06, Reg07, Reg08, Reg09, Reg10, Reg11, Reg12, Reg13, Reg14, Reg15, Reg16, Reg17, Reg18, Reg19, Reg20, Reg21, Reg22, Reg23, Reg24, Reg25, Reg26, Reg27, Reg28, Reg29, Reg30, Reg31, Reg32 : out std_logic_vector(31 downto 0)
        );
end component;
signal OPCODE : std_logic_vector(7 downto 0);
signal PC, Reg00, Reg01, Reg02, Reg03, Reg04, Reg05, Reg06, Reg07, Reg08, Reg09, Reg10, Reg11, Reg12, Reg13, Reg14, Reg15, Reg16, Reg17, Reg18, Reg19, Reg20, Reg21, Reg22, Reg23, Reg24, Reg25, Reg26, Reg27, Reg28, Reg29, Reg30, Reg31, Reg32 : std_logic_vector(31 downto 0);
signal Clk : std_logic := '0';
signal Reset, N, Z, V, C : std_logic;
begin
PROCESSOR: Processor_32Bit Port Map(Reset => Reset, Clk => Clk,
                                  F_N => N, F_Z => Z, F_V => V, F_C => C, OPCODE => OPCODE,
                                  PC_OUT => PC, Reg00 => Reg00, Reg01 => Reg01, Reg02 => Reg02, Reg03 => Reg03, Reg04 => Reg04, Reg05 => Reg05, Reg06 => Reg06, Reg07 => Reg07, Reg08 => Reg08, Reg09 => Reg09, Reg10 => Reg10, Reg11 => Reg11, Reg12 => Reg12, Reg13 => Reg13, Reg14 => Reg14, Reg15 => Reg15, Reg16 => Reg16, Reg17 => Reg17, Reg18 => Reg18, Reg19 => Reg19, Reg20 => Reg20, Reg21 => Reg21, Reg22 => Reg22, Reg23 => Reg23, Reg24 => Reg24, Reg25 => Reg25, Reg26 => Reg26, Reg27 => Reg27, Reg28 => Reg28, Reg29 => Reg29, Reg30 => Reg30, Reg31 => Reg31, Reg32 => Reg32); 
Clk <= not Clk after 400ns;
process begin
Reset <= '1';
wait for 800ns;
Reset <= '0';
wait for 80000ns;
end process;
end Behavioral;
