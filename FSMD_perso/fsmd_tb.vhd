--------------------------------------------------------------------------------
-- this file was generated automatically by Vertigo Ruby utility
-- date : (d/m/y h:m) 20/12/2023  8:02
-- author : Jean-Christophe Le Lann - 2014
--------------------------------------------------------------------------------
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity fsmd_tb is
end entity;
 
architecture bhv of fsmd_tb is
  constant HALF_PERIOD : time :=5 ns;
 
  signal clk : std_logic := '0';
  signal reset_n : std_logic := '0';
 
  signal running : boolean := true;
 
  procedure wait_cycles(n : natural) is 
  begin
    for i in 0 to n-1 loop
      wait until rising_edge(clk);
    end loop;
  end procedure;
 
  procedure toggle(signal s : inout std_logic) is
  begin
    wait until rising_edge(clk);
    s <=not(s);
    wait until rising_edge(clk);
    s <=not(s);
  end procedure;
 
  signal go      : std_logic;
  signal x       : unsigned(7 downto 0);
  signal a0      : unsigned(7 downto 0);
  signal a1      : unsigned(7 downto 0);
  signal a2      : unsigned(7 downto 0);
  signal a3      : unsigned(7 downto 0);
  signal px      : unsigned(34 downto 0);
begin
  --------------------------------------------------------------------------------
  -- clock and reset
  --------------------------------------------------------------------------------
  reset_n <= '0','1' after 123 ns;
   
  clk <= not(clk) after HALF_PERIOD when running else clk;
  --------------------------------------------------------------------------------
  -- Design Under Test
  --------------------------------------------------------------------------------
  dut : entity work.fsmd(rtl)
    port map (
      reset_n => reset_n,
      clk     => clk    ,
      go      => go     ,
      x       => x      ,
      a0      => a0     ,
      a1      => a1     ,
      a2      => a2     ,
      a3      => a3     ,
      px      => px     
    );
  --------------------------------------------------------------------------------
  -- sequential stimuli
  --------------------------------------------------------------------------------
  stim : process
  begin
    report "running testbench for fsmd(rtl)";
    report "waiting for asynchronous reset";
    wait until reset_n='1';
    wait_cycles(10);
    wait_cycles(200);
    report "end of simulation";
    running <= false;
    wait;
  end process;
end bhv;
