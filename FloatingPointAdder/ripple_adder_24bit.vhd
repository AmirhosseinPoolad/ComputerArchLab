----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:10:11 11/03/2021 
-- Design Name: 
-- Module Name:    ripple_adder_4bit - Behavioral 
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

entity ripple_adder_24bit is
    Port ( A : in  STD_LOGIC_VECTOR (23 downto 0);
           B : in  STD_LOGIC_VECTOR (23 downto 0);
			  c0 : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (23 downto 0);
           Cout : out  STD_LOGIC);
end ripple_adder_24bit;

architecture Behavioral of ripple_adder_24bit is
---------------COMPONENTS-------------------
component full_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;
--------------------------------------------
signal C : STD_LOGIC_VECTOR (22 downto 0);

begin

full_adder_1 : full_adder port map(A=>A(0), B=>B(0), Cin=>c0, Cout=>C(0), S=>S(0));
full_adder_2 : full_adder port map(A=>A(1), B=>B(1), Cin=>C(0), Cout=>C(1), S=>S(1));
full_adder_3 : full_adder port map(A=>A(2), B=>B(2), Cin=>C(1), Cout=>C(2), S=>S(2));
full_adder_4 : full_adder port map(A=>A(3), B=>B(3), Cin=>C(2), Cout=>C(3), S=>S(3));
full_adder_5 : full_adder port map(A=>A(4), B=>B(4), Cin=>C(3), Cout=>C(4), S=>S(4));
full_adder_6 : full_adder port map(A=>A(5), B=>B(5), Cin=>C(4), Cout=>C(5), S=>S(5));
full_adder_7 : full_adder port map(A=>A(6), B=>B(6), Cin=>C(5), Cout=>C(6), S=>S(6));
full_adder_8 : full_adder port map(A=>A(7), B=>B(7), Cin=>C(6), Cout=>C(7), S=>S(7));
full_adder_9 : full_adder port map(A=>A(8), B=>B(9), Cin=>C(7), Cout=>C(8), S=>S(8));
full_adder_10 : full_adder port map(A=>A(9), B=>B(9), Cin=>C(8), Cout=>C(9), S=>S(9));
full_adder_11 : full_adder port map(A=>A(10), B=>B(10), Cin=>C(9), Cout=>C(10), S=>S(10));
full_adder_12 : full_adder port map(A=>A(11), B=>B(11), Cin=>C(10), Cout=>C(11), S=>S(11));
full_adder_13 : full_adder port map(A=>A(12), B=>B(12), Cin=>C(11), Cout=>C(12), S=>S(12));
full_adder_14 : full_adder port map(A=>A(13), B=>B(13), Cin=>C(12), Cout=>C(13), S=>S(13));
full_adder_15 : full_adder port map(A=>A(14), B=>B(14), Cin=>C(13), Cout=>C(14), S=>S(14));
full_adder_16 : full_adder port map(A=>A(15), B=>B(15), Cin=>C(14), Cout=>C(15), S=>S(15));
full_adder_17 : full_adder port map(A=>A(16), B=>B(16), Cin=>C(15), Cout=>C(16), S=>S(16));
full_adder_18 : full_adder port map(A=>A(17), B=>B(17), Cin=>C(16), Cout=>C(17), S=>S(17));
full_adder_19 : full_adder port map(A=>A(18), B=>B(18), Cin=>C(17), Cout=>C(18), S=>S(18));
full_adder_20 : full_adder port map(A=>A(19), B=>B(19), Cin=>C(18), Cout=>C(19), S=>S(19));
full_adder_21 : full_adder port map(A=>A(20), B=>B(20), Cin=>C(19), Cout=>C(20), S=>S(20));
full_adder_22 : full_adder port map(A=>A(21), B=>B(21), Cin=>C(20), Cout=>C(21), S=>S(21));
full_adder_23 : full_adder port map(A=>A(22), B=>B(22), Cin=>C(21), Cout=>C(22), S=>S(22));
full_adder_24 : full_adder port map(A=>A(23), B=>B(23), Cin=>C(22), Cout=>Cout, S=>S(23));




end Behavioral;

