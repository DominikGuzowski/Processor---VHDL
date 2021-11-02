----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.10.2020 19:36:18
-- Design Name: 
-- Module Name: RegisterFile32Bit_TestBench - Behavioral
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

entity RegisterFile32Bit_TestBench is
--  Port ( );
end RegisterFile32Bit_TestBench;

architecture Behavioral of RegisterFile32Bit_TestBench is
component RegisterFile32Bit is
    Port (Clk, Write, TD, TA, TB: in STD_LOGIC;
           DestAddress, MuxSourceA, MuxSourceB: in STD_LOGIC_VECTOR (4 downto 0);
           InDataFlow : in STD_LOGIC_VECTOR (31 downto 0);
           DataOut_A, DataOut_B : out std_logic_vector(31 downto 0);
           Reg00, Reg01, Reg02, Reg03, Reg04, Reg05, Reg06, Reg07, Reg08, Reg09, Reg10, Reg11, Reg12, Reg13, Reg14, Reg15, Reg16, Reg17, Reg18, Reg19, Reg20, Reg21, Reg22, Reg23, Reg24, Reg25, Reg26, Reg27, Reg28, Reg29, Reg30, Reg31, Reg32 : out std_logic_vector(31 downto 0)
           );
end component;
signal Write : std_logic;
signal Clk : std_logic := '0';
signal DestAddress, MuxSourceA, MuxSourceB : std_logic_vector(4 downto 0);
signal Data, A, B : std_logic_vector(31 downto 0); 
signal TD, TA, TB : std_logic;

--signal 
--Reg00, Reg01, Reg02, Reg03, 
--Reg04, Reg05, Reg06, Reg07, 
--Reg08, Reg09, Reg10, Reg11, 
--Reg12, Reg13, Reg14, Reg15, 
--Reg16, Reg17, Reg18, Reg19, 
--Reg20, Reg21, Reg22, Reg23, 
--Reg24, Reg25, Reg26, Reg27, 
--Reg28, Reg29, Reg30, Reg31, Reg32 : std_logic_vector(31 downto 0);

constant delay: Time:= 10ns;
begin
UUT: RegisterFile32Bit Port Map(Clk => Clk, Write => Write, DestAddress => DestAddress, MuxSourceA => MuxSourceA, MuxSourceB => MuxSourceB, InDataFlow => Data, DataOut_A => A, DataOut_B => B,
                            TD => TD, TA => TA, TB => TB);
                           -- Reg00 => Reg00, Reg01 => Reg01, Reg02 => Reg02, Reg03 => Reg03, Reg04 => Reg04, Reg05 => Reg05, Reg06 => Reg06, Reg07 => Reg07, Reg08 => Reg08, Reg09 => Reg09, Reg10 => Reg10, Reg11 => Reg11, Reg12 => Reg12, Reg13 => Reg13, Reg14 => Reg14, Reg15 => Reg15, Reg16 => Reg16, Reg17 => Reg17, Reg18 => Reg18, Reg19 => Reg19, Reg20 => Reg20, Reg21 => Reg21, Reg22 => Reg22, Reg23 => Reg23, Reg24 => Reg24, Reg25 => Reg25, Reg26 => Reg26, Reg27 => Reg27, Reg28 => Reg28, Reg29 => Reg29, Reg30 => Reg30, Reg31 => Reg31, Reg32 => Reg32); 

                
    RegisterFile32Bit_Sim : process begin
        TD <= '0';
        TA <= '0';
        TB <= '0';
        Write <= '1';
        Clk <= '0';
        DestAddress <= "00000";
        Data <= x"19334866";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "00001";
        Data <= x"19334865";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "00010";
        Data <= x"19334864";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "00011";
        Data <= x"19334863";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "00100";
        Data <= x"19334862";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "00101";
        Data <= x"19334861";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "00110";
        Data <= x"19334860";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "00111";
        Data <= x"19334859";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "01000";
        Data <= x"19334858";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "01001";
        Data <= x"19334857";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "01010";
        Data <= x"19334856";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "01011";
        Data <= x"19334855";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "01100";
        Data <= x"19334854";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "01101";
        Data <= x"19334853";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "01110";
        Data <= x"19334852";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "01111";
        Data <= x"19334851";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "10000";
        Data <= x"19334850";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "10001";
        Data <= x"19334849";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "10010";
        Data <= x"19334848";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "10011";
        Data <= x"19334847";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "10100";
        Data <= x"19334846";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "10101";
        Data <= x"19334845";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "10110";
        Data <= x"19334844";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "10111";
        Data <= x"19334843";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "11000";
        Data <= x"19334842";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "11001";
        Data <= x"19334841";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "11010";
        Data <= x"19334840";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "11011";
        Data <= x"19334839";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "11100";
        Data <= x"19334838";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "11101";
        Data <= x"19334837";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "11110";
        Data <= x"19334836";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        DestAddress <= "11111";
        Data <= x"19334835";
        wait for delay;
        Clk <= '1';
        wait for delay;
        
        Write <= '0';
        
        Clk <= '0';
        MuxSourceA <= "00000";
        MuxSourceB <= "11111";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "00001";
        MuxSourceB <= "11110";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "00010";
        MuxSourceB <= "11101";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "00011";
        MuxSourceB <= "11100";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "00100";
        MuxSourceB <= "11011";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "00101";
        MuxSourceB <= "11010";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "00110";
        MuxSourceB <= "11001";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "00111";
        MuxSourceB <= "11000";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "01000";
        MuxSourceB <= "10111";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "01001";
        MuxSourceB <= "10110";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "01010";
        MuxSourceB <= "10101";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "01011";
        MuxSourceB <= "10100";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "01100";
        MuxSourceB <= "10011";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "01101";
        MuxSourceB <= "10010";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "01110";
        MuxSourceB <= "10001";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "01111";
        MuxSourceB <= "10000";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "10000";
        MuxSourceB <= "01111";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "10001";
        MuxSourceB <= "01110";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "10010";
        MuxSourceB <= "01101";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "10011";
        MuxSourceB <= "01100";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "10100";
        MuxSourceB <= "01011";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "10101";
        MuxSourceB <= "01010";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "10110";
        MuxSourceB <= "01001";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "10111";
        MuxSourceB <= "01000";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "11000";
        MuxSourceB <= "00111";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "11001";
        MuxSourceB <= "00110";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "11010";
        MuxSourceB <= "00101";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "11011";
        MuxSourceB <= "00100";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "11100";
        MuxSourceB <= "00011";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "11101";
        MuxSourceB <= "00010";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "11110";
        MuxSourceB <= "00001";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        MuxSourceA <= "11111";
        MuxSourceB <= "00000";
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        TD <= '1';
        Data <= x"10101010";
        Write <= '1';
        wait for delay;
        Clk <= '1';
        wait for delay;
        Clk <= '0';
        wait for delay;
        Clk <= '1';
        TB <= '1';
        TA <= '1';
        wait for delay;
        --Sim time: 1300ns

    end process;      
end Behavioral;
