
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity topmodule_tb is
end;

architecture bench of topmodule_tb is

  component topmodule
      Port ( A0 : in STD_LOGIC;
             A1 : in STD_LOGIC;
             A2 : in STD_LOGIC;
             A3 : in STD_LOGIC;
             B0 : in STD_LOGIC;
             B1 : in STD_LOGIC;
             B2 : in STD_LOGIC;
             B3 : in STD_LOGIC;
             S0: out STD_LOGIC;
             S1: out STD_LOGIC;
             S2: out STD_LOGIC;
             S3: out STD_LOGIC;
             C0in : in STD_LOGIC;
             C3out : out STD_LOGIC);
  end component;

  signal A0: STD_LOGIC;
  signal A1: STD_LOGIC;
  signal A2: STD_LOGIC;
  signal A3: STD_LOGIC;
  signal B0: STD_LOGIC;
  signal B1: STD_LOGIC;
  signal B2: STD_LOGIC;
  signal B3: STD_LOGIC;
  signal S0: STD_LOGIC;
  signal S1: STD_LOGIC;
  signal S2: STD_LOGIC;
  signal S3: STD_LOGIC;
  signal C0in: STD_LOGIC;
  signal C3out: STD_LOGIC;

begin

  uut: topmodule port map ( A0    => A0,
                            A1    => A1,
                            A2    => A2,
                            A3    => A3,
                            B0    => B0,
                            B1    => B1,
                            B2    => B2,
                            B3    => B3,
                            S0    => S0,
                            S1    => S1,
                            S2    => S2,
                            S3    => S3,
                            C0in  => C0in,
                            C3out => C3out );

  stimulus: process
  begin
  
    -- Put initialisation code here

                            A0 <= '0';
                            A1 <= '0';
                            A2 <= '0';
                            A3 <= '0';
                            B0 <= '0';
                            B1 <= '0';
                            B2 <= '0';
                            B3 <= '0';
    -- Put test bench stimulus code here

wait for 100ns;

                            A0 <= '1';
                            A1 <= '0';
                            A2 <= '0';
                            A3 <= '0';
                            B0 <= '1';
                            B1 <= '0';
                            B2 <= '0';
                            B3 <= '0';

wait for 100ns;

                            A0 <= '1';
                            A1 <= '1';
                            A2 <= '0';
                            A3 <= '0';
                            B0 <= '1';
                            B1 <= '1';
                            B2 <= '0';
                            B3 <= '0';

wait for 100ns;

                            A0 <= '1';
                            A1 <= '1';
                            A2 <= '1';
                            A3 <= '0';
                            B0 <= '1';
                            B1 <= '1';
                            B2 <= '1';
                            B3 <= '0';

wait for 100ns;

                            A0 <= '1';
                            A1 <= '1';
                            A2 <= '1';
                            A3 <= '1';
                            B0 <= '1';
                            B1 <= '1';
                            B2 <= '1';
                            B3 <= '1';


    wait;
    
    
    
  end process;


end;