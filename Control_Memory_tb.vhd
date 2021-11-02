----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.01.2021 15:16:05
-- Design Name: 
-- Module Name: Control_Memory_tb - Behavioral
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

entity Control_Memory_tb is
--  Port ( );
end Control_Memory_tb;

architecture Behavioral of Control_Memory_tb is
component Control_Memory is
    Port (FL : out std_logic; -- 0
          RZ : out std_logic; -- 1
          RN : out std_logic; -- 2
          RC : out std_logic; -- 3
          RV : out std_logic; -- 4
          MW : out std_logic; -- 5
          MM : out std_logic; -- 6
          RW : out std_logic; -- 7
          MD : out std_logic; -- 8
          FS : out std_logic_vector(4 downto 0); -- 9 to 13
          MB : out std_logic; -- 14
          TB : out std_logic; -- 15
          TA : out std_logic; -- 16
          TD : out std_logic; -- 17
          PL : out std_logic; -- 18
          PI : out std_logic; -- 19
          IL : out std_logic; -- 20
          MC : out std_logic; -- 21
          MS : out std_logic_vector(2 downto 0); -- 22 to 24
          NA : out std_logic_vector(16 downto 0); -- 25 to 41
          IN_CAR : in std_logic_vector(16 downto 0));
end component;
signal FL, RZ, RN, RC, RV, MW, MM, RW, MD : std_logic;
signal FS : std_logic_vector(4 downto 0);
signal MB : std_logic;
signal TB : std_logic;
signal TA : std_logic;
signal TD : std_logic;
signal PL : std_logic;
signal PI : std_logic;
signal IL : std_logic;
signal MC : std_logic;
signal MS : std_logic_vector(2 downto 0);
signal NA : std_logic_vector(16 downto 0);
signal IN_CAR : std_logic_vector(16 downto 0);      
begin

UUT: Control_Memory Port Map(FL     => FL,    
                             RZ     => RZ,    
                             RN     => RN,    
                             RC     => RC,    
                             RV     => RV,    
                             MW     => MW,    
                             MM     => MM,    
                             RW     => RW,    
                             MD     => MD,    
                             FS     => FS,    
                             MB     => MB,    
                             TB     => TB,    
                             TA     => TA,    
                             TD     => TD,    
                             PL     => PL,    
                             PI     => PI,    
                             IL     => IL,    
                             MC     => MC,    
                             MS     => MS,    
                             NA     => NA,    
                             IN_CAR => IN_CAR);

SIM: process begin
    IN_CAR <= "00000000000000001"; --INIT_1
    wait for 10ns;
    IN_CAR <= "00000000000010000"; --IN_ADD
    wait for 10ns;
    IN_CAR <= "11111111100001101"; --IN_NOT
    wait for 10ns;
end process;
end Behavioral;
