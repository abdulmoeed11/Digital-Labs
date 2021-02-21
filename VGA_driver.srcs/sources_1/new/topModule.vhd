----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2018 07:04:15 PM
-- Design Name: 
-- Module Name: topModule - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topModule is
    Port ( HSync : out STD_LOGIC;
           VSync : out STD_LOGIC;
           clk : in STD_LOGIC;
           RGB : out STD_LOGIC_VECTOR (2 downto 0);
           switch : in std_logic_vector(1 downto 0));
end topModule;

architecture Behavioral of topModule is

constant HD : integer := 1279;
constant HFP : integer := 48;
constant HSP : integer := 112;
constant HBP : integer := 248;

constant VD : integer := 1023;
constant VFP : integer := 1;
constant VSP : integer := 3;
constant VBP : integer := 38;

signal hPos : integer := 0;
signal vPos : integer := 0;
signal videoOn : std_logic := '0';

begin

Horizontal_position_counter: process(clk)
begin
if (clk'event and clk ='1') then 
        if ( hPos = HD + HFP + HSP + HBP ) then 
        hPos <= 0;
        else
        hPos <= hPos + 1;
     end if;
 end if;
end process;
    

Vertical_Position_Counter: process( clk, hPos)
begin
if ( clk'event and clk= '1') then
        if ( hPos = HD + HFP + HSP + HBP ) then
            if ( VPos = VD + VFP + VSP + VBP) then
            vPos <= 0;
            else
            vPos <= vPos + 1;
            end if;
        end  if;
end if;
end process;

Horizontal_synchroniser: process ( clk, hPos)
begin
if ( clk'event and clk= '1') then 
    if ( HPos <= HD + HFP or HPos > HD + HFP + HSP ) then
            Hsync <= '1';
            else
            Hsync <= '0';
    end if;
end if;
end process;

Veritcal_synchroniser: process ( clk, vPos)
begin
if ( clk'event and clk= '1') then 
    if ( VPos <= VD + VFP or VPos > VD + VFP + VSP ) then
            Vsync <= '1';
            else
            Vsync <= '0';
    end if;
end if;
end process;            
             

video_on: process ( clk, vPos, hPos )
begin
if ( clk'event and clk= '1') then 
    if ( hPos <= HD and vPos <= VD ) then
    videoOn <= '1';
    else
    videoOn <= '0';
    end if;
end if;
end process;

drawing: process ( clk, hPos, vPos, videoOn)
begin
if ( clk'event and clk= '1') then
if (videoOn = '1') then
     if (switch = "00") then
     if ( (hPos >= 0 and hPos <= 1000) and  ( vPos >= 0 and vPos <= 1000))  then
    RGB <= "100";
    else RGB <= "000";
    end if;
    end if;
    if (switch(0) = '1') then
    if ( (hPos >= 0 and hPos <= 1000) and  ( vPos >= 0 and vPos <= 1000) ) then
    RGB <= "001"; else RGB <= "000";
    end if;
    end if;
    end if;
    end if;
end process;

end Behavioral;
