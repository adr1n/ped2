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

sreset <= '0', '1' after 2 ns, '0' after 3 ns;
sclk <= not sclk after 5 ns;
-- Para calcular a média entre 4, 9, 9, 8, 7, 3, 1 e 2 igual a :
sstart <= '0', '1' after 4 ns, '0' after 6 ns;
ssw <= "00010100", "00011001" after 33 ns, "00101001" after 73 ns, "00011000" after 113 ns, "01000111" after 173 ns, "01000011" after 233 ns, "00100001" after 293 ns, "01000010" after 333 ns; 
supdate <= '0', '1' after 44 ns, '0' after 46 ns, '1' after 94 ns, '0' after 96 ns, '1' after 154 ns, '0' after 156 ns, '1' after 214 ns, '0' after 216 ns, '1' after 274 ns, '0' after 276 ns, '1' after 324 ns, '0' after 326 ns, '1' after 374ns , '0' after 376ns;

uut: Top_modu port map(
    reset => sreset,
    clk => sclk,
    sw => ssw,
    update => supdate,
    start => sstart,
    led => sled,
    ready => sready); 
end Behavioral;