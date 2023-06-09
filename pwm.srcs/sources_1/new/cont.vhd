----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.02.2021 20:36:20
-- Design Name: 
-- Module Name: Cont - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Cont is
generic(N: integer :=8);
    Port ( Cup,CLK : in STD_LOGIC;
           duty: in std_logic_vector (7 downto 0);
           ARst : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(N-1 Downto 0));
end Cont;

architecture Behavioral of Cont is
signal sq: STD_LOGIC;
signal cont: Integer range 0 to 2**N-1 :=0;
signal Dutyentero : integer;
begin
dutyentero <= to_integer(unsigned(duty));
con: process(clk, ARst)
begin
    if(ARst = '1')then
        cont <= 0;
    elsif(rising_edge(CLK) and cup = '1')then
        cont <= cont +1;
        else
        cont <= cont;
        
    end if;
Q <= STD_LOGIC_VECTOR(TO_UNSIGNED(cont,N));
end process;



end Behavioral;

