----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.10.2023 15:58:30
-- Design Name: 
-- Module Name: FSM_Controle - Behavioral
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

entity FSM_Controle is
    Port ( clk: in Std_logic;
           start : in STD_LOGIC;
           reset: in std_logic;
           loadS: out std_logic_vector (5 downto 0);
           clearS: out std_logic_vector (5 downto 0);
           loaddiv: out std_logic;
           cleardiv: out std_logic;
           ready : out STD_LOGIC);
end FSM_Controle;

architecture Behavioral of FSM_Controle is

type tipo_estado is (espera , add0, add1, add2, div ,saida);
signal estado_atual, proximo_estado : tipo_estado := espera;

begin

--processo para ir para registrar os estados

 process(clk,reset)
    begin
        if reset='1' then
            estado_atual <= espera;
        elsif rising_edge(clk) then
            estado_atual <= proximo_estado;
        end if;
    end process;
    
--processo para a transição de estados
   process(clk, estado_atual, start)
   begin
        case estado_atual is
             when espera =>
                if start = '1' then
                    proximo_estado <= espera;
                else
                    proximo_estado <= add0;
                end if;
             when add0 => proximo_estado <= add1;
             when add1 => proximo_estado <= add2;
             when add2 => proximo_estado <= div;
             when div => proximo_estado <= saida;
             when saida => proximo_estado <= espera;
             when others => proximo_estado <= espera;
        end case;
   end process;
   
   --processo para as saídas
   process(clk, estado_atual, start)
   begin
        case estado_atual is
             when espera =>
              loadS <= (others => '0');
              clearS <= (others => '1');
              loaddiv <='0';
              cleardiv <= '1';
              ready <= '0';
             when add0 =>
             loadS <= "000111";
             clearS <= "111000";
             loaddiv <='0';
              cleardiv <= '1';
             ready <= '0';
             when add1 =>
             loadS <= "011111";
             clearS <= "100000";
             loaddiv <='0';
             cleardiv <= '1';
             ready <= '0';
             when add2 => 
              loadS <= (others => '1');
              clearS <= (others => '0');
              loaddiv <='0';
              cleardiv <= '1';
              ready <= '0';
             when div =>
              loadS <= (others => '1');
              clearS <= (others => '0');
              ready <= '0';
              loaddiv <='1';
              cleardiv <= '0';
              ready <= '0';
             when saida =>
             loadS <= (others => '1');
              clearS <= (others => '0');
              ready <= '0';
              loaddiv <='1';
              cleardiv <= '0';
              ready <= '1';
        end case;
   end process;

end Behavioral;
