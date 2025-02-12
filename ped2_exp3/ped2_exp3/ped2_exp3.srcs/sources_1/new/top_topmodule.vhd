----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.11.2023 20:31:32
-- Design Name: 
-- Module Name: top_topmodule - Behavioral
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

entity top_topmodule is
    Port ( clk : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR(7 downto 0));
end top_topmodule;

architecture Behavioral of top_topmodule is

component pblaze is
    Port ( cpu_reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           cpu_interrupt : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (7 downto 0));
end component;

COMPONENT vio_0
  PORT (
    clk : IN STD_LOGIC;
    probe_in0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0) 
  );
END COMPONENT;

signal scpu_reset : std_logic;
signal scpu_interrupt : std_logic;
signal sled : std_logic_vector(7 downto 0);
signal ssw : std_logic_vector(15 downto 0);

begin

myvio : vio_0
  PORT MAP (
    clk => clk,
    probe_in0 => sled,
    probe_out0 => ssw,
    probe_out1(0) => scpu_reset,
    probe_out2(0) => scpu_interrupt
  );

maquina: pblaze
    Port map (
    clk => clk,
    led => sled,
    sw => ssw,
    cpu_reset => scpu_reset,
    cpu_interrupt => scpu_interrupt
    ); 

led <= sled;

end Behavioral;
