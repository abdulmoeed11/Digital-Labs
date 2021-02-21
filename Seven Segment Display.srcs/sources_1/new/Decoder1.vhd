----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2018 08:18:38 PM
-- Design Name: 
-- Module Name: Decoder1 - Behavioral
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

entity Decoder1 is
    Port ( Digit : in STD_LOGIC_VECTOR (3 downto 0);
           seg_a : out STD_LOGIC;
           seg_b : out STD_LOGIC;
           seg_c : out STD_LOGIC;
           seg_d : out STD_LOGIC;
           seg_e : out STD_LOGIC;
           seg_f : out STD_LOGIC;
           seg_g : out STD_LOGIC);
end Decoder1;

architecture Behavioral of Decoder1 is
begin 
process(Digit)
    variable Decode_data : std_Logic_vector (6 downto 0);
begin 
case Digit is

when "0000" =>
Decode_data := "0000001"; ---0
when "0001" =>
Decode_data := "0000001"; ---0
when "0010" =>
Decode_data := "0000001"; ---0
when "0011" =>
Decode_data := "0000001"; ---0
when "0100" =>
Decode_data := "0000001"; ---0
when "0101" =>
Decode_data := "0000001"; ---0
when "0110" =>
Decode_data := "0000001"; ---0
when "0111" =>
Decode_data := "0000001"; ---0
when "1000" =>
Decode_data := "0000001"; ---0
when "1001" =>
Decode_data := "0000001"; ---0
when "1010" =>
Decode_data := "0000001"; ---0
when "1011" =>
Decode_data := "1001111"; ---1
when "1100" =>
Decode_data := "1001111"; ---1
when "1101" =>
Decode_data := "1001111"; ---1
when "1110" =>
Decode_data := "1001111"; ---1
when "1111" =>
Decode_data := "1001111"; ---1
when others =>
Decode_data := "1111111"; ---null
end case;

seg_a <= not Decode_Data(0);
seg_b <= not Decode_Data(1);
seg_c <= not Decode_Data(2);
seg_d <= not Decode_Data(3);
seg_e <= not Decode_Data(4);
seg_f <= not Decode_Data(5);
seg_g <= not Decode_Data(6);

end process;


end Behavioral;
