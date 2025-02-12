library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_hipo_calc is
--  Port ( );
end tb_hipo_calc;


architecture Behavioral of tb_hipo_calc is

component top_module is
     Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           kcpsm6_interrupt : in STD_LOGIC;
           sw : in std_logic_vector (15 downto 0);
           led : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal sreset, sclk, skcpsm6_interrupt : std_logic := '0';
signal ssw: std_logic_vector(15 downto 0) := (others => '0');
signal sleds: std_logic_vector(7 downto 0) := (others => '0');

begin 


sclk <= not sclk after 5 ns;
-- Para calcular a média entre 4, 9, 9, 8, 7, 3, 1 e 2 igual a :
skcpsm6_interrupt <= '0', '1' after 20 ns, '0' after 26 ns;
ssw <= "0101000001000000";
end Behavioral;