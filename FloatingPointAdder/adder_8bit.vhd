----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:19:43 12/22/2021 
-- Design Name: 
-- Module Name:    adder_8bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder_8bit is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end adder_8bit;

architecture Behavioral of adder_8bit is

component full_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

signal C : STD_LOGIC_VECTOR (7 downto 0);

begin

full_adder_1 : full_adder port map(A=>A(0), B=>B(0), Cin=>'0', Cout=>C(0), S=>S(0));
full_adder_2 : full_adder port map(A=>A(1), B=>B(1), Cin=>C(0), Cout=>C(1), S=>S(1));
full_adder_3 : full_adder port map(A=>A(2), B=>B(2), Cin=>C(1), Cout=>C(2), S=>S(2));
full_adder_4 : full_adder port map(A=>A(3), B=>B(3), Cin=>C(2), Cout=>C(3), S=>S(3));
full_adder_5 : full_adder port map(A=>A(4), B=>B(4), Cin=>C(3), Cout=>C(4), S=>S(4));
full_adder_6 : full_adder port map(A=>A(5), B=>B(5), Cin=>C(4), Cout=>C(5), S=>S(5));
full_adder_7 : full_adder port map(A=>A(6), B=>B(6), Cin=>C(5), Cout=>C(6), S=>S(6));
full_adder_8 : full_adder port map(A=>A(7), B=>B(7), Cin=>C(6), Cout=>C(7), S=>S(7));

end Behavioral;

