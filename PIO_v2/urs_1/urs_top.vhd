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
            to_hex_export      : in   std_logic_vector(31 downto 0);                     -- export
	    to_led             : out   std_logic_vector(9 downto 0);  				        -- export
	    hex0               : out std_logic_vector(6 downto 0);
	    hex1               : out std_logic_vector(6 downto 0);
	    hex2 	       : out std_logic_vector(6 downto 0);
	    hex3	       : out std_logic_vector(6 downto 0);
	    hex4   	       : out std_logic_vector(6 downto 0);
	    hex5               : out std_logic_vector(6 downto 0);
	    hps_io_hps_io_emac1_inst_TX_CLK : out   std_logic;                                        -- hps_io_emac1_inst_TX_CLK
            hps_io_hps_io_emac1_inst_TXD0   : out   std_logic;                                        -- hps_io_emac1_inst_TXD0
            hps_io_hps_io_emac1_inst_TXD1   : out   std_logic;                                        -- hps_io_emac1_inst_TXD1
            hps_io_hps_io_emac1_inst_TXD2   : out   std_logic;                                        -- hps_io_emac1_inst_TXD2
            hps_io_hps_io_emac1_inst_TXD3   : out   std_logic;                                        -- hps_io_emac1_inst_TXD3
            hps_io_hps_io_emac1_inst_RXD0   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD0
            hps_io_hps_io_emac1_inst_MDIO   : inout std_logic                     := 'X';             -- hps_io_emac1_inst_MDIO
            hps_io_hps_io_emac1_inst_MDC    : out   std_logic;                                        -- hps_io_emac1_inst_MDC
            hps_io_hps_io_emac1_inst_RX_CTL : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CTL
            hps_io_hps_io_emac1_inst_TX_CTL : out   std_logic;                                        -- hps_io_emac1_inst_TX_CTL
            hps_io_hps_io_emac1_inst_RX_CLK : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CLK
            hps_io_hps_io_emac1_inst_RXD1   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD1
            hps_io_hps_io_emac1_inst_RXD2   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD2
            hps_io_hps_io_emac1_inst_RXD3   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD3
            hps_io_hps_io_sdio_inst_CMD     : inout std_logic                     := 'X';             -- hps_io_sdio_inst_CMD
            hps_io_hps_io_sdio_inst_D0      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D0
            hps_io_hps_io_sdio_inst_D1      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D1
            hps_io_hps_io_sdio_inst_CLK     : out   std_logic;                                        -- hps_io_sdio_inst_CLK
            hps_io_hps_io_sdio_inst_D2      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D2
            hps_io_hps_io_sdio_inst_D3      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D3
            hps_io_hps_io_uart0_inst_RX     : in    std_logic                     := 'X';             -- hps_io_uart0_inst_RX
            hps_io_hps_io_uart0_inst_TX     : out   std_logic;                                        -- hps_io_uart0_inst_TX
            hps_io_hps_io_gpio_inst_GPIO35  : inout std_logic
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
		
            to_hex_export      : out    std_logic_vector(31 downto 0) := (others => 'X');
	    to_speed_export    : out   std_logic_vector(9 downto 0);                      -- export
		
	    hps_io_hps_io_emac1_inst_TX_CLK : out   std_logic;                                        -- hps_io_emac1_inst_TX_CLK
            hps_io_hps_io_emac1_inst_TXD0   : out   std_logic;                                        -- hps_io_emac1_inst_TXD0
            hps_io_hps_io_emac1_inst_TXD1   : out   std_logic;                                        -- hps_io_emac1_inst_TXD1
            hps_io_hps_io_emac1_inst_TXD2   : out   std_logic;                                        -- hps_io_emac1_inst_TXD2
            hps_io_hps_io_emac1_inst_TXD3   : out   std_logic;                                        -- hps_io_emac1_inst_TXD3
            hps_io_hps_io_emac1_inst_RXD0   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD0
            hps_io_hps_io_emac1_inst_MDIO   : inout std_logic                     := 'X';             -- hps_io_emac1_inst_MDIO
            hps_io_hps_io_emac1_inst_MDC    : out   std_logic;                                        -- hps_io_emac1_inst_MDC
            hps_io_hps_io_emac1_inst_RX_CTL : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CTL
            hps_io_hps_io_emac1_inst_TX_CTL : out   std_logic;                                        -- hps_io_emac1_inst_TX_CTL
            hps_io_hps_io_emac1_inst_RX_CLK : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CLK
            hps_io_hps_io_emac1_inst_RXD1   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD1
            hps_io_hps_io_emac1_inst_RXD2   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD2
            hps_io_hps_io_emac1_inst_RXD3   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD3
            hps_io_hps_io_sdio_inst_CMD     : inout std_logic                     := 'X';             -- hps_io_sdio_inst_CMD
            hps_io_hps_io_sdio_inst_D0      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D0
            hps_io_hps_io_sdio_inst_D1      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D1
            hps_io_hps_io_sdio_inst_CLK     : out   std_logic;                                        -- hps_io_sdio_inst_CLK
            hps_io_hps_io_sdio_inst_D2      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D2
            hps_io_hps_io_sdio_inst_D3      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D3
            hps_io_hps_io_uart0_inst_RX     : in    std_logic                     := 'X';             -- hps_io_uart0_inst_RX
            hps_io_hps_io_uart0_inst_TX     : out   std_logic;                                        -- hps_io_uart0_inst_TX
            hps_io_hps_io_gpio_inst_GPIO35  : inout std_logic
        );
    end component urs_1;

    component driver_7seg is
	port (
		in_data	: in std_logic_vector(31 downto 0); -- input from PIO

		hex0	: out std_logic_vector(6 downto 0);
		hex1 	: out std_logic_vector(6 downto 0);
		hex2 	: out std_logic_vector(6 downto 0);
		hex3 	: out std_logic_vector(6 downto 0);
		hex4 	: out std_logic_vector(6 downto 0);
		hex5 	: out std_logic_vector(6 downto 0)
        );
    end component driver_7seg;

    component led_speed_show is
	port(
		led_speed	: in std_logic_vector(9 downto 0); -- input from PIO
		led_out 	: out std_logic_vector(9 downto 0)
	);
    end component led_speed_show;
    
    signal transfer: std_logic_vector(31 downto 0);
    signal led_speed: std_logic_vector(9 downto 0);

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
		
            to_hex_export      => transfer,       -- to_hex.export
	    to_speed_export    => led_speed,      -- to_speed.export
		
	    hps_io_hps_io_emac1_inst_TX_CLK => hps_io_hps_io_emac1_inst_TX_CLK, -- hps_io.hps_io_emac1_inst_TX_CLK
            hps_io_hps_io_emac1_inst_TXD0   => hps_io_hps_io_emac1_inst_TXD0,   --       .hps_io_emac1_inst_TXD0
            hps_io_hps_io_emac1_inst_TXD1   => hps_io_hps_io_emac1_inst_TXD1,   --       .hps_io_emac1_inst_TXD1
            hps_io_hps_io_emac1_inst_TXD2   => hps_io_hps_io_emac1_inst_TXD2,   --       .hps_io_emac1_inst_TXD2
            hps_io_hps_io_emac1_inst_TXD3   => hps_io_hps_io_emac1_inst_TXD3,   --       .hps_io_emac1_inst_TXD3
            hps_io_hps_io_emac1_inst_RXD0   => hps_io_hps_io_emac1_inst_RXD0,   --       .hps_io_emac1_inst_RXD0
            hps_io_hps_io_emac1_inst_MDIO   => hps_io_hps_io_emac1_inst_MDIO,   --       .hps_io_emac1_inst_MDIO
            hps_io_hps_io_emac1_inst_MDC    => hps_io_hps_io_emac1_inst_MDC,    --       .hps_io_emac1_inst_MDC
            hps_io_hps_io_emac1_inst_RX_CTL => hps_io_hps_io_emac1_inst_RX_CTL, --       .hps_io_emac1_inst_RX_CTL
            hps_io_hps_io_emac1_inst_TX_CTL => hps_io_hps_io_emac1_inst_TX_CTL, --       .hps_io_emac1_inst_TX_CTL
            hps_io_hps_io_emac1_inst_RX_CLK => hps_io_hps_io_emac1_inst_RX_CLK, --       .hps_io_emac1_inst_RX_CLK
            hps_io_hps_io_emac1_inst_RXD1   => hps_io_hps_io_emac1_inst_RXD1,   --       .hps_io_emac1_inst_RXD1
            hps_io_hps_io_emac1_inst_RXD2   => hps_io_hps_io_emac1_inst_RXD2,   --       .hps_io_emac1_inst_RXD2
            hps_io_hps_io_emac1_inst_RXD3   => hps_io_hps_io_emac1_inst_RXD3,   --       .hps_io_emac1_inst_RXD3
            hps_io_hps_io_sdio_inst_CMD     => hps_io_hps_io_sdio_inst_CMD,     --       .hps_io_sdio_inst_CMD
            hps_io_hps_io_sdio_inst_D0      => hps_io_hps_io_sdio_inst_D0,      --       .hps_io_sdio_inst_D0
            hps_io_hps_io_sdio_inst_D1      => hps_io_hps_io_sdio_inst_D1,      --       .hps_io_sdio_inst_D1
            hps_io_hps_io_sdio_inst_CLK     => hps_io_hps_io_sdio_inst_CLK,     --       .hps_io_sdio_inst_CLK
            hps_io_hps_io_sdio_inst_D2      => hps_io_hps_io_sdio_inst_D2,      --       .hps_io_sdio_inst_D2
            hps_io_hps_io_sdio_inst_D3      => hps_io_hps_io_sdio_inst_D3,      --       .hps_io_sdio_inst_D3
            hps_io_hps_io_uart0_inst_RX     => hps_io_hps_io_uart0_inst_RX,     --       .hps_io_uart0_inst_RX
            hps_io_hps_io_uart0_inst_TX     => hps_io_hps_io_uart0_inst_TX,     --       .hps_io_uart0_inst_TX
            hps_io_hps_io_gpio_inst_GPIO35  => hps_io_hps_io_gpio_inst_GPIO35
        );


	  driver_7seg_inst : component driver_7seg
		  port map (
			in_data	=> transfer,
			hex0	=> hex0,
			hex1	=> hex1,
			hex2	=> hex2,
			hex3	=> hex3,
			hex4	=> hex4,
			hex5	=> hex5
		);

	lss : component led_speed_show
		port map (
			led_speed => led_speed,
			led_out	  => to_led
		);

end architecture rtl; -- of urs_top
