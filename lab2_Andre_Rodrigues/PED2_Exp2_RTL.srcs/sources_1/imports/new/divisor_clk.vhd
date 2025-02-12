----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.09.2023 10:13:57
-- Design Name: 
-- Module Name: divisor_clk - Behavioral
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



entity Clock05 is
    Port ( clkdiv : in STD_LOGIC;
           reset: in std_logic;
           clk05 : out STD_LOGIC);
end Clock05;

architecture Behavioral of Clock05 is

--criando os sinais, contador, e o sinal que receberá o clock dividido.
signal counter: integer range 0 to 100_000_000 := 0;
signal prescaler: integer := 100_000_000;
signal sclockdiv: std_logic := '1';

begin

--processo que dividirá o clock de 100MHz, para 0.5Hz
clkdivisor: process(clkdiv, reset)
begin
    if reset = '1' then
        counter <= 0;
    elsif rising_edge(clkdiv) then
        if counter = prescaler then
            counter <= 0;
            sclockdiv <= not sclockdiv;
        else
            counter <= counter + 1 ;
        end if;
    end if;
end process;

--atribuindo valor a saída
clk05 <= sclockdiv;

end Behavioral;
