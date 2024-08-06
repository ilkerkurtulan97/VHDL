library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my_fms is
    PORT(
        X: in STD_LOGIC;
        SET: in STD_LOGIC;
        CLK: in STD_LOGIC;
        Y: out STD_LOGIC;
        Z2: out STD_LOGIC
    );
end entity my_fms;

architecture fsm3 of my_fms is
    type state_type is (ST0, ST1, ST2);
    signal PS, NS : state_type;
begin
    sync_proc: process(CLK, SET)
    begin
        if (SET = '1') then
            PS <= ST2;
        elsif rising_edge(CLK) then
            PS <= NS;
        end if;
    end process;

    comb_proc: process(PS, X)
    begin
        Z2 <= '0';
        case PS is
            when ST0 =>
                if X = '0' then
                    NS <= ST0;
                else
                    NS <= ST1;
                end if;
            when ST1 =>
                if X = '0' then
                    NS <= ST0;
                else
                    NS <= ST2;
                end if;
            when ST2 =>    
                if X = '0' then
                    NS <= ST0;
                else
                    NS <= ST2;
                    Z2 <= '1';
                end if;
            when others => 
                NS <= ST0;
                Z2 <= '0';
        end case;
    end process;
    
    Y <= PS = ST2;

end architecture fsm3;
