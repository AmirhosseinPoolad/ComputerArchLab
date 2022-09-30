----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:48:32 12/22/2021 
-- Design Name: 
-- Module Name:    normalizer - Behavioral 
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity normalizer is
    Port ( m : in  STD_LOGIC_VECTOR (23 downto 0);
	        cin: in STD_LOGIC;
           e : in  STD_LOGIC_VECTOR (7 downto 0);
           s : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end normalizer;

architecture Behavioral of normalizer is

component mux2x1 is
    Port ( in0 : in  STD_LOGIC_VECTOR (23 downto 0);
           in1 : in  STD_LOGIC_VECTOR (23 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (23 downto 0));
end component;

component adder_8bit is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal normalized_mantissa : STD_LOGIC_VECTOR(23 downto 0);
signal m_shift : STD_LOGIC_VECTOR(23 downto 0);
signal normalized_exponent : STD_LOGIC_VECTOR(7 downto 0);
signal cin_vector : STD_LOGIC_VECTOR(7 downto 0);

begin

m_shift(22 downto 0) <= m(23 downto 1);
m_shift(23) <= '0';
cin_vector(0) <= cin;
cin_vector(7 downto 1) <= "0000000";
mux_instance : mux2x1 port map(in0=>m, in1=>m_shift, sel=>cin,output=>normalized_mantissa);
adder1 : adder_8bit port map(a=>e,b=>cin_vector,s=>normalized_exponent);
output(31) <= s;
output(30 downto 23) <= normalized_exponent;
output(22 downto 0) <= normalized_mantissa(22 downto 0);

end Behavioral;

