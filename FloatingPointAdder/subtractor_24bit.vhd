----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:49:41 11/15/2021 
-- Design Name: 
-- Module Name:    subtractor_4bit - Behavioral 
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

entity subtractor_24bit is
    Port ( a : in  STD_LOGIC_VECTOR (23 downto 0);
           b : in  STD_LOGIC_VECTOR (23 downto 0);
			  control : in STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (23 downto 0);
           cout : out  STD_LOGIC);
end subtractor_24bit;

architecture Behavioral of subtractor_24bit is

component ripple_adder_24bit is
    Port ( A : in  STD_LOGIC_VECTOR (23 downto 0);
           B : in  STD_LOGIC_VECTOR (23 downto 0);
			  c0 : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (23 downto 0);
           cout : out  STD_LOGIC);
end component;

signal b_input : STD_LOGIC_VECTOR (23 downto 0);

begin

b_input <= b xor (b'range => control);


ripple_adder : ripple_adder_24bit port map(A=>a,B=>b_input,c0=>control,S=>output,cout=>cout);


end Behavioral;

