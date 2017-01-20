package body GF2n is

   function "+"(X: Element_Type; Y: Element_Type) return Element_Type is
   begin
      return (X xor Y) mod P;
   end "+";

   function "-"(X: Element_Type; Y: Element_Type) return Element_Type is
   begin
      return (X xor Y) mod P;
   end "-";

   function "*"(X: Element_Type; Y: Element_Type) return Element_Type is
   begin
      return (X and Y) mod P;
   end "*";

   function "/"(X: Element_Type; Y: Element_Type) return Element_Type is
   begin
      return (X and Find_Inverse(Y)) mod P;
   end "/";

   function Find_Inverse(X: Element_Type) return Element_Type is
   begin
      for I in 1..Element_Type'Last loop
         if (I * X = 1) then
            return I;
         end if;
      end loop;
      --else case? inverse element expected
      return -1;
   end Find_Inverse;

   function GCD(X: Element_Type; Y: Element_Type) return Element_Type is
      R : Element_Type := 0;
      Xi : Element_Type := 0;
      Yi : Element_Type := 0;
   begin
      --exchange if Y isn't the smaller value
      if X < Y then
         Xi := Y;
         Yi := X;
      else
         Xi := X;
         Yi := Y;
      end if;

      -- loop from highest polynom to lowest in field under biggest polynom X
      for Q in reverse 1..Xi loop
         -- find Quotient Q
         if Q * Yi <= Xi then
            R := Xi - (Q * Yi);
            -- if rest is 0, Y is the founded GCD
            if R = 0 then
               return Yi;
            -- if not, iterate again with X:=Y and Y:=R
            else
               return GCD(Yi,R);
            end if;
         end if;
      end loop;
      -- else case? GCD should at least always be 1
      return -1;

--        for I in reverse 1..X loop
--           if (X mod I = 0) and (Y mod I = 0) then
--              return I;
--           end if;
--        end loop;
   end GCD;

   function Is_Primitive(X: Element_Type) return Boolean is
   begin
      for I in 1..Natural(Element_Type'Last)-1 loop
         if (X ** I mod P) /= 1 then
            return False;
         end if;
      end loop;
      -- if all elements can be represented as successive powers of X then...
      return True;
   end Is_Primitive;

end GF2n;
