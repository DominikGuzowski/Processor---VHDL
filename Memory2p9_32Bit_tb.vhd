----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2020 14:48:23
-- Design Name: 
-- Module Name: Memory2p9_32Bit_tb - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memory2p9_32Bit_tb is
--  Port ( );
end Memory2p9_32Bit_tb;

architecture Behavioral of Memory2p9_32Bit_tb is
component Memory2p9_32Bit is
    Port ( Address : in STD_LOGIC_VECTOR (31 downto 0);
           MW : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Data_in : in STD_LOGIC_VECTOR (31 downto 0);
           Data_out : out STD_LOGIC_VECTOR (31 downto 0));
end component;
signal Adr : std_logic_vector(31 downto 0);
signal MW : std_logic;
signal Clk : std_logic := '0';
signal Data_in, Data_out : std_logic_vector(31 downto 0);
begin
MEM: Memory2p9_32Bit Port Map( Address => Adr,
                               MW => MW,
                               Clk => Clk,
                               Data_in => Data_in,
                               Data_out => Data_out);

Clk <= not Clk after 100ns;
process begin
MW <= '1';
Data_in <= x"12345678";
Adr <= x"00000001";
wait for 200ns;
Data_in <= x"11111111";
Adr <= x"00000002";
wait for 200ns;
MW <= '0';
Adr <= x"00000000";
wait for 200ns;
Adr <= x"00000001";
wait for 200ns;
Adr <= x"00000030";
wait for 200ns;
end process;
end Behavioral;
