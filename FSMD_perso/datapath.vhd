library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity datapath is 
    port(

    clk     : in std_logic;
    reset_n : in std_logic;

    a0      : in unsigned(7 downto 0);
    a1      : in unsigned(7 downto 0);
    a2      : in unsigned(7 downto 0);
    a3      : in unsigned(7 downto 0);

    x       : in unsigned(7 downto 0);

    control : in  std_logic_vector(7 downto 0);

    px      : out unsigned(34 downto 0) -- Prendre en compte toutes les variables, pour dimentionner la taille du vecteur de sortie 4*8  +  3

    );
end datapath;


architecture rtl of datapath is 

-- Déclarations

-- Gestion des commandes des mux

signal mux_cmd : std_logic_vector(7 downto 0); -- commande des mux en fonction des valeurs des registres

signal u0      : std_logic := mux_cmd(0);
signal u1      : std_logic := mux_cmd(1);
signal u2      : std_logic := mux_cmd(2);
signal u3      : std_logic_vector(1 downto 0) := mux_cmd(4 downto 3); -- Mux à 3 entrées, 3 états donc 2 bits
signal u4      : std_logic := mux_cmd(5);
signal u5      : std_logic_vector(1 downto 0) := mux_cmd(7 downto 6); -- Mux à 3 entrées, 3 états donc 2 bits


-- Gestion des registres contenant les paramètres d'entrée du système

signal r0   : unsigned(7 downto 0);
signal r1   : unsigned(7 downto 0);
signal r2   : unsigned(7 downto 0);
signal r3   : unsigned(34 downto 0);
signal r4   : unsigned(7 downto 0);

signal operand_add1 : unsigned(7 downto 0);
signal mulacc : unsigned(34 downto 0);


-- Process
begin

    -- Gestion des registres

    reg_0   : process(reset_n, clk)
    -- Dans notre cas: r0 ne contient au cours de l'exécution que la valeur a0, qui ne sera pas changée.
    begin
        if reset_n = '0' then
            r0 <= to_unsigned(0,8); -- Remise à zéro du registre sur n bits configurés en generic
        elsif rising_edge(clk) then
            -- Équivalent d'un mux2, empêchant un changement intempestif de la valeur de a0 si on ne le souhaite pas, au cours de l'exécution du programme
            if u0 = '1' then -- bit 0 permet de gérer la commande u0
                r0 <= a0;
            else 
                r0 <= r0;
            end if;
        end if;
    end process;

    reg_1   : process(reset_n, clk)
    begin
        if reset_n = '0' then
            r1 <= to_unsigned(0,8); -- Remise à zéro du registre sur n bits configurés en generic
        elsif rising_edge(clk) then
            if u1 = '1' then -- Si commande u1 = 1 alors on entre une nouvelle valeur dans le registre
                r1 <= a1;
            else 
                r1 <= r1;
            end if;
        end if;
    end process;

    reg_2   : process(reset_n, clk)
    begin
        if reset_n = '0' then
            r2 <= to_unsigned(0,8); -- Remise à zéro du registre sur n bits configurés en generic
        elsif rising_edge(clk) then
            if u2 = '1' then -- Si u2 = 1, nouvelle valeur dans le registre. Sinon, conservation
                r2 <= a2;
            else 
                r2 <= r2;
            end if;
        end if;
    end process;


    reg_3   : process(reset_n, clk)
    begin
        if reset_n = '0' then
            r3 <= to_unsigned(0,8); -- Remise à zéro du registre sur n bits configurés en generic
        elsif rising_edge(clk) then
            if u3 = "01" then
                r3 <= resize(a3, 35);
            elsif u3 = "10" then -- Si jamais valeur de u3 = 2 alors on y insère le résultat de l'addition
                r3 <= mulacc; 
            else 
                r3 <= resize(r3, 35);
            end if;
        end if;

    end process;

    px <= r3; -- Output


    reg_4   : process(reset_n, clk)
    begin
        if reset_n = '0' then
            r4 <= to_unsigned(0,8); -- Remise à zéro du registre sur n bits configurés en generic
        elsif rising_edge(clk) then
            if u4 = '1' then
                r4 <= x;
            else 
                r4 <= r4;
            end if;
        end if;
    end process;


    mux5 : process(reset_n,clk)
    begin
        case u5 is
            when "00" =>
                operand_add1 <= r0;
            when "01" =>
                operand_add1 <= r2;
            when "10" =>
                operand_add1 <= r1;
            when others =>
                operand_add1 <= r0; --default. Needed for inference of mux.
        end case;
    end process;


    
    mulacc <= resize(r4*r3 + operand_add1, 35); 





end architecture;