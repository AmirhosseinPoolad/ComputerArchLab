--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:17:57 12/24/2021
-- Design Name:   
-- Module Name:   D:/Course Work/CompArch/Lab/L11/fp_adder_tb.vhd
-- Project Name:  L11
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fp_adder
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
 
ENTITY fp_adder_tb IS
END fp_adder_tb;
 
ARCHITECTURE behavior OF fp_adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fp_adder
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fp_adder PORT MAP (
          a => a,
          b => b,
          output => output
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      -- insert stimulus here 
		a<= "00111110101000111101011100001010"; --0.319999992847442626953125
		b<= "01000010110010000000000000000000"; --100
		wait for 50 ns;
		a<= "00111110101000111101011100001010"; --0.319999992847442626953125
		b<= "00111100101000111101011100001010"; --0.0199999995529651641845703125
		wait for 50 ns;
		a<= "11000010110011110000000000000000"; -- -103.5
		b<= "11000010110010000000000000000000"; -- -100
		wait for 50 ns;
		a<= "11000010110011110000000000000000"; -- -103.5
		b<= "00000000000000000000000000000000"; -- 0
      wait;
   end process;

END;