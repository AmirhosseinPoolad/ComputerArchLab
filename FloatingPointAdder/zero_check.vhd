----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:47:50 12/22/2021 
-- Design Name: 
-- Module Name:    zero_check - Behavioral 
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

entity zero_check is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           C : out  STD_LOGIC_VECTOR (31 downto 0);
           en_isZero : out  STD_LOGIC);
end zero_check;

architecture Behavioral of zero_check is

begin
process(A, B) 
begin
	if (A="00000000000000000000000000000000") then
		C <= B;
		en_isZero <= '1';
	elsif (B="00000000000000000000000000000000") then
		C <= A;
		en_isZero <= '1';
	else
		C <= "00000000000000000000000000000000";
		en_isZero <= '0';
	end if;
end process;

end Behavioral;

