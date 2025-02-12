----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.10.2023 22:17:00
-- Design Name: 
-- Module Name: operacional - Behavioral
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

entity operacional is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           clear_sub : in STD_LOGIC;
           clear_div : in STD_LOGIC;
           clear_avg : in STD_LOGIC;
           clear_amo : in STD_LOGIC;
           load_sub : in STD_LOGIC;
           load_div : in STD_LOGIC;
           load_avg : in STD_LOGIC;
           load_amo : in STD_LOGIC;
           inicio : in STD_LOGIC;
           media : out STD_LOGIC_VECTOR (7 downto 0));
           
end operacional;

architecture Behavioral of operacional is

type amostras is array (7 downto 0) of std_logic_vector(7 downto 0);
signal regamostras : amostras := (others => (others => '0'));
signal avg: std_logic_vector(7 downto 0) := (others => '0');
signal sub: std_logic_vector(7 downto 0) := (others => '0');
signal div: std_logic_vector(7 downto 0) := (others => '0');
signal regx: std_logic_vector(7 downto 0) := x;

begin

process(clk, clear_sub)
    begin
    if clear_sub = '1' then
        sub <= (others => '0');
    elsif rising_edge(clk) then
        if load_sub = '1' then
            sub <= std_logic_vector(signed(regx) - signed(regamostras(7)));
        end if;
    end if;
end process;

process(clk, clear_div)
    begin
    if clear_div = '1' then
        div <= (others => '0');
    elsif rising_edge(clk) then
        if load_div = '1' then
            div <= sub(7) & sub(7) & sub(7) & sub(7 downto 3);
        end if;
    end if;
end process;

process(clk, clear_avg)
    begin
    if clear_avg = '1' then
        avg <= (others => '0');
    elsif rising_edge(clk) then
        if load_avg = '1' then
            if inicio = '1' then
                avg <= regx;
            else
                avg <= std_logic_vector(signed(div) + signed(avg));
            end if;
        end if;
    end if;
end process;

process(clk, clear_amo)
    begin
    if clear_amo = '1' then
        regamostras <= (others => (others => '0' ));
    elsif rising_edge(clk) then
        if load_amo = '1' then
            if inicio = '1' then
                 regamostras(0) <= regx;
                 regamostras(1) <= regx;
                 regamostras(2) <= regx;
                 regamostras(3) <= regx;
                 regamostras(4) <= regx;
                 regamostras(5) <= regx;
                 regamostras(6) <= regx;
                 regamostras(7) <= regx;
            else 
                regamostras <= regamostras(6 downto 0) & regx;
            end if;
        end if;
    end if;
end process;

    media <= avg;

end Behavioral;
    

