----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.10.2017 04:07:39
-- Design Name: 
-- Module Name: pblaze - Behavioral
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

entity pblaze is
    Port ( cpu_reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           cpu_interrupt : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (7 downto 0));
end pblaze;

architecture Behavioral of pblaze is

component kcpsm6 
generic(                 hwbuild : std_logic_vector(7 downto 0) := X"00";
                interrupt_vector : std_logic_vector(11 downto 0) := X"3FF";
         scratch_pad_memory_size : integer := 64);
port (                   address : out std_logic_vector(11 downto 0);
                     instruction : in std_logic_vector(17 downto 0);
                     bram_enable : out std_logic;
                         in_port : in std_logic_vector(7 downto 0);
                        out_port : out std_logic_vector(7 downto 0);
                         port_id : out std_logic_vector(7 downto 0);
                    write_strobe : out std_logic;
                  k_write_strobe : out std_logic;
                     read_strobe : out std_logic;
                       interrupt : in std_logic;
                   interrupt_ack : out std_logic;
                           sleep : in std_logic;
                           reset : in std_logic;
                             clk : in std_logic);
end component;

component hipo_calc                          
generic(             C_FAMILY : string := "7S"; 
            C_RAM_SIZE_KWORDS : integer := 2;
         C_JTAG_LOADER_ENABLE : integer := 0);
Port (      address : in std_logic_vector(11 downto 0);
        instruction : out std_logic_vector(17 downto 0);
             enable : in std_logic;
                rdl : out std_logic;                    
                clk : in std_logic);
end component;

signal           address : std_logic_vector(11 downto 0);
signal       instruction : std_logic_vector(17 downto 0);
signal       bram_enable : std_logic;
signal           in_port : std_logic_vector(7 downto 0);
signal          out_port : std_logic_vector(7 downto 0);
signal           port_id : std_logic_vector(7 downto 0);
signal      write_strobe : std_logic;
signal    k_write_strobe : std_logic;
signal       read_strobe : std_logic;
signal         interrupt : std_logic;
signal     interrupt_ack : std_logic;
signal      kcpsm6_sleep : std_logic;
signal      kcpsm6_reset : std_logic;

signal               rdl : std_logic;

begin



processor: kcpsm6
    generic map (                 hwbuild => X"00", 
                         interrupt_vector => X"3FF",
                  scratch_pad_memory_size => 64)
    port map(      address => address,
               instruction => instruction,
               bram_enable => bram_enable,
                   port_id => port_id,
              write_strobe => write_strobe,
            k_write_strobe => k_write_strobe,
                  out_port => out_port,
               read_strobe => read_strobe,
                   in_port => in_port,
                 interrupt => interrupt,
             interrupt_ack => interrupt_ack,
                     sleep => kcpsm6_sleep,
                     reset => kcpsm6_reset,
                       clk => clk);
kcpsm6_sleep <= '0';
--interrupt <= interrupt_ack;
                       
program_rom: hipo_calc                    --Name to match your PSM file
     generic map(             C_FAMILY => "7S",   --Family 'S6', 'V6' or '7S'
                     C_RAM_SIZE_KWORDS => 2,      --Program size '1', '2' or '4'
                  C_JTAG_LOADER_ENABLE => 1)      --Include JTAG Loader when set to '1' 
     port map(      address => address,      
                instruction => instruction,
                     enable => bram_enable,
                        rdl => rdl,
                        clk => clk);
kcpsm6_reset <= cpu_reset or rdl;

input_ports: process(clk)
begin
    if rising_edge(clk) then
        if port_id(1 downto 0) = "01" then
            in_port <= sw(7 downto 0);
        elsif port_id(1 downto 0) = "10" then
            in_port <= sw(15 downto 8);         
        end if;
    end if;
end process input_ports;

output_ports: process(clk)
begin
    if rising_edge(clk) then
        if port_id(1 downto 0) = "11" and write_strobe = '1' then
            led <= out_port;            
        end if;
    end if;
end process output_ports;

interrupt_control: process(clk)
    begin
        if rising_edge(clk) then
            if interrupt_ack = '1' then
                interrupt <= '0';
            else
                if cpu_interrupt = '1' then
                    interrupt <= '1';
                else
                    interrupt <= interrupt;
                end if;
            end if;
        end if;
end process interrupt_control;
                  
end Behavioral;
