library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_lab_2 is
--  Port ( );
end tb_lab_2;


architecture Behavioral of tb_lab_2 is

component Top_modu is
     Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           update : in STD_LOGIC;
           start : in STD_LOGIC;
           sw : in std_logic_vector (7 downto 0);
           led : out STD_LOGIC_VECTOR (7 downto 0);
           ready : out STD_LOGIC);
end component;

signal sreset, sclk, supdate, sstart, sready : std_logic := '0';
signal ssw, sled: std_logic_vector(7 downto 0) := (others => '0');

begin 

sreset <= '0', '1' after 3 ns, '0' after 4 ns;
sclk <= not sclk after 5 ns;
-- Para calcular a média entre 4, 9, 9, 8, 7, 3, 1 e 2 igual a :
sstart <= '0', '1' after 4 ns, '0' after 11 ns;
ssw <= "00010100", "00011001" after 13 ns, "00101001" after 53 ns, "00011000" after 93 ns, "01000111" after 133 ns, "01000011" after 173 ns, "00100001" after 213 ns, "01000010" after 253 ns; 
supdate <= '0', '1' after 14 ns, '0' after 16 ns, '1' after 54 ns, '0' after 56 ns, '1' after 94 ns, '0' after 96 ns, '1' after 134 ns, '0' after 136 ns, '1' after 174 ns, '0' after 176 ns, '1' after 214 ns, '0' after 216 ns, '1' after 252 ns, '0' after 256 ns; 
end Behavioral;