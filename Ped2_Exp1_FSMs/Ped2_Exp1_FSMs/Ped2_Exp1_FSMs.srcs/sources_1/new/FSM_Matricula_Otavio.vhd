----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2023 14:47:17
-- Design Name: 
-- Module Name: FSM_Matricula_Otavio - Behavioral
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

entity FSM_Matricula_Otavio is
    Port ( Dado : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           S : out STD_LOGIC);
end FSM_Matricula_Otavio;

architecture Behavioral of FSM_Matricula_Otavio is
--inserindo o divisor de clock e os sinais de cada estados
component Clock05 is
    Port ( clkdiv : in STD_LOGIC;
           reset: in std_logic;
           clk05 : out STD_LOGIC);
end component;

type tipo_estado is (e0, e1, e2, e3);
signal estado_atual: tipo_estado := e0;
signal estado_proximo: tipo_estado := e0;
signal clk05hz: std_logic;

begin
--atribuindo as entradas para o clk
clk05h: Clock05 port map(clkdiv => clk, reset => reset, clk05 => clk05hz);

--criando o flip flop sincrono para armazenar os estados
process(clk05hz, reset)
begin 
    if reset = '1' then
        estado_atual <= e0;
    elsif rising_edge(clk05hz) then
        estado_atual <= estado_proximo;
    end if;
end process;

-- processo para a mudança de estados
process(estado_atual, Dado)
begin
    case estado_atual is
       when e0 =>
            if Dado = '1' then estado_proximo <=  e0;
            else estado_proximo <= e1;
            end if;
            
       when e1 =>
            if Dado = '1' then estado_proximo <= e0;
            else estado_proximo <= e2;
            end if;
            
       when e2 =>
            if Dado = '1' then estado_proximo <=  e3;
            else estado_proximo <= e1;
            end if;
            
       when e3 =>
            if Dado = '1' then estado_proximo <= e0;
            else estado_proximo <= e1;
            end if;  
               
       when others =>
            estado_proximo <= e0;
         
    end case;
end process;

--processo para escrever nas saídas
process(estado_atual, Dado)
begin
    case estado_atual is
       when e0 =>
            if Dado = '1' then S <=  '0';
            else S <= '0';
            end if;
            
       when e1 =>
            if Dado = '1' then S <= '0';
            else S <= '0';
            end if;
            
        when e2 =>
            if Dado = '1' then S <=  '0';
            else S <= '0';
            end if;
            
       when e3 =>
            if Dado = '1' then S <= '1';
            else S <= '0';
            end if;
                 
       when others =>
            S <= '0';
         
    end case;
end process;

end Behavioral;


