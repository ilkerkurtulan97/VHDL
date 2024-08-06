library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity binary_counter is
	PORT(
		CLK: in STD_LOGIC;
		RESET: in STD_LOGIC;
		Q: out STD_LOGIC_VECTOR (3 downto 0) --4-bit output
	);
end binary_counter;

architecture behavioral of binary_counter is
	signal count : STD_LOGIC_VECTOR (3 downto 0) := '0000'; --4-bit counter
begin
	process(CLK, RESET)
	begin
		if RESET = '1' then
			count <= '0000';
		elsif rising_edge(CLK) then
			count <= count + 1;
		end if;
	end process;
	
	Q <= count;
end behavioral
		