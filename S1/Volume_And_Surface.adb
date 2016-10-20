-------------------------------------
-- Safe and Secure Systems WT 2016/17
-- Problem Session 1
-- Authors: Matti Wiegmann,    112174
--          Nathalie Dittrich, 123456
-------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO;

procedure Volume_And_Surface is
   First, Second, Third : Float;
begin
   -- Enter two numbers, separated by space or enter
   Ada.Text_IO.Put ("Enter height, width and depth of a box: ");
   Ada.Float_Text_IO.Get (First);
   Ada.Float_Text_IO.Get (Second);
   Ada.Float_Text_IO.Get (Third);
   -- volume
   Ada.Text_IO.Put ("The volume is ");
   Ada.Float_Text_IO.Put (First * Second * Third, AFT=>3, EXP=>0);
   Ada.Text_IO.Put (" cm^3");
   Ada.Text_IO.New_Line;
   -- surface
   Ada.Text_IO.Put ("The surface is ");
   Ada.Float_Text_IO.Put (2.0*(First * Second) + 2.0*(Second * Third) + 2.0*(First * Third), AFT=>3, EXP => 0);
   Ada.Text_IO.Put (" cm^2");
   Ada.Text_IO.New_Line;
end Volume_And_Surface;
