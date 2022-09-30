----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:16:13 12/22/2021 
-- Design Name: 
-- Module Name:    mux2x1 - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux2x1 is
    Port ( in0 : in  STD_LOGIC_VECTOR (23 downto 0);
           in1 : in  STD_LOGIC_VECTOR (23 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (23 downto 0));
end mux2x1;

architecture Behavioral of mux2x1 is

type mux_in is Array(0 to 1) of std_logic_vector(23 downto 0);
signal inputs: mux_in;

begin

inputs(0) <= in0;
inputs(1) <= in1;

output <= inputs(conv_integer(sel));

end Behavioral;