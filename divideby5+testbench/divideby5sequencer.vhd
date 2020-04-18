
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity divideby5sequencer is
port(
     rst,clk,input:in std_logic;
     output_original:out std_logic
);
end divideby5sequencer;

architecture Behavioral of divideby5sequencer is
type state is(d0,d1,d2,d3,d4);
signal present_state,next_state:state;
signal output:std_logic;

begin
process(clk,rst)
begin
if(rst='1')then
present_state<=d0;
output_original<='0';
elsif(clk='1'and clk'event) then
 present_state<=next_state;
 output_original<=output;
 
 end if;
 end process;
 process(present_state,input)
 begin
 case present_state is
 when d0 => output<='1';
            if(input='0') then
            next_state<=d0;
				elsif(input='1')then
				next_state<=d1;
				end if;
 when d1 => output<='0';
            if(input='0') then
            next_state<=d2;
				elsif(input='1')then
				next_state<=d3;
				end if;
 when d2 => output<='0';
            if(input='0') then
            next_state<=d4;
				elsif(input='1')then
				next_state<=d0;
				end if;
 when d3 => output<='0';
            if(input='0') then
            next_state<=d1;
				elsif(input='1')then
				next_state<=d2;
				end if;
 when d4 => output<='0';
            if(input='0') then
            next_state<=d3;
				elsif(input='1')then
				next_state<=d4;
				end if;
 end case;
end process;				
				

end Behavioral;

