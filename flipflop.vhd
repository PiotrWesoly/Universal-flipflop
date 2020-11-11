library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Flipflop is
port(
	signal in0: in std_logic; --T D R J
	signal in1: in std_logic; --    S K
	signal a: in std_logic;
	signal b: in std_logic;
	signal Q: inout std_logic;
	signal Error: out std_logic;
	signal ck: in std_logic);
end;

architecture simple of Flipflop is
begin
PROCESS(ck)
begin

	if rising_edge(ck) then
		if(a='0' and b='0') then
			Q<=in0;
		elsif (a='0' and b='1') then
			if(in0='1') then
			Q<= not Q;
			end if;
		elsif(a='1' and b='0') then 
			if(in0='0' and in1='1')then
				Q<='1';
			elsif(in0='1' and in1='0') then
				Q<='0';
			elsif(in0='1' and in1='1') then
				Error<='1';	
			end if;
		elsif(a='1' and b='1') then
			if(in0='0' and in1='1')then
				Q<='0';
			elsif(in0='1' and in1='0') then
				Q<='1';
			elsif(in0='1' and in1='1') then
				Q<=not Q;
			end if;	
		end if;
	end if;
end PROCESS;
end simple;

