----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2023 22:22:01
-- Design Name: 
-- Module Name: Top_module - Behavioral
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

entity Top_module is
    Port ( Dado0 : in std_logic;
           Dado1 : in std_logic;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           S0 : out std_logic;
           S1 : out std_logic);
end Top_module;

architecture Behavioral of Top_module is

component FSM1_Matricula_Otavio is
    Port ( Dado : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           S : out STD_LOGIC);
end component;

component FSM2_Matricula_Andre is
    Port ( Dado : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           S : out STD_LOGIC);
end component;

component Clock05 is
    Port ( clkdiv : in STD_LOGIC;
           reset: in std_logic;
           clk05 : out STD_LOGIC);
end component;

signal sclk05hz: std_logic;
signal sSout0: std_logic;
signal sSout1: std_logic;

begin

clok: Clock05 port map(clkdiv => clk, reset => reset, clk05 => sclk05hz);
FSM1: FSM1_Matricula_Otavio port map( Dado => Dado0, reset => reset, clk => sclk05hz, S => sSout0);
FSM2: FSM2_Matricula_Andre port map( Dado => Dado1, reset => reset, clk => sclk05hz, S => sSout1);
S0 <= sSout0;
S1 <= sSout1;

end Behavioral;
