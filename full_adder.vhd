library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    PORT(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
        Cin: IN STD_LOGIC;
        Sum: OUT STD_LOGIC;
        Cout: OUT STD_LOGIC
    );
end entity full_adder;

architecture behavioral of full_adder is
begin
    process(A, B, Cin)
    begin
        Sum <= A XOR B XOR Cin;
        Cout <= (A AND B) OR (B AND Cin) OR (A AND Cin);
    end process;
end architecture behavioral;
