library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity encoder is
port(a:in std_logic_vector(2 downto 0);
     enable:in std_logic;
	  output:out std_logic_vector(7 downto 0)
);
end encoder;

architecture Behavioral of encoder is
signal temp: std_logic_vector(7 downto 0);
begin
process(a,enable)

begin
 if(enable='1') then
   temp<="11111111";
	else
	if(a="000")then
	temp<="11111110";
	elsif(a="001")then
	temp<="11111101";
	elsif(a="010")then
	temp<="11111011";
	elsif(a="011")then
	temp<="11110111";
	elsif(a="100")then
	temp<="11101111";
	elsif(a="101")then
	temp<="11011111";
	elsif(a="110")then
	temp<="10111111";
	elsif(a="111")then
	temp<="01111111";
	end if;
	end if;
	end process;
output<=temp;	
end Behavioral;

