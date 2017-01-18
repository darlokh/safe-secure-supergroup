package body GF2n is

   function "+"(X: Element_Type; Y: Element_Type) return Element_Type is
   begin
      return (X + Y) mod Element_Type'Last;
   end "+";

   function "-"(X: Element_Type; Y: Element_Type) return Element_Type is
   begin
      return (X - Y) mod Element_Type'Last;
   end "-";

   function "*"(X: Element_Type; Y: Element_Type) return Element_Type is
   begin
      return (X * Y) mod Element_Type'Last;
   end "*";

   function "/"(X: Element_Type; Y: Element_Type) return Element_Type is
   begin
      return (X * Find_Inverse(Y)) mod Element_Type'Last;
   end "/";

   function Find_Inverse(X: Element_Type) return Element_Type;
   function GCD(X: Element_Type; Y: Element_Type) return Element_Type;
   function Is_Primitive(X: Element_Type) return Boolean;

end Sorting;
