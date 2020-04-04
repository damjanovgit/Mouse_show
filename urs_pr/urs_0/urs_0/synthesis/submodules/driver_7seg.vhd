-- our custom component for 7seg control

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity driver_7seg is
	 port (
		  clock_clk          : in  std_logic                     := '0';             --  clock.clk
        reset_reset        : in  std_logic                     := '0';              --  reset.reset
		
        avs_s0_address     : in  std_logic_vector(7 downto 0)  := (others => '0'); -- avs_s0.address
        avs_s0_write       : in  std_logic                     := '0';             --       .write
        avs_s0_writedata   : in  std_logic_vector(31 downto 0) := (others => '0'); --       .writedata
		  
		  hex0 					: out std_logic_vector(6 downto 0);
		  hex1 					: out std_logic_vector(6 downto 0);
		  hex2 					: out std_logic_vector(6 downto 0);
		  hex3 					: out std_logic_vector(6 downto 0);
		  hex4 					: out std_logic_vector(6 downto 0);
		  hex5 					: out std_logic_vector(6 downto 0)
    );
end entity driver_7seg;

architecture rtl of driver_7seg is
	component bcd_to_7seg is
		port (
			bcd : in std_logic_vector(3 downto 0);
			seg_out : out std_logic_vector(6 downto 0)
		);
	end component;
	
function to_bcd ( bin : std_logic_vector(7 downto 0) ) return std_logic_vector is
	variable i : integer:=0;
	variable bcd : std_logic_vector(7 downto 0) := (others => '0');
	variable bint : std_logic_vector(7 downto 0) := bin;

begin
for i in 0 to 7 loop  -- repeating 8 times.
	bcd(7 downto 1) := bcd(6 downto 0);  --shifting the bits.
	bcd(0) := bint(7);
	bint(7 downto 1) := bint(6 downto 0);
	bint(0) :='0';


	if(i < 7 and bcd(3 downto 0) > "0100") then --add 3 if BCD digit is greater than 4.
		bcd(3 downto 0) := std_logic_vector(to_unsigned(to_integer(unsigned(bcd(3 downto 0))) + 3, 4));
	end if;

	if(i < 7 and bcd(7 downto 4) > "0100") then --add 3 if BCD digit is greater than 4.
		bcd(7 downto 4) := std_logic_vector(to_unsigned(to_integer(unsigned(bcd(7 downto 4))) + 3, 4));
	end if;
end loop;
	return bcd;
end to_bcd;
	
	signal in_data : std_logic_vector(31 downto 0) := (others => '0');
begin

	wp : process(clock_clk)
	begin
		if rising_edge(clock_clk) then
			if avs_s0_write = '1' then
				in_data <= avs_s0_writedata;
			end if;
		end if;
	end process;

	disp_0 : bcd_to_7seg port map(to_bcd(bin => in_data(7 downto 0))(3 downto 0), hex0);
	disp_1 : bcd_to_7seg port map(to_bcd(bin => in_data(7 downto 0))(7 downto 4), hex1);
	disp_2 : bcd_to_7seg port map(to_bcd(bin => in_data(15 downto 8))(3 downto 0), hex2);
	disp_3 : bcd_to_7seg port map(to_bcd(bin => in_data(15 downto 8))(7 downto 4), hex3);
	disp_4 : bcd_to_7seg port map(to_bcd(bin => in_data(23 downto 16))(3 downto 0), hex4);
	disp_5 : bcd_to_7seg port map(to_bcd(bin => in_data(31 downto 24))(3 downto 0), hex5);	
end architecture rtl; -- of driver_7seg