----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:49:39 12/22/2021 
-- Design Name: 
-- Module Name:    pre_adder - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pre_adder is
    Port ( in1 : in  STD_LOGIC_VECTOR (31 downto 0);
           in2 : in  STD_LOGIC_VECTOR (31 downto 0);
           m1 : out  STD_LOGIC_VECTOR (23 downto 0);
        m2 : out  STD_LOGIC_VECTOR (23 downto 0);
        e1 : out  STD_LOGIC_VECTOR (7 downto 0);
        e2 : out  STD_LOGIC_VECTOR (7 downto 0);
        s1 : out  STD_LOGIC;
           s2 : out  STD_LOGIC;
        comp : out  STD_LOGIC);
end pre_adder;

architecture Behavioral of pre_adder is

signal m11 : STD_LOGIC_VECTOR (23 downto 0):= "000000000000000000000000";
signal m22 : STD_LOGIC_VECTOR (23 downto 0):= "000000000000000000000000";
signal exp1 : unsigned (7 downto 0);
signal exp2 : unsigned (7 downto 0);
signal man1 : STD_LOGIC_VECTOR (23 downto 0);
signal man2 : STD_LOGIC_VECTOR (23 downto 0);


begin
exp1 <= unsigned(in1(30 downto 23));
exp2 <= unsigned(in2(30 downto 23));
man1 <= '1' & std_logic_vector(unsigned(in1(22 downto 0)));
man2 <= '1' & std_logic_vector(unsigned(in2(22 downto 0)));

process(exp1,exp2,man1,man2) 
begin
  if (exp1 >= exp2) then

    
    e1 <= std_logic_vector(exp1);
    e2 <= std_logic_vector(exp1);
    m11 <= std_logic_vector(man1);
    m22 <= std_logic_vector(unsigned(man2) srl to_integer(unsigned(exp1 - exp2)));
    comp <= '0';
    
    
    
  else 
    e1 <= std_logic_vector(exp2);
    e2 <= std_logic_vector(exp2);
    m22 <= std_logic_vector(man2);
    m11 <= std_logic_vector(unsigned(man1) srl to_integer(unsigned(exp2 - exp1)));
    comp <= '1';
  end if;
    
end process;
m1 <= m11;
m2 <= m22; 
s1 <= in1(31);
s2 <= in2(31);
end Behavioral;