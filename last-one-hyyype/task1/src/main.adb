with GF2n;
with Ada.Text_IO;

procedure Main is
   --subtype GF21 is Element_Type is mod 21;
   package GF21 is new GF2n(Element_Type => Natural);
   My_Element1 : GF21 := 5;
   My_Element2 : GF21 := 13;
begin
   Ada.Text_IO.Put_Line("Start");

   Ada.Text_IO.Put_Line("End");

end Main;
