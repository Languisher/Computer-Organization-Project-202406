--  A testbench for circuit_tb
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity circuit_tb is
end circuit_tb;

architecture behav of circuit_tb is
  component main
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
  end component;

  signal s_7 : std_logic;
  signal s_6 : std_logic;
  signal s_5 : std_logic;
  signal s_4 : std_logic;
  signal s_3 : std_logic;
  signal s_2 : std_logic;
  signal s_1 : std_logic;
  signal s_0 : std_logic;
  signal c_7 : std_logic;
  signal c_6 : std_logic;
  signal c_5 : std_logic;
  signal c_4 : std_logic;
  signal c_3 : std_logic;
  signal c_2 : std_logic;
  signal c_1 : std_logic;
  signal c_0 : std_logic;
  function to_string ( a: std_logic_vector) return string is
      variable b : string (1 to a'length) := (others => NUL);
      variable stri : integer := 1; 
  begin
      for i in a'range loop
          b(stri) := std_logic'image(a((i)))(2);
      stri := stri+1;
      end loop;
      return b;
  end function;
begin
  main_0 : main port map (
    s_7 => s_7,
    s_6 => s_6,
    s_5 => s_5,
    s_4 => s_4,
    s_3 => s_3,
    s_2 => s_2,
    s_1 => s_1,
    s_0 => s_0,
    c_7 => c_7,
    c_6 => c_6,
    c_5 => c_5,
    c_4 => c_4,
    c_3 => c_3,
    c_2 => c_2,
    c_1 => c_1,
    c_0 => c_0 );
  process
    type pattern_type is record
      s_7 : std_logic;
      s_6 : std_logic;
      s_5 : std_logic;
      s_4 : std_logic;
      s_3 : std_logic;
      s_2 : std_logic;
      s_1 : std_logic;
      s_0 : std_logic;
      c_7 : std_logic;
      c_6 : std_logic;
      c_5 : std_logic;
      c_4 : std_logic;
      c_3 : std_logic;
      c_2 : std_logic;
      c_1 : std_logic;
      c_0 : std_logic;
    end record;
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array := (
      ('0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1'), -- i=0
      ('0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0'), -- i=1
      ('0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0'), -- i=2
      ('0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'), -- i=3
      ('0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0'), -- i=4
      ('0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0'), -- i=5
      ('0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0'), -- i=6
      ('1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'), -- i=7
      ('1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1'), -- i=8
      ('0', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1', '1', '1', '1', '1'), -- i=9
      ('1', '1', '0', '0', '0', '0', '0', '1', '1', '0', '1', '1', '1', '1', '1', '1'), -- i=10
      ('1', '0', '1', '0', '1', '0', '1', '0', '1', '1', '0', '1', '0', '1', '1', '0'), -- i=11
      ('1', '0', '0', '1', '0', '0', '1', '0', '1', '1', '1', '0', '1', '1', '1', '0'));
  begin
    for i in patterns'range loop
      s_7 <= patterns(i).s_7;
      s_6 <= patterns(i).s_6;
      s_5 <= patterns(i).s_5;
      s_4 <= patterns(i).s_4;
      s_3 <= patterns(i).s_3;
      s_2 <= patterns(i).s_2;
      s_1 <= patterns(i).s_1;
      s_0 <= patterns(i).s_0;
      wait for 10 ns;
      assert std_match(c_7, patterns(i).c_7) OR (c_7 = 'Z' AND patterns(i).c_7 = 'Z')
        report "wrong value for c_7, i=" & integer'image(i)
         & ", expected " & std_logic'image(patterns(i).c_7) & ", found " & std_logic'image(c_7) severity error;assert std_match(c_6, patterns(i).c_6) OR (c_6 = 'Z' AND patterns(i).c_6 = 'Z')
        report "wrong value for c_6, i=" & integer'image(i)
         & ", expected " & std_logic'image(patterns(i).c_6) & ", found " & std_logic'image(c_6) severity error;assert std_match(c_5, patterns(i).c_5) OR (c_5 = 'Z' AND patterns(i).c_5 = 'Z')
        report "wrong value for c_5, i=" & integer'image(i)
         & ", expected " & std_logic'image(patterns(i).c_5) & ", found " & std_logic'image(c_5) severity error;assert std_match(c_4, patterns(i).c_4) OR (c_4 = 'Z' AND patterns(i).c_4 = 'Z')
        report "wrong value for c_4, i=" & integer'image(i)
         & ", expected " & std_logic'image(patterns(i).c_4) & ", found " & std_logic'image(c_4) severity error;assert std_match(c_3, patterns(i).c_3) OR (c_3 = 'Z' AND patterns(i).c_3 = 'Z')
        report "wrong value for c_3, i=" & integer'image(i)
         & ", expected " & std_logic'image(patterns(i).c_3) & ", found " & std_logic'image(c_3) severity error;assert std_match(c_2, patterns(i).c_2) OR (c_2 = 'Z' AND patterns(i).c_2 = 'Z')
        report "wrong value for c_2, i=" & integer'image(i)
         & ", expected " & std_logic'image(patterns(i).c_2) & ", found " & std_logic'image(c_2) severity error;assert std_match(c_1, patterns(i).c_1) OR (c_1 = 'Z' AND patterns(i).c_1 = 'Z')
        report "wrong value for c_1, i=" & integer'image(i)
         & ", expected " & std_logic'image(patterns(i).c_1) & ", found " & std_logic'image(c_1) severity error;assert std_match(c_0, patterns(i).c_0) OR (c_0 = 'Z' AND patterns(i).c_0 = 'Z')
        report "wrong value for c_0, i=" & integer'image(i)
         & ", expected " & std_logic'image(patterns(i).c_0) & ", found " & std_logic'image(c_0) severity error;end loop;
    wait;
  end process;
end behav;
