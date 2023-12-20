library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsmd is 
    port(
        reset_n : in std_logic;
        clk     : in std_logic;
        go      : in  std_logic;
        x       : in  unsigned(7 downto 0);
        a0      : in  unsigned(7 downto 0);
        a1      : in  unsigned(7 downto 0);
        a2      : in  unsigned(7 downto 0);
        a3      : in  unsigned(7 downto 0);
        px      : out unsigned(34 downto 0)
    );

end entity;

architecture rtl of fsmd is 
    -- Déclaration des signaux utiles
    signal control : std_logic_vector(7 downto 0); -- Gestion du bitstream

    begin
        controler_1 : entity work.controller
            port map(
                reset_n => reset_n, --port formel => signaux
                clk     => clk,
                go      => go,
                control => control
            );

            datapath_1: entity work.datapath
            port map (
                reset_n => reset_n,
                clk     => clk,
                x       => x,
                a0      => a0,
                a1      => a1,
                a2      => a2,
                a3      => a3,
                control => control,
                px      => px);

end architecture;