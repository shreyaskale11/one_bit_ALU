----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:44:49 01/25/2021 
-- Design Name: 
-- Module Name:    one_bit_alu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity one_bit_alu is
    Port ( a : in  std_logic;
           b ,cin: in  std_logic;
           sel : in  std_logic_vector(1 downto 0);
           o ,carry: out std_logic);
end one_bit_alu;

architecture Behavioral of one_bit_alu is
signal a1,a2,a3,a4,cout :std_logic;
--signal a1:bit_vector;
--signal a2:bit_vector;
--signal a3:bit_vector;
--signal a4:bit_vector;
begin
a1 <= a and b;
a2<=  a or b;
a3<= a nand b;
a4 <= a xor b xor cin;
cout <= (a and b) or ((a xor b) and cin);

	mux_1: process(a1,a2,a3,a4,sel) is
	begin
	case sel is 
	when "00" => o <= a1;
	when "01" => o <= a2;
	when "10" => o <= a3;
	when others => o <= a4; carry <= cout;
	end case;
	end process mux_1;

end Behavioral;

