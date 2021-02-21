----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/06/2018 06:53:45 PM
-- Design Name: 
-- Module Name: Adder - Behavioral
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

entity Adder is
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
end Adder;

architecture Behavioral of Adder is

begin

D <= A AND B;
E <= A XOR B;
F <= E AND Carin;
Carout <= D OR F;
Sum <= E XOR Carin;


end Behavioral;
