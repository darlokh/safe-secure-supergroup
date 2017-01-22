with GF2n;
with Ada.Text_IO;

procedure Main is
   type GF4 is mod 2**4;
   -- P = x^4+x^3+1 = 2#11001# (irreducible polynomial in n=4)
   --   => 2#1001# without first digit
   -- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
   --   => 2#0011# without first digit
   -- P = x^4+x^3+x^2+x+1 = 2#11111# (irreducible polynomial in n=4)
   --   => 2#1111# without first digit
   package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);

   My_Element1 : constant GF4 := 2#1010#; -- x^3+x
   My_Element2 : constant GF4 := 2#0011#; -- x + 1
   My_GF4_Result : GF4 := 0;
   My_Boolean_Result : Boolean := False;
begin
   Ada.Text_IO.Put_Line("Start");

   My_GF4_Result := GF2n4."+"(My_Element1,My_Element2);
   Ada.Text_IO.Put_Line(My_GF4_Result'Image);

   My_GF4_Result := GF2n4."-"(My_Element1,My_Element2);
   Ada.Text_IO.Put_Line(My_GF4_Result'Image);

   My_GF4_Result := GF2n4."*"(My_Element1,My_Element2);
   Ada.Text_IO.Put_Line(My_GF4_Result'Image);

   My_GF4_Result := GF2n4."/"(My_Element1,My_Element2);
   Ada.Text_IO.Put_Line(My_GF4_Result'Image);

   My_GF4_Result := GF2n4.Find_Inverse(My_Element1);
   Ada.Text_IO.Put_Line(My_GF4_Result'Image);

   My_GF4_Result := GF2n4.GCD(My_Element1,My_Element2);
   Ada.Text_IO.Put_Line(My_GF4_Result'Image);

   My_Boolean_Result := GF2n4.Is_Primitive(1);
   Ada.Text_IO.Put_Line(My_Boolean_Result'Image);

   Ada.Text_IO.Put_Line("End");

end Main;
