--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY divideby5testbench IS
END divideby5testbench;
 
ARCHITECTURE behavior OF divideby5testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 --same name as entity name in main code
    COMPONENT divideby5sequencer
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         input : IN  std_logic;
         output_original : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal input : std_logic := '0';

 	--Outputs
   signal output_original : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divideby5sequencer PORT MAP (
          rst => rst,
          clk => clk,
          input => input,
          output_original => output_original
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      input<='0';
		rst<='1';
		wait for 40ns;
		rst<='0';
		wait for 34ns;
		input<='0';
		wait for 20ns;
		input<='1';
		wait for 10ns;
		input<='0';
		wait for 10ns;
		input<='1';
		wait for 10ns;

      wait;
   end process;

END;
