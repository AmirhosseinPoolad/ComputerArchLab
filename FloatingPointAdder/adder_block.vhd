----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:56:57 12/22/2021 
-- Design Name: 
-- Module Name:    adder_block - Behavioral 
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

entity adder_block is
    Port ( sa : in  STD_LOGIC;
           sb : in  STD_LOGIC;
           a : in  STD_LOGIC_VECTOR (23 downto 0);
           b : in  STD_LOGIC_VECTOR (23 downto 0);
			  comp : in STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (23 downto 0);
			  sign : out STD_LOGIC;
			  carry : out STD_LOGIC);
end adder_block;

architecture Behavioral of adder_block is

component subtractor_24bit is
    Port ( a : in  STD_LOGIC_VECTOR (23 downto 0);
           b : in  STD_LOGIC_VECTOR (23 downto 0);
			  control : in STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (23 downto 0);
           cout : out  STD_LOGIC);
end component;

component complementor is
    Port ( input : in  STD_LOGIC_VECTOR (23 downto 0);
           control : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (23 downto 0));
end component;

component mux2x1 is
    Port ( in0 : in  STD_LOGIC_VECTOR (23 downto 0);
           in1 : in  STD_LOGIC_VECTOR (23 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (23 downto 0));
end component;

signal a_out : STD_LOGIC_VECTOR (23 downto 0);
signal a_carry : STD_LOGIC;
signal b_out : STD_LOGIC_VECTOR (23 downto 0);
signal b_complemented : STD_LOGIC_VECTOR (23 downto 0);
signal b_carry : STD_LOGIC;

signal is_sign_diff : STD_LOGIC;

begin

is_sign_diff <= sa xor sb;
-- comp => a<b
--case1: same signs
subtractor_instance1: subtractor_24bit port map(a=>a, b=>b, control=>'0', output=>a_out, cout=>a_carry);
--case 2: different signs
subtractor_instance2: subtractor_24bit port map(a=>a, b=>b, control=>'1', output=>b_out, cout=>b_carry);
complementor_instance : complementor port map(input=>b_out, control=>comp, output=>b_complemented);

mux_instance : mux2x1 port map(in0=>a_out, in1=>b_complemented, sel=>is_sign_diff, output=>sum);
sign <= ((not is_sign_diff) and sa) or ((is_sign_diff) and ((comp and sb) or ((not comp) and sa)));
carry <= (not is_sign_diff) and a_carry;

end Behavioral;

