----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2020 10:55:35
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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

entity ProgramCounter is
    Port ( SEADD : in STD_LOGIC_VECTOR (31 downto 0);
           PL : in STD_LOGIC;
           PI : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Address : out STD_LOGIC_VECTOR (31 downto 0);
           Reset : in STD_LOGIC);
end ProgramCounter;

architecture Behavioral of ProgramCounter is

component ArithmeticCircuit_32Bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           C : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR (31 downto 0);
           Cout : out STD_LOGIC;
           V : out STD_LOGIC);
end component;

component Register32Bit
    Port ( InData : in STD_LOGIC_VECTOR (31 downto 0);
           Load : in STD_LOGIC;
           Clock : in STD_LOGIC;
           OutData : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Multiplexer2_32Bit
    Port ( SRC : in STD_LOGIC;
           Data_A, Data_B : in STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal newAddress, storedAddress, calculatedAddress : std_logic_vector(31 downto 0);
signal enableLoad, enableIncrement, loadToRegister : std_logic;
constant startAddress : std_logic_vector(31 downto 0) := x"00000000";
constant DELAY : Time := 5ns;

begin
REG: Register32Bit Port Map(InData => newAddress, Load => loadToRegister, Clock => Clk, OutData => storedAddress);
AC: ArithmeticCircuit_32Bit Port Map(A => storedAddress, B => SEADD, S0 => PL, S1 => '0', C => PI, Data_out => calculatedAddress, Cout => open, V => open);
loadToRegister <= PL or PI or Reset;

MUX: Multiplexer2_32Bit Port Map(SRC => Reset, Data_A => calculatedAddress, Data_B => startAddress, DataOut => newAddress);
Address <= storedAddress;
end Behavioral;
