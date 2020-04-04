library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity urs_top is
	port (
            clk_clk            : in    std_logic                     := 'X';             -- clk
            memory_mem_a       : out   std_logic_vector(14 downto 0);                    -- mem_a
            memory_mem_ba      : out   std_logic_vector(2 downto 0);                     -- mem_ba
            memory_mem_ck      : out   std_logic;                                        -- mem_ck
            memory_mem_ck_n    : out   std_logic;                                        -- mem_ck_n
            memory_mem_cke     : out   std_logic;                                        -- mem_cke
            memory_mem_cs_n    : out   std_logic;                                        -- mem_cs_n
            memory_mem_ras_n   : out   std_logic;                                        -- mem_ras_n
            memory_mem_cas_n   : out   std_logic;                                        -- mem_cas_n
            memory_mem_we_n    : out   std_logic;                                        -- mem_we_n
            memory_mem_reset_n : out   std_logic;                                        -- mem_reset_n
            memory_mem_dq      : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
            memory_mem_dqs     : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
            memory_mem_dqs_n   : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
            memory_mem_odt     : out   std_logic;                                        -- mem_odt
            memory_mem_dm      : out   std_logic_vector(3 downto 0);                     -- mem_dm
            memory_oct_rzqin   : in    std_logic                     := 'X';             -- oct_rzqin
            to_hex_export      : in   std_logic_vector(31 downto 0);                    -- export
				
				hex0 					: out std_logic_vector(6 downto 0);
				hex1 					: out std_logic_vector(6 downto 0);
				hex2 					: out std_logic_vector(6 downto 0);
				hex3 					: out std_logic_vector(6 downto 0);
				hex4 					: out std_logic_vector(6 downto 0);
				hex5 					: out std_logic_vector(6 downto 0)
        );
end entity urs_top;

architecture rtl of urs_top is

 component urs_1 is
        port (
            clk_clk            : in    std_logic                     := 'X';             -- clk
            memory_mem_a       : out   std_logic_vector(14 downto 0);                    -- mem_a
            memory_mem_ba      : out   std_logic_vector(2 downto 0);                     -- mem_ba
            memory_mem_ck      : out   std_logic;                                        -- mem_ck
            memory_mem_ck_n    : out   std_logic;                                        -- mem_ck_n
            memory_mem_cke     : out   std_logic;                                        -- mem_cke
            memory_mem_cs_n    : out   std_logic;                                        -- mem_cs_n
            memory_mem_ras_n   : out   std_logic;                                        -- mem_ras_n
            memory_mem_cas_n   : out   std_logic;                                        -- mem_cas_n
            memory_mem_we_n    : out   std_logic;                                        -- mem_we_n
            memory_mem_reset_n : out   std_logic;                                        -- mem_reset_n
            memory_mem_dq      : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
            memory_mem_dqs     : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
            memory_mem_dqs_n   : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
            memory_mem_odt     : out   std_logic;                                        -- mem_odt
            memory_mem_dm      : out   std_logic_vector(3 downto 0);                     -- mem_dm
            memory_oct_rzqin   : in    std_logic                     := 'X';             -- oct_rzqin
            to_hex_export      : in    std_logic_vector(31 downto 0) := (others => 'X')
        );
    end component urs_1;
	 
	 component driver_7seg is
		port (
		  in_data				: in std_logic_vector(31 downto 0); -- input from PIO
		  
		  hex0 					: out std_logic_vector(6 downto 0);
		  hex1 					: out std_logic_vector(6 downto 0);
		  hex2 					: out std_logic_vector(6 downto 0);
		  hex3 					: out std_logic_vector(6 downto 0);
		  hex4 					: out std_logic_vector(6 downto 0);
		  hex5 					: out std_logic_vector(6 downto 0)
      );
	 end component driver_7seg;
begin
	u0 : component urs_1
        port map (
            clk_clk            => clk_clk,            --    clk.clk
            memory_mem_a       => memory_mem_a,       -- memory.mem_a
            memory_mem_ba      => memory_mem_ba,      --       .mem_ba
            memory_mem_ck      => memory_mem_ck,      --       .mem_ck
            memory_mem_ck_n    => memory_mem_ck_n,    --       .mem_ck_n
            memory_mem_cke     => memory_mem_cke,     --       .mem_cke
            memory_mem_cs_n    => memory_mem_cs_n,    --       .mem_cs_n
            memory_mem_ras_n   => memory_mem_ras_n,   --       .mem_ras_n
            memory_mem_cas_n   => memory_mem_cas_n,   --       .mem_cas_n
            memory_mem_we_n    => memory_mem_we_n,    --       .mem_we_n
            memory_mem_reset_n => memory_mem_reset_n, --       .mem_reset_n
            memory_mem_dq      => memory_mem_dq,      --       .mem_dq
            memory_mem_dqs     => memory_mem_dqs,     --       .mem_dqs
            memory_mem_dqs_n   => memory_mem_dqs_n,   --       .mem_dqs_n
            memory_mem_odt     => memory_mem_odt,     --       .mem_odt
            memory_mem_dm      => memory_mem_dm,      --       .mem_dm
            memory_oct_rzqin   => memory_oct_rzqin,   --       .oct_rzqin
            to_hex_export      => to_hex_export       -- to_hex.export
        );
		  
		  
		  driver_7seg_inst : component driver_7seg 
				port map (
							in_data	=> to_hex_export,
							hex0		=> hex0,
							hex1		=> hex1,
							hex2		=> hex2,
							hex3		=> hex3,
							hex4		=> hex4,
							hex5		=> hex5
						);

end architecture rtl; -- of urs_top