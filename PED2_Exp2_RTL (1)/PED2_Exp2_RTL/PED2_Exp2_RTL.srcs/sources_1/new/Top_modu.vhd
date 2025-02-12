----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2023 19:33:32
-- Design Name: 
-- Module Name: Top_modu - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_modu is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           update : in STD_LOGIC;
           start : in STD_LOGIC;
           sw : in std_logic_vector (7 downto 0);
           led : out STD_LOGIC_VECTOR (7 downto 0);
           ready : out STD_LOGIc;
           sclkout : out STD_LOGIC);
end Top_modu;

architecture Behavioral of Top_modu is

component Clock05 is
    Port ( clkdiv : in STD_LOGIC;
           reset: in std_logic;
           clk05 : out STD_LOGIC);
end component;

component Controle_Bl is
    Port ( start : in STD_LOGIC;
           clk : in STD_LOGIC;
           update : in STD_LOGIC;
           inicio : out STD_LOGIC;
           reset : in STD_LOGIC;
           load_div : out STD_LOGIC;
           load_regx : out STD_LOGIC;
           load_avg : out STD_LOGIC;
           load_sub : out STD_LOGIC;
           load_amo : out STD_LOGIC;
           clear_sub : out STD_LOGIC;
           clear_regx : out STD_LOGIC;
           clear_amo : out STD_LOGIC;
           clear_div : out STD_LOGIC;
           clear_avg : out STD_LOGIC;
           ready : out STD_LOGIC);
end component;

component operacional is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           clear_sub : in STD_LOGIC;
           clear_div : in STD_LOGIC;
           clear_avg : in STD_LOGIC;
           clear_amo : in STD_LOGIC;
           clear_regx : in STD_LOGIC;
           load_sub : in STD_LOGIC;
           load_div : in STD_LOGIC;
           load_avg : in STD_LOGIC;
           load_amo : in STD_LOGIC;
           load_regx : in STD_LOGIC;
           inicio : in STD_LOGIC;
           media : out STD_LOGIC_VECTOR(7 downto 0));
           
end component;



signal sload_div, sload_avg, sload_amo, sload_sub, sload_regx: std_logic := '0';
signal sclear_div, sclear_avg, sclear_amo, sclear_sub, sclear_regx: std_logic := '0';
signal sclkdiv, sinicio: std_logic := '0';

begin

divisor: Clock05 port map(clkdiv => clk, reset => reset, clk05 => sclkdiv); 

Controle: Controle_Bl port map(
            clk   => clk,
            start => start,
            update => update,
            reset => reset,
            load_avg => sload_avg,
            load_amo => sload_amo,
            load_div => sload_div,
            load_sub => sload_sub,
            clear_div => sclear_div,
            clear_avg => sclear_avg,
            clear_amo => sclear_amo,
            clear_sub => sclear_sub,
            ready  => ready, 
            load_regx => sload_regx,
            clear_regx => sclear_regx,
            inicio => sinicio);
            
BlocoOpera: operacional port map(
            clk   => clk,
            x      => sw,
            inicio => sinicio,
            load_avg => sload_avg,
            load_amo => sload_amo,
            load_div => sload_div,
            load_sub => sload_sub,
            clear_div => sclear_div,
            clear_avg => sclear_avg,
            clear_amo => sclear_amo,
            clear_sub => sclear_sub,
             load_regx => sload_regx,
            clear_regx => sclear_regx,
                media => led);
   sclkout <= sclkdiv;
end Behavioral;
