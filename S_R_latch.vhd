library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sr_latch is
	PORT(
		S : IN STD_LOGIC;
		R : IN STD_LOGIC;
		Q : OUT STD_LOGIC;
		Q_BAR: OUT STD_LOGIC;
	)
end sr_latch

architecture behavioral of sr_latch is
begin
	process(CLK)
	begin
	if rising_edge(CLK) then
		if(S = '1' and R = '0') then
			Q <= '1';
			Q_BAR <= '0';
		elsif (S = '0' and R = '1') then --Reset State
			Q <= '0';
			Q_BAR <= '1';
		elsif (S = '0' and R = '0') then --Latch Mode
			Q <= '0';
			Q_BAR <= '0';
		elsif (S = '1' and R = '1') then --Invalid State
			Q <= '0';
			Q_BAR <= '0';
		end if;
	end if;
	end process;
end behavioral;
	
		