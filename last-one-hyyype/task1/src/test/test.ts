Context
	with Ada.Text_IO; use Ada.Text_IO;
	with GF2n;

***** Test 1: Addition
Define
	type GF4 is mod 2**4;
	-- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
	package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
	My_Element1 : constant GF4 := 2#1010#; -- x^3+x
	My_Element2 : constant GF4 := 2#0011#; -- x + 1
	My_GF4_Result : GF4 := 0;
Test
	-- (1010 xor 0011) mod 0011 = 0000
	My_GF4_Result := GF2n4."+"(My_Element1,My_Element2);
Pass My_GF4_Result = 2#0000#

***** Test 2: Substraction
Define
	type GF4 is mod 2**4;
	-- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
	package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
	My_Element1 : constant GF4 := 2#1010#; -- x^3+x
	My_Element2 : constant GF4 := 2#0011#; -- x + 1
	My_GF4_Result : GF4 := 0;
Test
	-- (1010 xor 0011) mod 0011 = 0000
	My_GF4_Result := GF2n4."-"(My_Element1,My_Element2);
Pass My_GF4_Result = 2#0000#

***** Test 3: Addition = Substraction
Define
	type GF4 is mod 2**4;
	-- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
	package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
	My_Element1 : constant GF4 := 2#1010#; -- x^3+x
	My_Element2 : constant GF4 := 2#0011#; -- x + 1
	My_GF4_Result1 : GF4 := 0;
	My_GF4_Result2 : GF4 := 0;
Test
	My_GF4_Result1 := GF2n4."+"(My_Element1,My_Element2);
	My_GF4_Result2 := GF2n4."-"(My_Element1,My_Element2);
Pass My_GF4_Result1 = My_GF4_Result2

***** Test 4: Multiplication
Define
	type GF4 is mod 2**4;
	-- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
	package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
	My_Element1 : constant GF4 := 2#1010#; -- x^3+x
	My_Element2 : constant GF4 := 2#0011#; -- x + 1
	My_GF4_Result : GF4 := 0;
Test
	-- (1010 and 0011) mod 0011 = 0010
	My_GF4_Result := GF2n4."*"(My_Element1,My_Element2);
Pass My_GF4_Result = 2#0010#

***** Test 5: Division
Define
	type GF4 is mod 2**4;
	-- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
	package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
	My_Element1 : constant GF4 := 2#1010#; -- x^3+x
	My_Element2 : constant GF4 := 2#0011#; -- x + 1
	My_GF4_Result : GF4 := 0;
Test
	-- (1010 and inverse(0011)) mod 0011 = 0000
	--           (    0001   )
	My_GF4_Result := GF2n4."/"(My_Element1,My_Element2);
Pass My_GF4_Result = 2#0000#

***** Test 6: Find Inverse
Define
	type GF4 is mod 2**4;
	-- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
	package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
	My_Element1 : constant GF4 := 2#1010#; -- x^3+x
	My_GF4_Result : GF4 := 0;
Test
	-- inverse(1010) mod 0011 = 1010
	-- (1010 * 1010 mod 0011 = 0001)
	My_GF4_Result := GF2n4.Find_Inverse(My_Element1);
Pass My_GF4_Result = 2#1010#

***** Test 7: GCD
Define
	type GF4 is mod 2**4;
	-- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
	package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
	My_Element1 : constant GF4 := 2#1010#; -- x^3+x
	My_Element2 : constant GF4 := 2#0011#; -- x + 1
	My_GF4_Result : GF4 := 0;
Test
	-- GCD(1010,0011) = 0011
	My_GF4_Result := GF2n4.GCD(My_Element1,My_Element2);
Pass My_GF4_Result = 2#0010#

***** Test 8: Is Primitive
Define
	type GF4 is mod 2**4;
	-- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
	package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
	My_Boolean_Result : Boolean := False;
Test
	My_Boolean_Result := GF2n4.Is_Primitive(1);
Pass My_Boolean_Result = True

***** Test 9: Is Not Primitive
Define
	type GF4 is mod 2**4;
	-- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
	package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
	My_Element1 : constant GF4 := 2#1010#; -- x^3+x
	My_Boolean_Result : Boolean := False;
Test
	My_Boolean_Result := GF2n4.Is_Primitive(My_Element1);
Pass My_Boolean_Result = False