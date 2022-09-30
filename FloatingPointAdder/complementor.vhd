----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:50:44 12/22/2021 
-- Design Name: 
-- Module Name:    complementor - Behavioral 
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

entity complementor is
    Port ( input : in  STD_LOGIC_VECTOR (23 downto 0);
           control : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (23 downto 0));
end complementor;

architecture Behavioral of complementor is

component subtractor_24bit is
    Port ( a : in  STD_LOGIC_VECTOR (23 downto 0);
           b : in  STD_LOGIC_VECTOR (23 downto 0);
			  control : in STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (23 downto 0);
           cout : out  STD_LOGIC);
end component;
signal cout : STD_LOGIC;
begin

sub: subtractor_24bit port map(a=>"000000000000000000000000", b=>input, control=>control, output=>output,cout=>cout);

end Behavioral;

