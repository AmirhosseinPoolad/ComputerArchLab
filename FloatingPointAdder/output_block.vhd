----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:36:52 12/24/2021 
-- Design Name: 
-- Module Name:    output_block - Behavioral 
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

entity output_block is
    Port ( normalizer_in : in  STD_LOGIC_VECTOR (31 downto 0);
           untouched_in : in  STD_LOGIC_VECTOR (31 downto 0);
			  control : in STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end output_block;

architecture Behavioral of output_block is

component mux2x1_32bit is
    Port ( in0 : in  STD_LOGIC_VECTOR (31 downto 0);
           in1 : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

begin

mux_instance : mux2x1_32bit port map(in0=>normalizer_in,in1=>untouched_in,sel=>control,output=>output);

end Behavioral;

