library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller is 
    port(
        clk     : in std_logic;
        reset_n : in std_logic;

        go      : in std_logic;
        done    : out std_logic;
        control : out std_logic_vector(7 downto 0) -- Bitstream transmis au Datapath
    );
end entity;


architecture rtl of controller is 

    -- Déclaration des états

    type state_t is (s0,s1,s2,s3);

    -- Déclaration des signaux

    signal state : state_t;

    -- Processus

    -- Gestion des états du système
    begin 

        state_logic : process (reset_n, clk)
        begin 
            if reset_n = '0' then
                state <= s0;
            elsif rising_edge(clk) then
                case state is 
                    when s0 =>
                        if go = '1' then
                            state <= s1;
                        end if;
                    when s1 => state <= s2;
                    when s2 => state <= s3;
                    when s3 => state <= s0;
                    when others => null;
                end case;
            end if;
        end process;

        -- Gestion du bistream de commandes (CSTEP)

        bitstream   : process(reset_n, clk)
        begin
            case state is
                when s0 => control <= "11101101"; -- bits 3-4 correspondent à un mux à 3 entrées avec valeur 1, idem pour 6 et 7: commande 1 1 1 1 1 1
                when s1 => control <= "00010000"; -- Seul le mux à 3 entrées du registre 3 veut recevoir la valeur 2 (donc 0b10): commande 0 0 0 2 0 0
                when s2 => control <= "00010001"; -- Idem mais avec le dernier à 1: commande0 0 0 2 0 1
                when s3 => control <= "00010010"; -- Remplacement du dernier par 2: commande 0 0 0 2 0 2
            end case;
        end process;

end architecture;