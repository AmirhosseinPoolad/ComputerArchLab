--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:09:02 12/22/2021
-- Design Name:   
-- Module Name:   D:/Course Work/CompArch/Lab/L11/normalizer_tb.vhd
-- Project Name:  L11
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: normalizer
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
 
ENTITY normalizer_tb IS
END normalizer_tb;
 
ARCHITECTURE behavior OF normalizer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT normalizer
    PORT(
         m : IN  std_logic_vector(23 downto 0);
         cin : IN  std_logic;
         e : IN  std_logic_vector(7 downto 0);
         s : IN  std_logic;
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal m : std_logic_vector(23 downto 0) := (others => '0');
   signal cin : std_logic := '0';
   signal e : std_logic_vector(7 downto 0) := (others => '0');
   signal s : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: normalizer PORT MAP (
          m => m,
          cin => cin,
          e => e,
          s => s,
          output => output
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 
		m <= "101010101010110111010100";
		cin <= '0';
		e <= "00010000";
		s <= '1';
		wait for 10 ns;
		m <= "101010101010110111010100";
		cin <= '1';
		e <= "00010000";
		s <= '0';
      wait;
   end process;

END;
