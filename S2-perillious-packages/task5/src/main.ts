context with Graph;
	with Sms_Graph;
	with Ada.Text_IO; use Ada.Text_IO;

code Ada.Text_IO.Put_Line("Begin Testing: ");

***** Test Add Vertex success: (1)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0, Max_Size => 100);
	Is_Exception_Thrown : Boolean := False;
test   begin
		Integer_Graph.Add_Vertex(1);
		Integer_Graph.Add_Vertex(2);
	exception
		when Integer_Graph.Vertex_Is_Zero_Exception =>
			Is_Exception_Thrown := True;
		when Integer_Graph.Vertex_Already_In_Graph_Exception =>
			Is_Exception_Thrown := True;
	end;
pass   not Is_Exception_Thrown

***** Test Add Vertex_Already_In_Graph_Exception: (2)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Is_Exception_Thrown : Boolean := False;
test   Integer_Graph.Add_Vertex(1);
	begin
		Integer_Graph.Add_Vertex(1);
	exception
		when Integer_Graph.Vertex_Already_In_Graph_Exception =>
			Is_Exception_Thrown := True;
	end;
pass   Is_Exception_Thrown

***** Test Add Vertex Zero exception: (3)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Is_Exception_Thrown : Boolean := False;
test   begin
	Integer_Graph.Add_Vertex(0);
	exception
		when Integer_Graph.Vertex_Is_Zero_Exception =>
			Is_Exception_Thrown := True;
	end;
pass   Is_Exception_Thrown

***** Test Add Edge From is Zero: (4)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Is_Exception_Thrown : Boolean := False;
prepare Integer_Graph.Add_Vertex(1);
	Integer_Graph.Add_Vertex(2);
test   begin
		Integer_Graph.Add_Edge(From => 0, To => 2, Weight => 0);
	exception
		when Integer_Graph.Vertex_Is_Zero_Exception =>
			Is_Exception_Thrown := True;
	end;
pass   Is_Exception_Thrown

***** Test Add Edge To is Zero: (5)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Is_Exception_Thrown : Boolean := False;
prepare Integer_Graph.Add_Vertex(1);
	Integer_Graph.Add_Vertex(2);
test   begin
		Integer_Graph.Add_Edge(From => 1, To => 0, Weight => 0);
	exception
		when Integer_Graph.Vertex_Is_Zero_Exception =>
			Is_Exception_Thrown := True;
	end;
pass   Is_Exception_Thrown

***** Test Add Edge success: (6)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Is_Exception_Thrown : Boolean := False;
test   begin
		Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
	exception
		when Integer_Graph.Vertex_Is_Zero_Exception =>
			Is_Exception_Thrown := True;
	end;
pass   not Is_Exception_Thrown

***** Test Get_Edge_Weight success: (7)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Return_Weight : Integer := 0;
prepare Integer_Graph.Add_Vertex(1);
	Integer_Graph.Add_Vertex(2);
test   Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
	Return_Weight := Integer_Graph.Get_Edge_Weight(From => 1, To => 2);
pass Return_Weight = 32

***** Test Get_Edge_Weight not found: (8)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Return_Weight : Integer := 0;
	Is_Exception_Thrown : Boolean := False;
test begin
		Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
		Return_Weight := Integer_Graph.Get_Edge_Weight(From => 2, To => 3);
	exception
		when Integer_Graph.Edge_Not_Found_Exception =>
			Is_Exception_Thrown := True;
	end;
pass Is_Exception_Thrown

***** Test Add Edge overwrite success: (9)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
test   Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
	Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 2);
pass   Integer_Graph.Get_Edge_Weight(From => 1, To => 2) = 2

***** Test Add Edge overwrite fail: (10)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
test   Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
	Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 2);
pass   not (Integer_Graph.Get_Edge_Weight(From => 1, To => 2) = 32)

***** Test Has Edge success: (11)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
test   Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
pass   Integer_Graph.Has_Edge(From => 1, To => 2)

***** Test Has Edge fail: (12)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
prepare Integer_Graph.Add_Vertex(1);
	Integer_Graph.Add_Vertex(2);
test   Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
pass   not Integer_Graph.Has_Edge(From => 1, To => 3)

***** Test remove Edge success: (13)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
prepare Integer_Graph.Add_Vertex(1);
	Integer_Graph.Add_Vertex(2);
test   Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
pass	 Integer_Graph.Remove_Edge(From => 1, To => 2)
pass   not Integer_Graph.Has_Edge(From => 1, To => 2)

***** Test remove Edge not found: (14)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Is_Exception_Thrown : Boolean := False;
	Tmp : Boolean := True;
test   begin
		Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
		Tmp := Integer_Graph.Remove_Edge(From => 1, To => 3);
	exception
		when Integer_Graph.Edge_Not_Found_Exception =>
			Is_Exception_Thrown := True;
	end;
pass   Is_Exception_Thrown

***** Test To_Vertex_Array success: (15)
define Max_Array_Size : Natural := 10;
	package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0, Max_Size => Max_Array_Size);
	use Integer_Graph;
	Test_Vertex_Array : Integer_Graph.Vertex_Array(1..Max_Array_Size);
	Compare_To_Vertex_Array : Integer_Graph.Vertex_Array(1..Max_Array_Size) := (1,2,3,4,5,6,7,8,9,10);
prepare Integer_Graph.Add_Vertex(1);
	Integer_Graph.Add_Vertex(2);
	Integer_Graph.Add_Edge(From => 3, To => 4, Weight => 32);
	Integer_Graph.Add_Edge(From => 5, To => 6, Weight => 45);
	Integer_Graph.Add_Edge(From => 7, To => 8, Weight => 67);
	Integer_Graph.Add_Edge(From => 9, To => 10, Weight => 89);
test   Test_Vertex_Array := Integer_Graph.To_Vertex_Array;
pass   Test_Vertex_Array = Compare_To_Vertex_Array

***** Test To_Vertex_Array fail: (16)
define Max_Array_Size : Natural := 100;
	package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0, Max_Size => Max_Array_Size);
	Test_Vertex_Array : Integer_Graph.Vertex_Array(1..Max_Array_Size);
	Compare_To_Vertex_Array : Integer_Graph.Vertex_Array(1..Max_Array_Size) := (1,2,3,4,5,6,7,8,9,10, others => 0);
prepare Integer_Graph.Add_Vertex(1);
	Integer_Graph.Add_Vertex(2);
	Integer_Graph.Add_Edge(From => 3, To => 4, Weight => 32);
	Integer_Graph.Add_Edge(From => 5, To => 6, Weight => 45);
	Integer_Graph.Add_Edge(From => 7, To => 8, Weight => 67);
	Integer_Graph.Add_Edge(From => 9, To => 11, Weight => 89);
test   Test_Vertex_Array := Integer_Graph.To_Vertex_Array;
pass   not (Integer_Graph."="(Test_Vertex_Array, Compare_To_Vertex_Array))

code Ada.Text_IO.Put_Line("Sms_Graph tests: ");

***** Test Add Vertex success: (17)
define package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Is_Exception_Thrown : Boolean := False;
test   begin
		Integer_Graph.Add_Vertex(1);
		Integer_Graph.Add_Vertex(2);
	exception
		when Integer_Graph.Vertex_Is_Zero_Exception =>
			Is_Exception_Thrown := True;
		when Integer_Graph.Vertex_Already_In_Graph_Exception =>
			Is_Exception_Thrown := True;
	end;
pass   not Is_Exception_Thrown

***** Test Add Vertex_Already_In_Graph_Exception: (18)
define package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Is_Exception_Thrown : Boolean := False;
test   Integer_Graph.Add_Vertex(1);
	begin
		Integer_Graph.Add_Vertex(1);
	exception
		when Integer_Graph.Vertex_Already_In_Graph_Exception =>
			Is_Exception_Thrown := True;
	end;
pass   Is_Exception_Thrown

***** Test Add Vertex Zero exception: (19)
define package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Is_Exception_Thrown : Boolean := False;
test   begin
	Integer_Graph.Add_Vertex(0);
	exception
		when Integer_Graph.Vertex_Is_Zero_Exception =>
			Is_Exception_Thrown := True;
	end;
pass   Is_Exception_Thrown

***** Test Add Edge From is Zero: (20)
define package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Is_Exception_Thrown : Boolean := False;
prepare Integer_Graph.Add_Vertex(1);
	Integer_Graph.Add_Vertex(2);
test   begin
		Integer_Graph.Add_Edge(From => 0, To => 2, Weight => 0);
	exception
		when Integer_Graph.Vertex_Is_Zero_Exception =>
			Is_Exception_Thrown := True;
	end;
pass   Is_Exception_Thrown

***** Test Add Edge To is Zero: (21)
define package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Is_Exception_Thrown : Boolean := False;
prepare Integer_Graph.Add_Vertex(1);
	Integer_Graph.Add_Vertex(2);
test   begin
		Integer_Graph.Add_Edge(From => 1, To => 0, Weight => 0);
	exception
		when Integer_Graph.Vertex_Is_Zero_Exception =>
			Is_Exception_Thrown := True;
	end;
pass   Is_Exception_Thrown

***** Test Add Edge success: (22)
define package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Is_Exception_Thrown : Boolean := False;
test   begin
		Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
	exception
		when Integer_Graph.Vertex_Is_Zero_Exception =>
			Is_Exception_Thrown := True;
	end;
pass   not Is_Exception_Thrown

***** Test Get_Edge_Weight success: (23)
define package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Return_Weight : Integer := 0;
prepare Integer_Graph.Add_Vertex(1);
	Integer_Graph.Add_Vertex(2);
test   Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
	Return_Weight := Integer_Graph.Get_Edge_Weight(From => 1, To => 2);
pass Return_Weight = 32

***** Test Get_Edge_Weight not found: (24)
define package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Return_Weight : Integer := 0;
	Is_Exception_Thrown : Boolean := False;
test begin
		Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
		Return_Weight := Integer_Graph.Get_Edge_Weight(From => 2, To => 3);
	exception
		when Integer_Graph.Edge_Not_Found_Exception =>
			Is_Exception_Thrown := True;
	end;
pass Is_Exception_Thrown

***** Test Add Edge overwrite success: (25)
define package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
test   Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
	Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 2);
pass   Integer_Graph.Get_Edge_Weight(From => 1, To => 2) = 2

***** Test Add Edge overwrite fail: (26)
define package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
test   Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
	Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 2);
pass   not (Integer_Graph.Get_Edge_Weight(From => 1, To => 2) = 32)

***** Test Has Edge success: (27)
define package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
test   Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
pass   Integer_Graph.Has_Edge(From => 1, To => 2)

***** Test Has Edge fail: (28)
define package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
prepare Integer_Graph.Add_Vertex(1);
	Integer_Graph.Add_Vertex(2);
test   Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
pass   not Integer_Graph.Has_Edge(From => 1, To => 3)

***** Test remove Edge success: (29)
define package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
prepare Integer_Graph.Add_Vertex(1);
	Integer_Graph.Add_Vertex(2);
test   Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
pass	 Integer_Graph.Remove_Edge(From => 1, To => 2)
pass   not Integer_Graph.Has_Edge(From => 1, To => 2)

***** Test remove Edge not found: (30)
define package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Is_Exception_Thrown : Boolean := False;
	Tmp : Boolean := True;
test   begin
		Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
		Tmp := Integer_Graph.Remove_Edge(From => 1, To => 3);
	exception
		when Integer_Graph.Edge_Not_Found_Exception =>
			Is_Exception_Thrown := True;
	end;
pass   Is_Exception_Thrown

***** Test To_Vertex_Array success: (31)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	use Integer_Graph;
	Test_Vertex_Array : Integer_Graph.Vertex_Array(1..100);
	Compare_To_Vertex_Array : Integer_Graph.Vertex_Array(1..100) := (1,2,3,4,5,6,7,8,9,10, others => 0);
prepare Integer_Graph.Add_Vertex(1);
	Integer_Graph.Add_Vertex(2);
	Integer_Graph.Add_Edge(From => 3, To => 4, Weight => 32);
	Integer_Graph.Add_Edge(From => 5, To => 6, Weight => 45);
	Integer_Graph.Add_Edge(From => 7, To => 8, Weight => 67);
	Integer_Graph.Add_Edge(From => 9, To => 10, Weight => 89);
test   Test_Vertex_Array := Integer_Graph.To_Vertex_Array;
pass   Test_Vertex_Array = Compare_To_Vertex_Array

***** Test To_Vertex_Array fail: (32)
define package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
	Test_Vertex_Array : Integer_Graph.Vertex_Array(1..100);
	Compare_To_Vertex_Array : Integer_Graph.Vertex_Array(1..100) := (1,2,3,4,5,6,7,8,9,10, others => 0);
prepare Integer_Graph.Add_Vertex(1);
	Integer_Graph.Add_Vertex(2);
	Integer_Graph.Add_Edge(From => 3, To => 4, Weight => 32);
	Integer_Graph.Add_Edge(From => 5, To => 6, Weight => 45);
	Integer_Graph.Add_Edge(From => 7, To => 8, Weight => 67);
	Integer_Graph.Add_Edge(From => 9, To => 11, Weight => 89);
test   Test_Vertex_Array := Integer_Graph.To_Vertex_Array;
pass   not (Integer_Graph."="(Test_Vertex_Array, Compare_To_Vertex_Array))

code Ada.Text_IO.Put_Line("done");
