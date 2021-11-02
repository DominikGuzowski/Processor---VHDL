----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2020 22:13:50
-- Design Name: 
-- Module Name: DataPath_32Bit - Behavioral
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

entity DataPath_CLA is
    Port ( Control_Word : in STD_LOGIC_VECTOR(22 downto 0);
           Constant_In, Data_In: in STD_LOGIC_VECTOR (31 downto 0):= x"00000000";
           Clk, TD, TA, TB: in STD_LOGIC;
           N, Z, V, C : out STD_LOGIC;
           Address_Out : out STD_LOGIC_VECTOR (31 downto 0);
           Data_Out : out STD_LOGIC_VECTOR (31 downto 0);
           Reg00, Reg01, Reg02, Reg03, Reg04, Reg05, Reg06, Reg07, Reg08, Reg09, Reg10, Reg11, Reg12, Reg13, Reg14, Reg15, Reg16, Reg17, Reg18, Reg19, Reg20, Reg21, Reg22, Reg23, Reg24, Reg25, Reg26, Reg27, Reg28, Reg29, Reg30, Reg31, Reg32 : out std_logic_vector(31 downto 0)
           );
end DataPath_CLA;

architecture Behavioral of DataPath_CLA is
component FunctionalUnit_CLA is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           FS : in STD_LOGIC_VECTOR (4 downto 0);
           Data_Out : out STD_LOGIC_VECTOR (31 downto 0);
           C : out STD_LOGIC;
           V : out STD_LOGIC;
           N : out STD_LOGIC;
           Z : out STD_LOGIC
           );
end component;

component RegisterFile32Bit is
    Port (Clk, Write, TD, TA, TB: in STD_LOGIC;
           DestAddress, MuxSourceA, MuxSourceB: in STD_LOGIC_VECTOR (4 downto 0);
           InDataFlow : in STD_LOGIC_VECTOR (31 downto 0);
           DataOut_A, DataOut_B : out std_logic_vector(31 downto 0);
           Reg00, Reg01, Reg02, Reg03, Reg04, Reg05, Reg06, Reg07, Reg08, Reg09, Reg10, Reg11, Reg12, Reg13, Reg14, Reg15, Reg16, Reg17, Reg18, Reg19, Reg20, Reg21, Reg22, Reg23, Reg24, Reg25, Reg26, Reg27, Reg28, Reg29, Reg30, Reg31, Reg32 : out std_logic_vector(31 downto 0)
           );
end component;

component Multiplexer2_32Bit
    Port ( SRC : in STD_LOGIC;
           Data_A, Data_B : in STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal BusA, BusB, BusC, BusD, FU_Bus : std_logic_vector(31 downto 0);
signal C0, Z0, N0, V0 : std_logic := '0';

constant DELAY: Time:= 5ns;
begin
REG: RegisterFile32Bit Port Map(Clk => Clk, Write => Control_Word(0), TD => TD, TA => TA, TB => TB, DestAddress => Control_Word(22 downto 18),
                                MuxSourceA => Control_Word(17 downto 13), MuxSourceB => Control_Word(12 downto 8), 
                                InDataFlow => BusD, DataOut_A => BusA, DataOut_B => BusB,
                                Reg00 => Reg00, Reg01 => Reg01, Reg02 => Reg02, Reg03 => Reg03, Reg04 => Reg04, Reg05 => Reg05, Reg06 => Reg06, Reg07 => Reg07, Reg08 => Reg08, Reg09 => Reg09, Reg10 => Reg10, Reg11 => Reg11, Reg12 => Reg12, Reg13 => Reg13, Reg14 => Reg14, Reg15 => Reg15, Reg16 => Reg16, Reg17 => Reg17, Reg18 => Reg18, Reg19 => Reg19, Reg20 => Reg20, Reg21 => Reg21, Reg22 => Reg22, Reg23 => Reg23, Reg24 => Reg24, Reg25 => Reg25, Reg26 => Reg26, Reg27 => Reg27, Reg28 => Reg28, Reg29 => Reg29, Reg30 => Reg30, Reg31 => Reg31, Reg32 => Reg32); 
                                
FUNC: FunctionalUnit_CLA Port Map(A => BusA, B => BusC, FS => Control_Word(6 downto 2), Data_Out => FU_Bus, C => C0, V => V0, N => N0, Z => Z0);
MUXB: Multiplexer2_32Bit Port Map(SRC => Control_Word(7), Data_A => BusB, Data_B => Constant_in, DataOut => BusC);
MUXD: Multiplexer2_32Bit Port Map(SRC => Control_Word(1), Data_A => FU_Bus, Data_B => Data_In, DataOut => BusD);

--process(Clk) begin --prevents flags from being set/unset while the ALU is still calculating the result
--    if(rising_edge(Clk)) then
--        if(Control_Word(6) = '0') then --Update only if operation done by ALU, not shifter.
--            if(N0 = '1') then --Prevents uninitialised signals from producing a 'U'.
--                N <= N0 after DELAY;
--            else 
--                N <= '0' after DELAY;
--            end if;
            
--            if(Z0 = '1') then --Prevents uninitialised signals from producing a 'U'.
--                Z <= Z0 after DELAY;
--            else 
--                Z <= '0' after DELAY;
--            end if;
            
--            if(V0 = '1') then --Prevents uninitialised signals from producing a 'U'.
--                V <= V0 after DELAY;
--            else 
--                V <= '0' after DELAY;
--            end if;
            
--            if(C0 = '1') then --Prevents uninitialised signals from producing a 'U'.
--                C <= C0 after DELAY;
--            else 
--                C <= '0' after DELAY;
--            end if;
--        end if;
--    end if;
--end process;     
N <= N0;
Z <= Z0;
C <= C0;
V <= V0;
Data_Out <= BusC;
Address_Out <= BusA;

end Behavioral;  