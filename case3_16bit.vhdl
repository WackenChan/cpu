library ieee;
use ieee.std_logic_1164.all;

entity case3_16bit is port (
    if_a   : in  std_logic;
    a      : in  std_logic_vector(15 downto 0);
    if_b   : in  std_logic;
    b      : in  std_logic_vector(15 downto 0);
    if_c   : in  std_logic;
    c      : in  std_logic_vector(15 downto 0);
    output : out std_logic_vector(15 downto 0));
end case3_16bit;

architecture case3_16bit_arch of case3_16bit is
    component and_16bit is port (
        a      : in  std_logic_vector(15 downto 0);
        b      : in  std_logic;
        output : out std_logic_vector(15 downto 0));
    end component;
    component or3_16bit is port (
        a      : in  std_logic_vector(15 downto 0);
        b      : in  std_logic_vector(15 downto 0);
        c      : in  std_logic_vector(15 downto 0);
        output : out std_logic_vector(15 downto 0));
    end component;

    signal a_1 : std_logic_vector(15 downto 0);
    signal b_1 : std_logic_vector(15 downto 0);
    signal c_1 : std_logic_vector(15 downto 0);
begin
    a_0 : and_16bit port map (
        a => a,
        b => if_a,
        output => a_1);
    b_0 : and_16bit port map (
        a => b,
        b => if_b,
        output => b_1);
    c_0 : and_16bit port map (
        a => c,
        b => if_c,
        output => c_1);
    output_0 : or3_16bit port map (
        a => a_1,
        b => b_1,
        c => c_1,
        output => output);
end case3_16bit_arch;
