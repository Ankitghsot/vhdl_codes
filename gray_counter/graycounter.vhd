
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity graycounter is
port(rst,clk:in std_logic;
     output_original:out std_logic_vector(2 downto 0)
);
end graycounter;

architecture Behavioral of graycounter is
type state is(a,b,c,d,e,f,g,h);
signal present_state,next_state:state;
signal output:std_logic_vector(2 downto 0);

begin
process(clk,rst)
begin
if(rst='1')then
present_state<=a;
output_original<="000";
elsif(clk='1'and clk'event) then
 present_state<=next_state;
 output_original<=output;
 
 end if;
 end process;
 process(present_state)
 begin
 case present_state is
 when a => output<="000";
            next_state<=b;
 when b => output<="001";
            next_state<=c;
 when c => output<="011";
            next_state<=d;
 when d => output<="010";
            next_state<=e;
 when e => output<="110";
            next_state<=f;
 when f => output<="111";
            next_state<=g;
 when g => output<="101";
            next_state<=h;
 when h => output<="100";
            next_state<=a;
end case;
end process;				
				

end Behavioral;

