----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2021 18:05:02
-- Design Name: 
-- Module Name: main - Behavioral
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

entity main is
    Port ( Rst : in STD_LOGIC;
           CLK: IN STD_LOGIC;
           Duty : in STD_LOGIC_VECTOR (7 downto 0);
           Pwm_out : out STD_LOGIC_VECTOR(7 Downto 0));
end main;

architecture Behavioral of main is
component Cont is
generic(N: integer :=8);
    Port ( Cup,CLK : in STD_LOGIC;
           duty: in std_logic_vector (7 downto 0);
           ARst : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(N-1 Downto 0));
end Component;
component Div_1M is
    Port ( CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;
signal CLK7K: STD_LOGIC;
begin
contador: cont port map (Cup => '1', CLK => CLK7K, duty => Duty, ARst => Rst, Q=> Pwm_out);
divisor: Div_1M port map (CLK=>CLK,Q=>CLK7K);

end Behavioral;
