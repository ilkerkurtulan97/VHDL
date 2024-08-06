library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm is
    PORT(
        X: in STD_LOGIC;
        RESET: in STD_LOGIC;
        CLK: in STD_LOGIC;
        O: out STD_LOGIC
    );
end entity fsm;

architecture behavioral of fsm is
    type state is (ST1, ST2, ST3, ST4);
    signal current_state, next_state : state;

begin
    process(CLK, RESET)
    begin
        if (RESET = '1') then
            current_state <= ST1;
        elsif rising_edge(CLK) then
            current_state <= next_state;
        end if;
    end process;

    process(current_state, X)
    begin
        next_state <= current_state;
        O <= '0';  -- Default output value
        case current_state is
            when ST1 =>
                O <= '1';
                if X = '0' then
                    next_state <= ST2;
                end if;
            when ST2 =>
                O <= '0';
                if X = '0' then
                    next_state <= ST3;
                end if;
            when ST3 =>
                O <= '0';
                if X = '0' then
                    next_state <= ST4;
                end if;
            when ST4 =>
                O <= '0';
                if X = '0' then
                    next_state <= ST1;  -- Adjust transition if necessary
                end if;
            when others =>
                next_state <= ST1;
        end case;
    end process;

end architecture behavioral;
