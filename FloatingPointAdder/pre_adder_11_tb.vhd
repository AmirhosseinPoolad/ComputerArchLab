--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:53:37 12/24/2021
-- Design Name:   
-- Module Name:   E:/4/AZ/projects/project5/pre_adder_11_tb.vhd
-- Project Name:  project5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pre_adder
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
 
ENTITY pre_adder_11_tb IS
END pre_adder_11_tb;
 
ARCHITECTURE behavior OF pre_adder_11_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pre_adder
    PORT(
         in1 : IN  std_logic_vector(31 downto 0);
         in2 : IN  std_logic_vector(31 downto 0);
         m1 : OUT  std_logic_vector(23 downto 0);
         m2 : OUT  std_logic_vector(23 downto 0);
         e1 : OUT  std_logic_vector(7 downto 0);
         e2 : OUT  std_logic_vector(7 downto 0);
         s1 : OUT  std_logic;
         s2 : OUT  std_logic;
         comp : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal in1 : std_logic_vector(31 downto 0) := (others => '0');
   signal in2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal m1 : std_logic_vector(23 downto 0);
   signal m2 : std_logic_vector(23 downto 0);
   signal e1 : std_logic_vector(7 downto 0);
   signal e2 : std_logic_vector(7 downto 0);
   signal s1 : std_logic;
   signal s2 : std_logic;
   signal comp : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pre_adder PORT MAP (
          in1 => in1,
          in2 => in2,
          m1 => m1,
          m2 => m2,
          e1 => e1,
          e2 => e2,
          s1 => s1,
          s2 => s2,
          comp => comp
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

      -- insert stimulus here
		wait for 100 ns;	
in1 <= "01000000111111111000001111100000";
    in2 <= "01000000111111111000001111100001";
    wait for 200 ns;
    in1 <= "01000001111111111000001111111111";
    in2 <= "01000000111111111000001111100001";
    wait for 200 ns;
    in2 <= "01000001101111111000001111111111";
    in1 <= "01000000101111111000001111100001";
    wait for 200 ns;		

      wait;
   end process;

END;
