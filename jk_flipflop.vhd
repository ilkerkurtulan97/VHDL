LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity jk_flip_flop is
    PORT(
        Clk: IN STD_LOGIC;
        J: IN STD_LOGIC;
        K: IN STD_LOGIC;
        reset: IN STD_LOGIC;
        Q: OUT STD_LOGIC;
        Q_NOT: OUT STD_LOGIC
    );
end entity jk_flip_flop;

architecture behavioural of jk_flip_flop is
    signal Q_int : STD_LOGIC := '0';
    
    PROCESS(Clk)
    begin
        if reset = '1' then
            Q_int <= '0';
        elsif rising_edge(Clk) then
            case (J & K) is
                when "00" => 
                    -- No change
                    Q_int <= Q_int;
                when "01" => 
                    -- Reset
                    Q_int <= '0';
                when "10" => 
                    -- Set
                    Q_int <= '1';
                when "11" => 
                    -- Toggle
                    Q_int <= not Q_int;
                when others =>
                    Q_int <= Q_int;
            end case;
        end if;
    end PROCESS;

    Q <= Q_int;
    Q_NOT <= not Q_int;

end architecture behavioural;
