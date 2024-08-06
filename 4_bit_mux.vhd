library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux4 is(
	PORT(
		D0: IN STD_LOGIC;
		D1: IN STD_LOGIC;
		D2: IN STD_LOGIC;
		D3: IN STD_LOGIC;
		S0: IN STD_LOGIC;
		S1: IN STD_LOGIC;
		Y: OUT STD_LOGIC;
	)
end mux4;

architecture behavioral of mux4 is
begin
	process(D0, D1, D2, D3, S0, S1)
	begin
		case(S1 & S0) is
			when "00" =>
				Y<= D0;
			when "01" =>
				Y<= D1;
			when "10" =>
				Y<= D2;
			when "11" =>
				Y<= D3;
			when others =>
				Y<= '0';
		end case;
	end process;
end behavioral;