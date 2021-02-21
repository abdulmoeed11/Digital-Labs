----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/06/2018 08:00:30 PM
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
end topmodule;

architecture Behavioral of topmodule is
SIGNAL C1, C2, C3 : STD_LOGIC;

Component Adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Carin : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Carout : out STD_LOGIC;
           D : inout STD_LOGIC;
           E : inout STD_LOGIC;
           F : inout STD_LOGIC;
           G : inout STD_LOGIC
           );
end component;


begin

stage0: Adder Port Map (
    A => A0,
    B => B0,
    Carin => '0',
    Carout => C1,
    Sum => S0);
stage1: Adder Port Map (
        A => A1,
        B => B1,
        Carin => C1,
        Carout => C2,
        Sum => S1);
stage2: Adder Port Map (
            A => A2,
            B => B2,
            Carin => C2,
            Carout => C3,
            Sum => S2);
stage3: Adder Port Map (
                A => A3,
                B => B3,
                Carin => C3,
                Carout => C3out,
                Sum => S3);

end Behavioral;
