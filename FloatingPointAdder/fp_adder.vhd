----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:12 12/24/2021 
-- Design Name: 
-- Module Name:    fp_adder - Behavioral 
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

entity fp_adder is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end fp_adder;

architecture Behavioral of fp_adder is

component zero_check is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           C : out  STD_LOGIC_VECTOR (31 downto 0);
           en_isZero : out  STD_LOGIC);
end component;

component pre_adder is
    Port ( in1 : in  STD_LOGIC_VECTOR (31 downto 0);
           in2 : in  STD_LOGIC_VECTOR (31 downto 0);
           m1 : out  STD_LOGIC_VECTOR (23 downto 0);
        m2 : out  STD_LOGIC_VECTOR (23 downto 0);
        e1 : out  STD_LOGIC_VECTOR (7 downto 0);
        e2 : out  STD_LOGIC_VECTOR (7 downto 0);
        s1 : out  STD_LOGIC;
           s2 : out  STD_LOGIC;
        comp : out  STD_LOGIC);
end component;

component adder_block is
    Port ( sa : in  STD_LOGIC;
           sb : in  STD_LOGIC;
           a : in  STD_LOGIC_VECTOR (23 downto 0);
           b : in  STD_LOGIC_VECTOR (23 downto 0);
			  comp : in STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (23 downto 0);
			  sign : out STD_LOGIC;
			  carry : out STD_LOGIC);
end component;

component normalizer is
    Port ( m : in  STD_LOGIC_VECTOR (23 downto 0);
	        cin: in STD_LOGIC;
           e : in  STD_LOGIC_VECTOR (7 downto 0);
           s : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component output_block is
    Port ( normalizer_in : in  STD_LOGIC_VECTOR (31 downto 0);
           untouched_in : in  STD_LOGIC_VECTOR (31 downto 0);
			  control : in STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal zero_out : STD_LOGIC_VECTOR (31 downto 0);
signal is_zero : STD_LOGIC;

signal man1 : STD_LOGIC_VECTOR(23 downto 0);
signal man2 : STD_LOGIC_VECTOR(23 downto 0);
signal exp1 : STD_LOGIC_VECTOR(7 downto 0);
signal exp2 : STD_LOGIC_VECTOR(7 downto 0);
signal s1 : STD_LOGIC;
signal s2 : STD_LOGIC;
signal comp : STD_LOGIC;

signal adder_sum : STD_LOGIC_VECTOR (23 downto 0);
signal adder_sign : STD_LOGIC;
signal adder_carry : STD_LOGIC;

signal normalized_out : STD_LOGIC_VECTOR(31 downto 0);

begin

zero_check_instance1: zero_check port map(A=>a, B=>b, C=>zero_out, en_isZero=>is_zero);
pre_adder_instance1: pre_adder port map(in1=>a, in2=>b, m1=>man1, m2=>man2, e1=>exp1, e2=>exp2, s1=>s1, s2=>s2, comp=>comp);
adder_block_instance1: adder_block port map(sa=>s1, sb=>s2, a=>man1, b=>man2, comp=>comp, sum=>adder_sum, sign=>adder_sign, carry=>adder_carry);
normalizer_instance1: normalizer port map(m=>adder_sum, cin=>adder_carry, e=>exp1,s=>adder_sign, output=>normalized_out);
output_block_instance1 : output_block port map(normalizer_in=>normalized_out, untouched_in=>zero_out, control=>is_zero, output=>output);

end Behavioral;

