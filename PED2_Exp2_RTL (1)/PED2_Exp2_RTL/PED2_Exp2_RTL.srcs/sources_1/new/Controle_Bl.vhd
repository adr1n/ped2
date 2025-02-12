----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.10.2023 14:56:36
-- Design Name: 
-- Module Name: Controle_Bl - Behavioral
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

entity Controle_Bl is
    Port ( start : in STD_LOGIC;
           clk : in STD_LOGIC;
           update : in STD_LOGIC;
           inicio : out STD_LOGIC;
           reset : in STD_LOGIC;
           load_div : out STD_LOGIC;
           load_avg : out STD_LOGIC;
           load_sub : out STD_LOGIC;
           load_amo : out STD_LOGIC;
           load_regx : out STD_LOGIC;
           clear_sub : out STD_LOGIC;
           clear_regx : out STD_LOGIC;
           clear_amo : out STD_LOGIC;
           clear_div : out STD_LOGIC;
           clear_avg : out STD_LOGIC;
           ready : out STD_LOGIC);
end Controle_Bl;

architecture Behavioral of Controle_Bl is

type tipo_estado is (espera, inicializa, desloca, sub, div, add, pronto);
signal estado_atual,proximo_estado : tipo_estado := espera;

begin

    -- processo para registrar o estado
    process(clk,reset)
    begin
        if reset='1' then
            estado_atual <= espera;
        elsif rising_edge(clk) then
            estado_atual <= proximo_estado;
        end if;
    end process;
    -- processo para transicao de estados
    process(estado_atual, start, update)
    begin
        case estado_atual is 
            when espera =>
                if start = '1' then 
                    proximo_estado <= inicializa;
                else 
                    proximo_estado <= espera;
                end if;
            when inicializa =>
               proximo_estado <= pronto;
            when pronto =>
            --foi implementado o "update" para permitir a continuação da média iterativa
                if update = '1' then
                    proximo_estado <= sub;
                else
                    proximo_estado <= pronto;
                end if;   
            when sub =>
                proximo_estado <= div;
            when div =>
                proximo_estado <= add;
            when add =>
                proximo_estado <= desloca;
            when desloca =>
                proximo_estado <= pronto;
        
            when others =>
                proximo_estado <= espera;
          end case;
     end process;
     
-- processo das saidas    
    process(estado_atual)
    begin
        -- a saida inicio foi implementada para ter conhecimento se ele está no estado de inicializacao
        case estado_atual is 
            when espera =>
                load_div <= '0'; load_sub <= '0'; load_avg <= '0'; load_amo <= '0'; load_regx <= '1';
                clear_div <= '1'; clear_sub <= '1'; clear_avg <= '1'; clear_amo <= '1'; clear_regx <= '0';
                ready <= '0'; inicio <= '0';
            when inicializa =>
                load_div <= '0'; load_sub <= '0'; load_avg <= '1'; load_amo <= '1'; load_regx <= '1';
                clear_div <= '0'; clear_sub <= '0'; clear_avg <= '0'; clear_amo <= '0'; clear_regx <= '0';
                ready <= '0'; inicio <= '1';
            when sub =>
                load_div <= '0'; load_sub <= '1'; load_avg <= '0'; load_amo <= '0'; load_regx <= '0';
                clear_div <= '0'; clear_sub <= '0'; clear_avg <= '0'; clear_amo <= '0'; clear_regx <= '0';
                ready <= '0'; inicio <= '0';
            when div =>
                load_div <= '1'; load_sub <= '0'; load_avg <= '0'; load_amo <= '0'; load_regx <= '0';
                clear_div <= '0'; clear_sub <= '0'; clear_avg <= '0'; clear_amo <= '0'; clear_regx <= '0';
                ready <= '0'; inicio <= '0';
            when add =>
                load_div <= '0'; load_sub <= '0'; load_avg <= '1'; load_amo <= '0'; load_regx <= '0';
                clear_div <= '0'; clear_sub <= '0'; clear_avg <= '0'; clear_amo <= '0'; clear_regx <= '0';
                ready <= '0'; inicio <= '0';
            when desloca =>
                load_div <= '0'; load_sub <= '0'; load_avg <= '0'; load_amo <= '1'; load_regx <= '0';
                clear_div <= '0'; clear_sub <= '0'; clear_avg <= '0'; clear_amo <= '0'; clear_regx <= '0';
                ready <= '0'; inicio <= '0';
            when pronto =>
                load_div <= '0'; load_sub <= '0'; load_avg <= '0'; load_amo <= '0'; load_regx <= '1';
                clear_div <= '0'; clear_sub <= '0'; clear_avg <= '0'; clear_amo <= '0'; clear_regx <= '0';
                ready <= '1'; inicio <= '0';
            when others => 
                load_div <= '0'; load_sub <= '0'; load_avg <= '0'; load_amo <= '0'; load_regx <= '0';
                clear_div <= '1'; clear_sub <= '1'; clear_avg <= '1'; clear_amo <= '1'; clear_regx <= '1';
                ready <= '0'; inicio <= '0';
          end case;
     end process;

end Behavioral;
