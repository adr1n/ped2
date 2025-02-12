----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2023 08:52:13
-- Design Name: 
-- Module Name: Divisor_clk - Behavioral
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
    Port ( clk : in STD_LOGIC;
           reset: in std_logic;
           clkdiv : out STD_LOGIC);
end Clock05;

architecture Behavioral of Clock05 is

--criando os sinais, contador, e o sinal que receberá o clock dividido.
signal counter: integer range 0 to 300_000 := 0;
signal prescaler: integer := 300_000;
signal sclockdiv: std_logic := '1';

begin

--processo que dividirá o clock de 100MHz, para 0.5Hz
clkdivisor: process(clk, reset)
begin
    if reset = '1' then
        counter <= 0;
    elsif rising_edge(clk) then
        if counter = prescaler then
            counter <= 0;
            sclockdiv <= not sclockdiv;
        else
            counter <= counter + 1 ;
        end if;
    end if;
end process;

--atribuindo valor a saída
clkdiv <= sclockdiv;

end Behavioral;
