----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2018 11:15:25 PM
-- Design Name: 
-- Module Name: segment_driver - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity segment_driver is
    Port ( display_A : in STD_LOGIC_VECTOR (2 downto 0);
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
end segment_driver;

architecture Behavioral of segment_driver is
    Component Decoder
    Port(
            Digit : in std_logic_vector ( 2 downto 0 );
                      seg_a : out STD_LOGIC;
                      seg_b : out STD_LOGIC;
                      seg_c : out STD_LOGIC;
                      seg_d : out STD_LOGIC;
                      seg_e : out STD_LOGIC;
                      seg_f : out STD_LOGIC;
                      seg_g : out STD_LOGIC);
                      
                      END Component;
                      
     Component clock_divider
      Port ( clk : in STD_LOGIC;
               enable : in STD_LOGIC;
               reset : in STD_LOGIC;
               data_clk : out STD_LOGIC_VECTOR (15 downto 0));
     End Component;
     
Signal temporary_data : std_logic_vector(2 downto 0);
Signal clock_word : std_logic_vector(15 downto 0);
Signal slow_clock : std_logic;
begin

        uut: Decoder Port Map(
        Digit => temporary_data,
        seg_A => segA,
        seg_B => segB,
        seg_C => segC,
        seg_D => segD,
        seg_E => segE,
        seg_F => segF,
        seg_G => segG
        );

uut1: clock_divider Port MAp(
        clk =>clk,
        enable => '1',
        reset  => '0',
        data_clk => clock_word
        );
  
  slow_clock <= clock_word(15);
  
 PROCESS(slow_clock)
 
    variable display_selection : std_logic_vector (1 downto 0);
    BEGIN
    if slow_clock'event and slow_clock = '1'then
    
    case display_selection is
        when "000" => temporary_data <= display_A;
        
            sel_dis_A <= '0';
            sel_dis_B <= '1';
            sel_dis_C <= '1';
            sel_dis_D <= '1';

    display_selection := display_selection + 1;
    
        when "01" => temporary_data <= display_A;
                
                    sel_dis_A <= '1';
                    sel_dis_B <= '0';
                    sel_dis_C <= '1';
                    sel_dis_D <= '1';
        
            display_selection := display_selection + 1;
            
            when "10" => temporary_data <= display_A;
                    
                        sel_dis_A <= '1';
                        sel_dis_B <= '1';
                        sel_dis_C <= '0';
                        sel_dis_D <= '1';
            
                display_selection := display_selection + 1;
    
            when "11" => temporary_data <= display_A;
                        
                            sel_dis_A <= '1';
                            sel_dis_B <= '1';
                            sel_dis_C <= '1';
                            sel_dis_D <= '0';
                
                    display_selection := display_selection + 1;

end case;
end if;
end process;

end Behavioral;
