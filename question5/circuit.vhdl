-- MUX_GATE_1 entity
LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity MUX_GATE_1 is
  port (
    p_out: out std_logic;
    sel: in std_logic;
    in_0: in std_logic;
    in_1: in std_logic );
end MUX_GATE_1;

architecture Behavioral of MUX_GATE_1 is
begin
  process(sel, in_0, in_1)
  begin
    if sel = '0' then
      p_out <= in_0 after 2 ns;
    elsif sel = '1' then
      p_out <= in_1 after 2 ns;
    else
      p_out <= '0' after 2 ns;
    end if;
  end process;
end Behavioral;

-- half_adder entity
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity half_adder is
  port (
    b: in std_logic;
    a: in std_logic;
    Result: out std_logic;
    CarryOut: out std_logic);
end half_adder;

architecture Behavioral of half_adder is
begin
  Result <= (b XOR a) after 1 ns;
  CarryOut <= (b AND a) after 1 ns;
end Behavioral;

-- adder_4bits_copy entity
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity adder_4bits_copy is
  port (
    CarryIn: in std_logic;
    a_3: in std_logic;
    a_2: in std_logic;
    a_1: in std_logic;
    a_0: in std_logic;
    o_c: out std_logic;
    o_1: out std_logic;
    o_0: out std_logic;
    o_2: out std_logic;
    o_3: out std_logic);
end adder_4bits_copy;

architecture Behavioral of adder_4bits_copy is
  signal s0: std_logic;
  signal s1: std_logic;
  signal s2: std_logic;
begin
  gate0: entity work.half_adder
    port map (
      b => CarryIn,
      a => a_0,
      Result => o_0);
    s0 <= (a_0 AND CarryIn) after 1 ns;
    s1 <= (a_0 AND a_1 AND CarryIn) after 1 ns;
    s2 <= (a_0 AND a_1 AND a_2 AND CarryIn) after 1 ns;
    o_c <= (a_0 AND a_1 AND a_2 AND a_3 AND CarryIn) after 1 ns;
  gate1: entity work.half_adder
    port map (
      b => s0,
      a => a_1,
      Result => o_1);
  gate2: entity work.half_adder
    port map (
      b => s1,
      a => a_2,
      Result => o_2);
  gate3: entity work.half_adder
    port map (
      b => s2,
      a => a_3,
      Result => o_3);
end Behavioral;

-- main entity
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity main is
  port (
    s_7: in std_logic;
    s_6: in std_logic;
    s_5: in std_logic;
    s_4: in std_logic;
    s_3: in std_logic;
    s_2: in std_logic;
    s_1: in std_logic;
    s_0: in std_logic;
    c_7: out std_logic;
    c_6: out std_logic;
    c_5: out std_logic;
    c_4: out std_logic;
    c_3: out std_logic;
    c_2: out std_logic;
    c_1: out std_logic;
    c_0: out std_logic);
end main;

architecture Behavioral of main is
  signal s0: std_logic;
  signal s1: std_logic;
  signal s2: std_logic;
  signal s3: std_logic;
  signal s4: std_logic;
  signal s5: std_logic;
  signal s6: std_logic;
  signal s7: std_logic;
  signal s8: std_logic;
  signal s9: std_logic;
  signal s10: std_logic;
  signal s11: std_logic;
  signal s12: std_logic;
  signal s13: std_logic;
  signal s14: std_logic;
begin
  s0 <= NOT s_6 after 1 ns;
  s2 <= NOT s_5 after 1 ns;
  s4 <= NOT s_4 after 1 ns;
  s6 <= NOT s_3 after 1 ns;
  s8 <= NOT s_2 after 1 ns;
  s10 <= NOT s_1 after 1 ns;
  s12 <= NOT s_0 after 1 ns;

  gate0: entity work.MUX_GATE_1
    port map (
      sel => s_7,
      in_0 => s_6,
      in_1 => s0,
      p_out => s1);
  gate1: entity work.MUX_GATE_1
    port map (
      sel => s_7,
      in_0 => s_5,
      in_1 => s2,
      p_out => s3);
  gate2: entity work.MUX_GATE_1
    port map (
      sel => s_7,
      in_0 => s_4,
      in_1 => s4,
      p_out => s5);
  gate3: entity work.MUX_GATE_1
    port map (
      sel => s_7,
      in_0 => s_3,
      in_1 => s6,
      p_out => s7);
  gate4: entity work.MUX_GATE_1
    port map (
      sel => s_7,
      in_0 => s_2,
      in_1 => s8,
      p_out => s9);
  gate5: entity work.MUX_GATE_1
    port map (
      sel => s_7,
      in_0 => s_1,
      in_1 => s10,
      p_out => s11);
  gate6: entity work.MUX_GATE_1
    port map (
      sel => s_7,
      in_0 => s_0,
      in_1 => s12,
      p_out => s13);

  gate7: entity work.adder_4bits_copy
    port map (
      CarryIn => s_7,
      a_3 => s7,
      a_2 => s9,
      a_1 => s11,
      a_0 => s13,
      o_c => s14,
      o_1 => c_1,
      o_0 => c_0,
      o_2 => c_2,
      o_3 => c_3);

  gate8: entity work.adder_4bits_copy
    port map (
      CarryIn => s14,
      a_3 => '0',
      a_2 => s1,
      a_1 => s3,
      a_0 => s5,
      o_1 => c_5,
      o_0 => c_4,
      o_2 => c_6);

  c_7 <= s_7;
end Behavioral;

