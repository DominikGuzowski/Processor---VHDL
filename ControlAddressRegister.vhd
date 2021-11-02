----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2020 12:17:49
-- Design Name: 
-- Module Name: ControlAddressRegister - Behavioral
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

entity ControlAddressRegister is
    Port ( Data_in : in STD_LOGIC_VECTOR (16 downto 0);
           S : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR (16 downto 0));
end ControlAddressRegister;

architecture Behavioral of ControlAddressRegister is
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
signal muxOutput1, muxOutput2, incrementedAddress, storedAddress, input : std_logic_vector(31 downto 0);
signal S0 : std_logic;
constant DELAY : Time:= 5ns;
constant ResetAddress : std_logic_vector(31 downto 0) := x"00000000";
begin
input <= x"000" & "000" & Data_in;
S0 <= not S after DELAY;
REG: Register32Bit Port Map(InData => muxOutput2, Load => Clk, Clock => Clk, OutData => storedAddress);
AC: ArithmeticCircuit_32Bit Port Map(A => storedAddress, B => resetAddress, S0 => '0', S1 => '0', C => S0, Data_out => incrementedAddress, Cout => open, V => open);
MUX1: Multiplexer2_32Bit Port Map(SRC => S, Data_A => incrementedAddress, Data_B => input, DataOut => muxOutput1);
MUX2: Multiplexer2_32Bit Port Map(SRC => Reset, Data_A => muxOutput1, Data_B => ResetAddress, DataOut => muxOutput2);
Data_out <= storedAddress(16 downto 0);
end Behavioral;
