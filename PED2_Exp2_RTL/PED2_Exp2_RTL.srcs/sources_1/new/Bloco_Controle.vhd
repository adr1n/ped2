----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.10.2023 14:55:19
-- Design Name: 
-- Module Name: Bloco_Controle - Behavioral
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

entity Bloco_Controle is
    Port ( start : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           cnt_eq : in STD_LOGIC;
           loadC : out STD_LOGIC;
           loadD : out STD_LOGIC;
           clearC : out STD_LOGIC;
           clearD : out STD_LOGIC;
           ready : out STD_LOGIC);
end Bloco_Controle;

architecture Behavioral of Bloco_Controle is

begin


end Behavioral;
