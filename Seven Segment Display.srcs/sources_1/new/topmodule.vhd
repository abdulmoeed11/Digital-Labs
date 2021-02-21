----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2018 01:05:45 AM
-- Design Name: 
-- Module Name: topmodule - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topmodule is
    Port ( switch1 : in STD_LOGIC;
           switch2 : in STD_LOGIC;
           switch3 : in STD_LOGIC;
           switch4 : in STD_LOGIC;
           switch5 : in STD_LOGIC;
           switch6 : in STD_LOGIC;
           clk : in STD_LOGIC;
           topSelA : out STD_LOGIC;
           topSelB : out STD_LOGIC;
           topSelC : out STD_LOGIC;
           topSelD : out STD_LOGIC;
           topSegA : out STD_LOGIC;
           topSegB : out STD_LOGIC;
           topSegC : out STD_LOGIC;
           topSegD : out STD_LOGIC;
           topSegE : out STD_LOGIC;
           topSegF : out STD_LOGIC;
           topSegG : out STD_LOGIC);
end topmodule;

architecture Behavioral of topmodule is

component segment_driver
    Port(
         display_A : in STD_LOGIC_VECTOR (2 downto 0);
              display_B : in STD_LOGIC_VECTOR (2 downto 0);
              display_C : in STD_LOGIC_VECTOR (2 downto 0);
              display_D : in STD_LOGIC_VECTOR (2 downto 0);
              segA : out STD_LOGIC;
              segB : out STD_LOGIC;
              segC : out STD_LOGIC;
              segD : out STD_LOGIC;
              segE : out STD_LOGIC;
              segF : out STD_LOGIC;
              segG : out STD_LOGIC;
              sel_dis_A : out STD_LOGIC;
              sel_dis_B : out STD_LOGIC;
              sel_dis_C : out STD_LOGIC;
              sel_dis_D : out STD_LOGIC;
              clk : in STD_LOGIC);
      end component;
      
      Signal Ai : std_logic_vector(2 downto 0);
      Signal Bi : std_logic_vector(2 downto 0);   
            Signal Ci : std_logic_vector(2 downto 0);
      Signal Di : std_logic_vector(2 downto 0);      

begin
uut2 : segment_driver Port Map(
    display_A => Ai,
    display_B => Bi,
    display_C => Ci,
    display_D => Di,
    segA => topSegA,
    segB => topSegB,
    segC => topSegC,
    segD => topSegD,
    segE => topSegE,
    segF => topSegF,
    segG => topSegG,
    sel_dis_A => topSelA,
    sel_dis_B => topSelB,
    sel_dis_C => topSelC,
    sel_dis_D => topSelD,
    clk => clk
);
Ai(0) <= Switch1;
Ai(1) <= Switch2;
Ai(2) <= Switch3;
Bi(0) <= Switch4;
Bi(1) <= Switch5;
Bi(2) <= Switch6;
Ci <= "000";
Di <= "000";

end Behavioral;
