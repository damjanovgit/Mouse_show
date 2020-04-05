
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_speed_show is
	port(
		  led_speed				: in std_logic_vector(9 downto 0); -- input from PIO
		  led_out 				: out std_logic_vector(9 downto 0)
	);
end entity led_speed_show;

architecture rtl of led_speed_show is
begin
  process(led_speed)
	begin
	case to_integer(signed(led_speed)) is
		when -64 to -4 => led_out <= 	 "1100000000";
		when -3 => led_out <= 	  	 "0110000000";
		when -2 => led_out <= 	  	 "0011000000";
		when -1 => led_out <= 	  	 "0001100000"; 
		when 0 => led_out  <= 		 "0000110000"; 
		when 1 => led_out  <= 		 "0000011000"; 
		when 2 => led_out  <= 	  	 "0000001100"; 
		when 3 => led_out  <= 		 "0000000110"; 
		when 4 to 64 => led_out <= 	 "0000000011";
		when others => led_out  <=  	 "0000110000";
	end case;
  end process;
end architecture rtl;
