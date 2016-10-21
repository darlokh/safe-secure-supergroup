-------------------------------------
-- Safe and Secure Systems WT 2016/17
-- Problem Session 1
-- Authors: Matti Wiegmann,    112174
--          Nathalie Dittrich, 123456
-------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO;

procedure Basic_Math_Operations is
   First, Second : Float;
begin
   -- Enter two numbers, separated by space or enter
   Ada.Text_IO.Put ("Enter two floats: ");
   Ada.Float_Text_IO.Get (First);
   Ada.Float_Text_IO.Get (Second);
   -- addition
   Ada.Text_IO.Put ("The sum is");
   Ada.Float_Text_IO.Put (First + Second, AFT=>3, EXP => 0);
   Ada.Text_IO.New_Line;
   -- substraction
   Ada.Text_IO.Put ("The difference is");
   Ada.Float_Text_IO.Put (First - Second, AFT=>3, EXP => 0);
   Ada.Text_IO.New_Line;
   -- multiplication
   Ada.Text_IO.Put ("The product is");
   Ada.Float_Text_IO.Put (First * Second, AFT=>3, EXP => 0);
   Ada.Text_IO.New_Line;
   -- division
   Ada.Text_IO.Put ("The quotient is");
   Ada.Float_Text_IO.Put (First / Second, AFT=>3, EXP => 0);
   Ada.Text_IO.New_Line;
end Basic_Math_Operations;
