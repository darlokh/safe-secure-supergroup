-------------------------------------
-- Safe and Secure Systems WT 2016/17
-- Problem Session 1
-- Authors: Matti Wiegmann,    112174
--          Nathalie Dittrich, 123456
-------------------------------------

with Ada.Text_IO;
procedure Hello is

begin
   -- Print "Hello World to the cmdline"
   Ada.Text_IO.Put ("""Hello World!""");
   Ada.Text_IO.New_Line;
end Hello;
