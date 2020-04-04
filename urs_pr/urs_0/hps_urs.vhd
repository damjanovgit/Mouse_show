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
            to_hex_0_display   : out   std_logic_vector(6 downto 0);                     -- display
            to_hex_1_display   : out   std_logic_vector(6 downto 0);                     -- display
            to_hex_2_display   : out   std_logic_vector(6 downto 0);                     -- display
            to_hex_3_display   : out   std_logic_vector(6 downto 0);                     -- display
            to_hex_4_display   : out   std_logic_vector(6 downto 0);                     -- display
            to_hex_5_display   : out   std_logic_vector(6 downto 0)                      -- display
        );
end urs_top;

architecture rtl of urs_top is
	    component urs_0 is
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
            to_hex_0_display   : out   std_logic_vector(6 downto 0);                     -- display
            to_hex_1_display   : out   std_logic_vector(6 downto 0);                     -- display
            to_hex_2_display   : out   std_logic_vector(6 downto 0);                     -- display
            to_hex_3_display   : out   std_logic_vector(6 downto 0);                     -- display
            to_hex_4_display   : out   std_logic_vector(6 downto 0);                     -- display
            to_hex_5_display   : out   std_logic_vector(6 downto 0)                      -- display
        );
    end component urs_0;
begin
	 u0 : component urs_0
        port map (
            clk_clk            => clk_clk,            --      clk.clk
            memory_mem_a       => memory_mem_a,       --   memory.mem_a
            memory_mem_ba      => memory_mem_ba,      --         .mem_ba
            memory_mem_ck      => memory_mem_ck,      --         .mem_ck
            memory_mem_ck_n    => memory_mem_ck_n,    --         .mem_ck_n
            memory_mem_cke     => memory_mem_cke,     --         .mem_cke
            memory_mem_cs_n    => memory_mem_cs_n,    --         .mem_cs_n
            memory_mem_ras_n   => memory_mem_ras_n,   --         .mem_ras_n
            memory_mem_cas_n   => memory_mem_cas_n,   --         .mem_cas_n
            memory_mem_we_n    => memory_mem_we_n,    --         .mem_we_n
            memory_mem_reset_n => memory_mem_reset_n, --         .mem_reset_n
            memory_mem_dq      => memory_mem_dq,      --         .mem_dq
            memory_mem_dqs     => memory_mem_dqs,     --         .mem_dqs
            memory_mem_dqs_n   => memory_mem_dqs_n,   --         .mem_dqs_n
            memory_mem_odt     => memory_mem_odt,     --         .mem_odt
            memory_mem_dm      => memory_mem_dm,      --         .mem_dm
            memory_oct_rzqin   => memory_oct_rzqin,   --         .oct_rzqin
            to_hex_0_display   => to_hex_0_display,   -- to_hex_0.display
            to_hex_1_display   => to_hex_1_display,   -- to_hex_1.display
            to_hex_2_display   => to_hex_2_display,   -- to_hex_2.display
            to_hex_3_display   => to_hex_3_display,   -- to_hex_3.display
            to_hex_4_display   => to_hex_4_display,   -- to_hex_4.display
            to_hex_5_display   => to_hex_5_display    -- to_hex_5.display
        );
end architecture rtl; -- of urs_top