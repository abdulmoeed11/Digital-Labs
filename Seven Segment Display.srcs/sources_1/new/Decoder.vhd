----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2018 07:41:43 PM
-- Design Name: 
-- Module Name: Decoder - Behavioral
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

entity Decoder is
    Port ( Digit : in STD_LOGIC_VECTOR (2 downto 0);
           seg_a : out STD_LOGIC;
           seg_b : out STD_LOGIC;
           seg_c : out STD_LOGIC;
           seg_d : out STD_LOGIC;
           seg_e : out STD_LOGIC;
           seg_f : out STD_LOGIC;
           seg_g : out STD_LOGIC);
           
end Decoder;

architecture Behavioral of Decoder is
begin 
process(Digit)
    variable Decode_data : std_Logic_vector (6 downto 0);
begin 
case Digit is
when "000" =>
Decode_data := "0000001"; ---0
when "001" =>
Decode_data := "1001111"; ---1
when "010" =>
Decode_data := "0010010"; ---2
when "011" =>
Decode_data := "0000110"; ---3
when "100" =>
Decode_data := "1001100"; ---4
when "101" =>
Decode_data := "0100100"; ---5
when "110" =>
Decode_data := "0100000"; ---6
when "111" =>
Decode_data := "0001111"; ---7
when others =>
Decode_data := "1111111"; ---null
end case;

seg_a <=  Decode_Data(6);
seg_b <=  Decode_Data(5);
seg_c <=  Decode_Data(4);
seg_d <=  Decode_Data(3);
seg_e <=  Decode_Data(2);
seg_f <=  Decode_Data(1);
seg_g <=  Decode_Data(0);

end process;


end Behavioral;
