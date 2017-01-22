generic
   -- Example: A type GF_2_4_Type is mod 2**4 means that we consider the
   -- elements of Galois Field (2**4).
   type Element_Type is mod <>;

   -- An irreducible polynomial P required for arithmetics.
   P: Element_Type;

package GF2n is
   function "+"(X: Element_Type; Y: Element_Type) return Element_Type;
   function "-"(X: Element_Type; Y: Element_Type) return Element_Type;
   function "*"(X: Element_Type; Y: Element_Type) return Element_Type;
   function "/"(X: Element_Type; Y: Element_Type) return Element_Type;

   -- loop over all elements of the field, if multiplying with X is 1
   -- it is the Inverse of X
   function Find_Inverse(X: Element_Type) return Element_Type;

   -- find GCD by simple Euklid
   function GCD(X: Element_Type; Y: Element_Type) return Element_Type;

   -- look if X has maximal order
   function Is_Primitive(X: Element_Type) return Boolean;
end GF2n;
