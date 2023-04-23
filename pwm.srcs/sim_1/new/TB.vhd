----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2021 22:32:50
-- Design Name: 
-- Module Name: TB - Behavioral
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

entity TB is
--  Port ( );
end TB;

architecture Behavioral of TB is
component main is
    Port ( Rst : in STD_LOGIC;
           CLK: IN STD_LOGIC;
           Duty : in STD_LOGIC_VECTOR (7 downto 0);
           Pwm_out : out STD_LOGIC_VECTOR(7 Downto 0));
end component;
component Div_frec is
    Port ( CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;
signal CLK : STD_LOGIC;
signal Q :  STD_LOGIC;
signal T: Time := 10 ns;
SIGNAL Rst :  STD_LOGIC;
SIGNAL Duty :  STD_LOGIC_VECTOR (7 downto 0);
signal Pwm_out :  STD_LOGIC_VECTOR(7 Downto 0);
begin
UTT: main port map (Rst => Rst, CLK =>CLK, Duty => Duty, Pwm_out=>Pwm_out);
Reloj: Process
Begin
    CLK <= '0'; wait for T/2;
    CLK <= '1'; wait for T/2;
end Process;

Stimulus: Process
Begin
    wait for 60000*T;
    Assert false
	report "Simulation completed"
    severity failure;

end Process;
process
begin 
Rst <= '0'; Duty <= "01000000"; wait for 142858 ns;
end process;
end Behavioral;
