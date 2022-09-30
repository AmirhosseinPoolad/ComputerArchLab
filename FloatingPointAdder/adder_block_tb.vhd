--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:12:24 12/22/2021
-- Design Name:   
-- Module Name:   D:/Course Work/CompArch/Lab/L11/adder_block_tb.vhd
-- Project Name:  L11
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adder_block
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY adder_block_tb IS
END adder_block_tb;
 
ARCHITECTURE behavior OF adder_block_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder_block
    PORT(
         sa : IN  std_logic;
         sb : IN  std_logic;
         a : IN  std_logic_vector(23 downto 0);
         b : IN  std_logic_vector(23 downto 0);
         comp : IN  std_logic;
         sum : OUT  std_logic_vector(23 downto 0);
         sign : OUT  std_logic;
         carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sa : std_logic := '0';
   signal sb : std_logic := '0';
   signal a : std_logic_vector(23 downto 0) := (others => '0');
   signal b : std_logic_vector(23 downto 0) := (others => '0');
   signal comp : std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(23 downto 0);
   signal sign : std_logic;
   signal carry : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adder_block PORT MAP (
          sa => sa,
          sb => sb,
          a => a,
          b => b,
          comp => comp,
          sum => sum,
          sign => sign,
          carry => carry
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 
		sa <= '1';
		sb <= '1';
		comp <= '0';
		a <= "000010000000000000001100";
		b <= "000000100000000011001110";
      wait;
   end process;

END;
