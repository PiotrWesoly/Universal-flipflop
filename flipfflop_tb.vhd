LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT Flipflop
	PORT(
		in0 : IN std_logic;
		in1 : IN std_logic;
		a : IN std_logic;
		b : IN std_logic;
		ck : IN std_logic;    
		Q : INOUT std_logic;      
		Error : OUT std_logic
		);
	END COMPONENT;

	SIGNAL in0 :  std_logic;
	SIGNAL in1 :  std_logic;
	SIGNAL a :  std_logic;
	SIGNAL b :  std_logic;
	SIGNAL Q :  std_logic;
	SIGNAL Error :  std_logic;
	SIGNAL ck :  std_logic;

BEGIN

	uut: Flipflop PORT MAP(
		in0 => in0,
		in1 => in1,
		a => a,
		b => b,
		Q => Q,
		Error => Error,
		ck => ck
	);


-- *** Test Bench - User Defined Section ***
clock: PROCESS
begin
	ck<='0';
	for i in 1 to 2000 loop
		wait for 20ns;
		ck<=not ck;
	end loop;
wait;
END PROCESS;

   tb : PROCESS
   BEGIN

	wait until ck='0';
	in0<='1'; in1<='0';
	a<='1'; b<='1'; --JK
	wait for 50ns;
	wait until ck='0';
	a<='0'; b<='1';
	wait for 120ns;
	a<='1';b<='0';
	in1<='1';
	
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;

