----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.10.2023 11:21:20
-- Design Name: 
-- Module Name: tb_TopModule - Behavioral
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

entity tb_TopModule is
--  Port ( );
end tb_TopModule;

architecture Behavioral of tb_TopModule is

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

signal sDado0: std_logic := '0';
signal sDado1: std_logic:= '0';
signal sreset: std_logic := '0';
signal sclk: std_logic := '0';
signal sSm0: std_logic := '0';
signal sSm1: std_logic := '0';

begin

uut1: FSM1_Matricula_Otavio port map(
    reset => sreset,
    clk => sclk,
    Dado => sDado0,
    S => sSm0);

uut2:FSM2_Matricula_Andre port map(
    reset => sreset,
    clk => sclk,
    Dado => sDado1,
    S => sSm1);
    
    sreset <= '0', '1' after 15 ns, '0' after 25 ns;
    sclk <= not sclk after 5 ns;
    sDado0 <= '0', '1' after 20 ns, '0' after 45 ns, '0' after 55 ns, '1' after 65 ns, '1' after 75 ns; 
    sDado1 <= '0', '1' after 20 ns, '0' after 45 ns, '1' after 55 ns, '1' after 65 ns, '0' after 75 ns; 

end Behavioral;
